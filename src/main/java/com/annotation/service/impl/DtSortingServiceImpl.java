package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.*;
import com.annotation.model.entity.resHandle.ResSortingData;
import com.annotation.service.IDtSortingService;
import com.annotation.util.ExcelUtil;
import com.annotation.util.ResponseUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class DtSortingServiceImpl implements IDtSortingService {

    @Autowired
    DtSortingMapper dtSortingMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ExcelUtil excelUtil;
    @Autowired
    UserSubtaskMapper userSubtaskMapper;


    /**
     * 根据文件的ID查询instance+Item
     * 文本关系类别
     * @param docId
     * @return
     */
    public List<InstanceItemEntity> querySortingInstanceItem(int docId , int userId,String status,int taskId){

        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){
                List<InstanceItemEntity> instanceItemEntityList=dtSortingMapper.selectSortingInstanceItem(docId,userId,dTask.getTkid());
                return instanceItemEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<InstanceItemEntity> instanceItemEntityList=dtSortingMapper.selectSortingWithStatus(data);
                return instanceItemEntityList;
            }
        }else{
            List<InstanceItemEntity> instanceItemEntityList=dtSortingMapper.selectSorting(docId);
            return instanceItemEntityList;

        }



    }


    public List<InstanceItemEntity> getSortingDone(int subtaskId , int userId,int taskId){
        List<InstanceItemEntity> dataList = new ArrayList<>();
        InstanceItemEntity data = dtSortingMapper.selectSortingByInstanceId(subtaskId);
        dataList.add(data);
        return dataList;
    }

    public InstanceItemEntity getSortingData(int userId, int taskId){
        InstanceItemEntity data = new InstanceItemEntity();
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
                data = dtSortingMapper.selectSortingByInstanceId(pid);
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
    public InstanceItemEntity getNomalTask(DTask dTask,Task task){
        InstanceItemEntity instanceListitemEntity = new InstanceItemEntity();
        int currenttask = task.getCurrenttask();
        int startid = task.getStartid();
        instanceListitemEntity = dtSortingMapper.selectSortingByInstanceId(currenttask+startid);
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
    public InstanceItemEntity getTestTask(DTask dTask,Task task){
        Task testtask = taskMapper.selectTaskById(task.getTesttaskId());
        //检测任务的总数,确保分配的检测任务不会越界
        int totaltest = testtask.getTotaltask();
        int subtaskId = dTask.getTotaltest()%totaltest;

        InstanceItemEntity testdata = dtSortingMapper.selectSortingByInstanceId(testtask.getStartid()+subtaskId);

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

    public ResponseEntity qualityControl(int taskId,int instanceId, int userId, int[] itemIds, int[] newIndexs){
        ResponseEntity res=new ResponseEntity();
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask userSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,instanceId);
        if(userSubtask!=null){
            res = addSorting(taskId,instanceId,userId,itemIds,newIndexs);
        }else{
            contrastWithTest(userTaskInf,itemIds,newIndexs);
        }
        return res;
    }


    public ResponseEntity addSorting(int taskId,int instanceId, int userId, int[] itemIds, int[] newIndexs){

        ResponseEntity responseEntity=new ResponseEntity();
        //先判断d_task表有没有插入
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask curuserSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,instanceId);
        dtSortingMapper.deleteBeforeUpdate(userId,taskId);

        String iRes= insertSortingItem(taskId,instanceId,userId,itemIds,newIndexs);
        if(!iRes.equals("0#")){
            responseEntity.setStatus(-2);
            responseEntity.setMsg("添加失败");
            responseEntity.setData(iRes);
            return responseEntity;
        }

        userTaskInf.setPid(null);
        userTaskInf.setAlreadypart(userTaskInf.getAlreadypart()+1);
        dTaskMapper.updateByPrimaryKey(userTaskInf);
        curuserSubtask.setDone("yes");
        SimpleDateFormat sd = new SimpleDateFormat();
        curuserSubtask.setDotime(sd.format(new Date()));
        userSubtaskMapper.update(curuserSubtask);
        responseEntity.setMsg("添加做任务表成功");
        return responseEntity;
    }



    public String insertSortingItem(int taskId,int subtaskId,int userId,int[] itemIds,int[] newIndexs){

        StringBuffer sb=new StringBuffer();

        sb.append(0+"#");
        dtSortingMapper.alterDtSortingTable();
        DtSorting dtSorting=new DtSorting();
        //dtSorting.setDtId(dtid);

        for(int i=0;i<itemIds.length;i++){
            dtSorting.setTaskId(taskId);
            dtSorting.setSubtaskId(subtaskId);
            dtSorting.setUserId(userId);
            dtSorting.setItemId(itemIds[i]);
            dtSorting.setNewindex(newIndexs[i]);
            int dtdItemRelationRes = dtSortingMapper.insert(dtSorting);
            if(dtdItemRelationRes != 1 && dtdItemRelationRes != 2){
                sb=sb.append(i+"#");
            }

        }
        return sb.toString();
    }


    public void contrastWithTest(DTask dTask,int[] itemIds,int[] newIndexs){
        int testsubtaskid = dTask.getPid();
        Task testTask = taskMapper.selectTaskById(dTask.getTaskId());
        int rightnum=0;
        List<DtSorting> sortingList = dtSortingMapper.selectByTaskidAndSubtaskid(testTask.getTesttaskId(),testsubtaskid);

        for(int i = 0;i < itemIds.length;i++){
            for(DtSorting j:sortingList){
                if(itemIds[i] == j.getItemId() && newIndexs[i] == j.getItemId()){
                    rightnum++;
                }
            }
        }

        int totaltest = dTask.getTotaltest();
        dTask.setTotaltest(totaltest+1);
        float currentaccuracy =(float) (rightnum/itemIds.length);
        System.out.println(currentaccuracy);
        float accuracy = Float.valueOf(dTask.getAccuracy());
        float newaccuracy = (accuracy*totaltest+currentaccuracy)/(totaltest+1);
        dTask.setAccuracy(String.valueOf(newaccuracy));
        dTask.setPid(null);
        dTask.setCurrentStatus("notest");
        dTaskMapper.updateByPrimaryKey(dTask);
    }

public int[] insertSortingItem2(int dtid,int[] itemIds,int[] newIndexs){

    int[] res=new int[itemIds.length];
    dtSortingMapper.alterDtSortingTable();
    DtSorting dtSorting=new DtSorting();
    //dtSorting.setDtId(dtid);
    for(int i=0;i<itemIds.length;i++){
        dtSorting.setItemId(itemIds[i]);
        dtSorting.setNewindex(newIndexs[i]);
        int dtdItemRelationRes = dtSortingMapper.insert(dtSorting);
        if(dtdItemRelationRes != 1 && dtdItemRelationRes != 2){
            res[i]=-1;
        }else{
            res[i]=1;
        }

    }
    return res;
}


    public List<SortingData> querySortingData(int tid){
        List<SortingData> sortingDataList=dtSortingMapper.getSortingDataOut(tid);
        return sortingDataList;
    }


    public HSSFWorkbook getSortingExcel(List<SortingData> sortingDataList){
        String[] title = {"文件名","任务序号","段落序号","原序号","列表分句","新序号"};
        String sheetName = "排序类型数据导出";
        HSSFWorkbook wb = excelUtil.getSortingExcel(sheetName, title, sortingDataList, null);
        return wb;
    }


    public List<ResSortingData> queryResSortingData(int tid, int docId, int instanceIndex){
        List<ResSortingData> resSortingDataList=dtSortingMapper.getResSortingData(tid,docId,instanceIndex);
        return resSortingDataList;
    }

    public List<ExportSortingData> querySortingDataAndroid(int tid){
        List<ExportSortingData> sortingDataList=dtSortingMapper.getSortingDataOutAndroid(tid);
        return sortingDataList;
    }


    public InstanceItemEntity getLastSortingData(int userId, int taskId,int subtaskId){
        InstanceItemEntity data;
        //List<DtExtraction> entityList;
        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask currentTask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        //currentTask为null表示当前为检测任务，返回最后一个用户完成的任务
        if(currentTask == null){
            UserSubtask theLasttask = userSubtaskMapper.selectTheLastData(userId,taskId);
            data = dtSortingMapper.selectSortingByInstanceId(theLasttask.getSubtaskId());
            //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,theLasttask.getSubtaskId());
            //List<Map<String, Object>> entityDone = transforEntityList(entityList);
            return data;
        }
        //返回上一个任务
        UserSubtask userSubtask = userSubtaskMapper.selectLastData(userId,taskId,subtaskId);
        System.out.println("getLastExtractionData"+userId+" "+taskId+" "+subtaskId);
        //如果没有上一个任务，则直接返回null
        if(userSubtask == null){return null;}
        data = dtSortingMapper.selectSortingByInstanceId(userSubtask.getSubtaskId());
        //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,userSubtask.getSubtaskId());
        //List<Map<String, Object>> entityDone = transforEntityList(entityList);
        return data;
    }

    /**当前任务可能有三种位置，为最后一个任务，为倒数第二个任务，为其他位置的任务
     * 在最后一个任务时，可能为①检测任务；②普通任务，而下一个位置，可能为①检测任务；②普通任务
     * 在倒数第二个任务时，当前任务只能为普通任务，但是下一个任务可能为①检测任务；②普通任务
     * 在其他位置时，当前任务只能为普通任务，下一个任务只能为普通任务
     */
    public ResponseEntity getNextSortingData(int userId, int taskId,int subtaskId){
        ResponseEntity data = new ResponseEntity();
        InstanceItemEntity subtaskdata;
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
                        InstanceItemEntity subtask = dtSortingMapper.selectSortingByInstanceId(dTask.getPid());
                        //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,subtaskId);
                        //List<Map<String, Object>> entityDone = transforEntityList(entityList);
                        data.setData(subtask);
                        return data;
                    }else{
                        //任务已完成，分配新任务
                        subtaskdata = getSortingData(userId,taskId);
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
                InstanceItemEntity subtask = dtSortingMapper.selectSortingByInstanceId(nextSubtask.getSubtaskId());
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
                subtaskdata = getSortingData(userId,taskId);
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
