package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.*;
import com.annotation.model.entity.resHandle.ResPairingData;
import com.annotation.service.IDtPairingService;
import com.annotation.util.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.xmlbeans.impl.xb.xsdschema.Public;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class DtPairingServiceImpl implements IDtPairingService {

    @Autowired
    DtPairingMapper dtPairingMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ExcelUtil excelUtil;
    @Autowired
    UserSubtaskMapper userSubtaskMapper;



    /**
     * 根据文件ID查询instance+listitem
     * 文本配对关系
     * @param docId
     * @return
     */
    public List<InstanceListitemEntity> queryInstanceListitem(int docId, int userId,String status,int taskId){

        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){

                List<InstanceListitemEntity> instanceListitemEntityList=dtPairingMapper.selectInstanceListitem(docId,userId,dTask.getTkid());
                return instanceListitemEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<InstanceListitemEntity> instanceListitemEntityList=dtPairingMapper.selectPairingWithStatus(data);
                return instanceListitemEntityList;
            }
        }else{
            List<InstanceListitemEntity> instanceListitemEntityList=dtPairingMapper.selectPairing(docId);
            return instanceListitemEntityList;
        }



    }


    public List<InstanceListitemEntity> getInstanceDone(int subtaskId, int userId,int taskId){
        List<InstanceListitemEntity> dataList = new ArrayList<>();
        InstanceListitemEntity data = dtPairingMapper.selectPairingByInstanceId(subtaskId);
        dataList.add(data);
        return dataList;
    }

    public InstanceListitemEntity getPairingData(int userId, int taskId){
        InstanceListitemEntity data = new InstanceListitemEntity();
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        int pid;
        Task task = taskMapper.selectTaskById(taskId);
        String iftest = task.getIftest();
        int currenttask = task.getCurrenttask();
        int curfrequence = task.getFrequence();
        int totaltask = task.getTotaltask();
        int startpid = task.getStartid();
        //先看之前有没有领取过任务，有就则继续派发，再看领取的任务完成与否
        if (dTask!=null) {
            if(dTask.getPid() != null){
                //已经领取了任务，但未完成，普通任务和检测任务获取方式一样
                pid = dTask.getPid();
                data = dtPairingMapper.selectPairingByInstanceId(pid);
                return data;
            }else{
                //重新领取任务
                int alreadypart = dTask.getAlreadypart();
                float interval = Float.valueOf(dTask.getAccuracy());
                int actualint = (int)interval*20;//实际检测间隔
                //分配任务给用户，首先查询任务是否分配完成，其次查看是否需要分配测试任务
                //1.判断任务是否分配完了
                if(currenttask == totaltask){
                    if(task.getTesttaskId()!=null && task.getIftest().equals("test")){
                        Task maintask = taskMapper.selectTaskById(task.getTesttaskId());
                        maintask.setIftest("yes");
                        taskMapper.updateById(maintask);
                    }
                    return null;
                }

                //检测间隔,查看是否分配检测任务
                //如果系统有检测用例，并且达到了检测间隔，则分配检测任务
                if(iftest.equals("yes") && alreadypart%actualint==0){
                    data = getTestTask(dTask,task);
                    return data;
                }

                //申请普通任务
                data = getNomalTask(dTask,task);
                return data;
            }
        } else {
            if(currenttask == totaltask){return null;}
            //从未领取过任务,先创建DTask记录，能测试则直接测试，否则直接发送普通任务。
            dTask = getDTask(task,userId);
            if(iftest.equals("yes")){
                data = getTestTask(dTask,task);
                return data;
            }
            //申请普通任务
            data = getNomalTask(dTask,task);
            return data;
        }
    }



    public DTask getDTask(Task task,int userId){
        DTask dTask=new DTask();
        dTask.setUserId(userId);
        dTask.setTaskId(task.getTid());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        dTask.setDotime(df.format(new Date()));
        dTask.setDstatus("进行中");
        dTask.setDpercent("0");
        int totalPart=instanceMapper.countTotalPart(task.getTid());
        dTask.setTotalpart(totalPart);
        dTask.setAlreadypart(0);
        dTask.setCurrentStatus("notest");
        dTask.setTotaltest(0);
        dTask.setAccuracy("1");
        dTaskMapper.insert(dTask);
        return dTask;
    }

    /**
     * 只管分配普通任务，并更新数据库,分配任务了任务，currenttask立马更新
     * 分配一个普通任务，则在user_task中创建一条记录
     *
     * */
    public InstanceListitemEntity getNomalTask(DTask dTask,Task task){
        InstanceListitemEntity instanceListitemEntity = new InstanceListitemEntity();
        int currenttask = task.getCurrenttask();
        int startid = task.getStartid();
        instanceListitemEntity = dtPairingMapper.selectPairingByInstanceId(currenttask+startid);
        dTask.setPid(currenttask+startid);
        dTaskMapper.updateByPrimaryKey(dTask);

        currenttask++;
        task.setCurrenttask(currenttask);
        taskMapper.updateById(task);

        //创建user_task记录
        UserSubtask userSubtask = new UserSubtask(dTask.getUserId(),dTask.getTaskId(),dTask.getPid(),"no");
        userSubtaskMapper.insert(userSubtask);
        return instanceListitemEntity;
    }

    //只管分配检测任务，并更新数据库
    public InstanceListitemEntity getTestTask(DTask dTask,Task task){
        Task testtask = taskMapper.selectTaskById(task.getTesttaskId());
        ParagraphLabelEntity paragraphLabelEntity = new ParagraphLabelEntity();
        //检测任务的总数,确保分配的检测任务不会越界
        int totaltest = testtask.getTotaltask();
        int subtaskId = dTask.getTotaltest()%totaltest;

        InstanceListitemEntity testdata = dtPairingMapper.selectPairingByInstanceId(testtask.getStartid()+subtaskId);

        System.out.println(testdata);
        //更新用户当前申请的任务

        dTask.setTaskId(task.getTid());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        dTask.setDotime(df.format(new Date()));
        dTask.setCurrentStatus("test");
        dTask.setPid(testdata.getInstid());
        dTaskMapper.updateByPrimaryKey(dTask);
        return testdata;
    }


    public String qualityControl(int taskId,int docId,int subtaskId,int userId,int[] aListItemId,int[] bListItemId,String taskType){
        String responseEntity = "";
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask userSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        if(userSubtask!=null){
            responseEntity =addPairing(taskId,docId,subtaskId,userId,aListItemId,bListItemId,taskType);
        }else{
            contrastWithTest(userTaskInf,aListItemId,bListItemId);
        }
        return responseEntity;
    }

    /**
     * 做任务---文本关系配对
     * todo:更新状态的逻辑
     * todo:了解数据库事务

     * @return
     */
//    @Transactional
//    public String addPairing(int taskId,int docId,int instanceId,int userId,int[] aListItemId,int[] bListItemId,String taskType){
//        //先判断d_task表有没有插入
//        int dTaskId;
//        DTask dTaskSelect=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
//        if(dTaskSelect != null){
//            dTaskId=dTaskSelect.getTkid();
//        }else{
//            DTask dTask=new DTask();
//            dTask.setUserId(userId);
//            dTask.setTaskId(taskId);
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//            dTask.setDotime(df.format(new Date()));
//            dTask.setDstatus("进行中");
//            dTask.setDpercent("0%");
//
//            int totalPart=instanceMapper.countTotalPart(taskId);
//            dTask.setTotalpart(totalPart);
//            dTask.setAlreadypart(0);
//
//            int dTaskRes=dTaskMapper.insert(dTask);
//            if(dTaskRes<0){
//                return "-1";
//            }else{
//                dTaskId=dTask.getTkid();
//            }
//
//            Task task=taskMapper.selectTaskById(taskId);
//            task.setAttendnum(task.getAttendnum()+1);
//            int taskRes=taskMapper.updateById(task);
//            if(taskRes<0){
////                responseEntity=responseUtil.judgeResult(4005);
////                return responseEntity;
//            }
//
//
//        }
//
//        //插入d_instance
//        int dtid;
//        DInstance dInstanceSelect=dInstanceMapper.selectByDtaskIdAndInstId(dTaskId,instanceId,docId);
//
//        if(dInstanceSelect!=null){
//
//            dtid=dInstanceSelect.getDtid();
//        }else{
//            dInstanceMapper.alterDInstanceTable();
//            DInstance dInstance =new DInstance();
//            dInstance.setDocumentId(docId);
//            dInstance.setDtaskId(dTaskId);
//            dInstance.setDtstatus("进行中");
//            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//            dInstance.setDotime(df.format(new Date()));
//            dInstance.setInstanceId(instanceId);
//
//            int dParaRes=dInstanceMapper.insert(dInstance);
//            if(dParaRes<0){
//                return "-2";
//            }else{
//                dtid=dInstance.getDtid();
//            }
//
//
//        }
//
//        dtPairingMapper.alterDtPairingTable();
//        if(taskType.equals("文本配对#一对一")){
//            String iRes=insertOneToOneRelations(dtid,aListItemId,bListItemId);
//            if(!iRes.equals("0")){
//                return iRes;
//            }
//        }else if(taskType.equals("文本配对#一对多")){
//            String iRes=insertOneToManyRelations(dtid,aListItemId,bListItemId);
//            if(!iRes.equals("0")){
//                return iRes;
//            }
//        }else if(taskType.equals("文本配对#多对多")){
//            String iRes=insertManyToManyRelations(dtid,aListItemId,bListItemId);
//            if(!iRes.equals("0")){
//                return iRes;
//            }
//        }
//
//        //返回做任务ID
//        return dtid+"";
//    }


    public String addPairing(int taskId,int docId,int instanceId,int userId,int[] aListItemId,int[] bListItemId,String taskType){
        StringBuffer sb=new StringBuffer("");
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask curuserSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,instanceId);
        dtPairingMapper.deleteBeforeUpdate(userId,taskId,instanceId);

        for(int i=0;i<aListItemId.length;i++){
            DtPairing currentdata = new DtPairing();
            currentdata.setTaskId(taskId);
            currentdata.setSubtaskId(instanceId);
            currentdata.setUserId(userId);
            currentdata.setaLitemid(aListItemId[i]);
            currentdata.setbLitemid(bListItemId[i]);
            int dtdItemRelationRes = dtPairingMapper.insertPairing(currentdata);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }


        userTaskInf.setPid(null);
        userTaskInf.setAlreadypart(userTaskInf.getAlreadypart()+1);
        dTaskMapper.updateByPrimaryKey(userTaskInf);
        curuserSubtask.setDone("yes");
        SimpleDateFormat sd = new SimpleDateFormat();
        curuserSubtask.setDotime(sd.format(new Date()));
        userSubtaskMapper.update(curuserSubtask);
        return sb.toString();
    }


    public void contrastWithTest(DTask userTaskInf,int[] aListItemId,int[] bListItemId){}


    public String insertOneToOneRelations(int dtInstId,int[] aListitemId,int[] bListitemId){

        StringBuffer sb=new StringBuffer();

        sb.append(0);

        for(int i=0;i<aListitemId.length;i++){
            int dtdItemRelationRes = dtPairingMapper.insertRelationListByOneToOne(dtInstId,aListitemId[i],bListitemId[i]);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }
        return sb.toString();
    }


    public String insertOneToManyRelations(int dtInstId,int[] aListitemId,int[] bListitemId){

        StringBuffer sb=new StringBuffer();

        sb.append(0);

        for(int i=0;i<aListitemId.length;i++){
            int dtdItemRelationRes = dtPairingMapper.insertRelationListByOneToMany(dtInstId,aListitemId[i],bListitemId[i]);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }
        return sb.toString();
    }


    public String insertManyToManyRelations(int dtInstId,int[] aListitemId,int[] bListitemId){

        StringBuffer sb=new StringBuffer();

        sb.append(0);

        for(int i=0;i<aListitemId.length;i++){
            int dtdItemRelationRes = dtPairingMapper.insertRelationListByManyToMany(dtInstId,aListitemId[i],bListitemId[i]);
            if(dtdItemRelationRes != 1){
                sb=sb.append(i+"#");
            }
        }
        return sb.toString();
    }





   public List<PairingData> queryPairingData(int tid){
        List<PairingData> pairingDataList=dtPairingMapper.getPairingDataOut(tid);
        return pairingDataList;
   }


   public HSSFWorkbook getPairingExcel( List<PairingData> pairingDataList){
       String[] title = {"文件名","段落索引","列表1","列表2"};

       String sheetName = "文本配对数据导出";


           HSSFWorkbook wb = excelUtil.getPairingExcel(sheetName, title, pairingDataList, null);
           return wb;


   }

    public List<ResPairingData> queryResPairingData(int tid, int docId, int instanceIndex){
        List<ResPairingData> resPairingDataList=dtPairingMapper.getResPairingData(tid,docId,instanceIndex);
        return resPairingDataList;
    }


    public InstanceListitemEntity getLastPairingData(int userId, int taskId,int subtaskId){
        InstanceListitemEntity data;
        //List<DtExtraction> entityList;
        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask currentTask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        //currentTask为null表示当前为检测任务，返回最后一个用户完成的任务
        if(currentTask == null){
            UserSubtask theLasttask = userSubtaskMapper.selectTheLastData(userId,taskId);
            data = dtPairingMapper.selectPairingByInstanceId(theLasttask.getSubtaskId());
            //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,theLasttask.getSubtaskId());
            //List<Map<String, Object>> entityDone = transforEntityList(entityList);
            return data;
        }
        //返回上一个任务
        UserSubtask userSubtask = userSubtaskMapper.selectLastData(userId,taskId,subtaskId);
        System.out.println("getLastExtractionData"+userId+" "+taskId+" "+subtaskId);
        //如果没有上一个任务，则直接返回null
        if(userSubtask == null){return null;}
        data = dtPairingMapper.selectPairingByInstanceId(userSubtask.getSubtaskId());
        //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,userSubtask.getSubtaskId());
        //List<Map<String, Object>> entityDone = transforEntityList(entityList);
        return data;
    }

    /**当前任务可能有三种位置，为最后一个任务，为倒数第二个任务，为其他位置的任务
     * 在最后一个任务时，可能为①检测任务；②普通任务，而下一个位置，可能为①检测任务；②普通任务
     * 在倒数第二个任务时，当前任务只能为普通任务，但是下一个任务可能为①检测任务；②普通任务
     * 在其他位置时，当前任务只能为普通任务，下一个任务只能为普通任务
     */
    public ResponseEntity getNextPairingData(int userId, int taskId,int subtaskId){
        ResponseEntity data = new ResponseEntity();
        InstanceListitemEntity subtaskdata;
        //List<DtExtraction> entityList;
        UserSubtask currentSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask nextSubtask = userSubtaskMapper.selectNextData(userId,taskId,subtaskId);
        //判断当前任务是否为普通任务
        if(currentSubtask != null){
            if(nextSubtask == null){
                if(currentSubtask.getDone().equals("no")){
                    //当前任务未标注
                    data.setStatus(5000);
                    data.setMsg("当前任务未提交");
                    return data;
                }else{
                    if(dTask.getCurrentStatus().equals("test")){
                        //返回test任务
                        InstanceListitemEntity subtask = dtPairingMapper.selectPairingByInstanceId(dTask.getPid());
                        //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,subtaskId);
                        //List<Map<String, Object>> entityDone = transforEntityList(entityList);
                        data.setData(subtask);
                        return data;
                    }else{
                        //任务已完成，分配新任务
                        subtaskdata = getPairingData(userId,taskId);
                        if(subtaskdata == null){
                            data.setStatus(5001);
                            data.setMsg("任务已完成！");
                        }else{
                            //重新分配新的任务
                            data.setData(subtaskdata);
                        }
                        return data;
                    }
                }
            }else{
                //当前任务后面有已完成的任务，返回下一个任务
                InstanceListitemEntity subtask = dtPairingMapper.selectPairingByInstanceId(nextSubtask.getSubtaskId());
                //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,nextSubtask.getSubtaskId());
                //List<Map<String, Object>> entityDone = transforEntityList(entityList);
                data.setData(subtask);
                return data;
            }
        }else{
            if(dTask.getCurrentStatus().equals("test")){
                //当前测试任务未完成
                data.setStatus(5000);
                data.setMsg("当前任务未提交");
            }else{
                //重新申请任务
                subtaskdata = getPairingData(userId,taskId);
                if(subtaskdata == null){
                    data.setStatus(5001);
                    data.setMsg("任务已完成！");
                }else{
                    data.setData(subtaskdata);
                }

            }
            return data;
        }
    }



}
