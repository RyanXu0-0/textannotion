package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.*;
import com.annotation.service.IDParagraphService;
import com.annotation.service.IDTaskService;
import com.annotation.service.IDtClassifyService;
import com.annotation.util.ExcelUtil;
import com.annotation.util.ResponseUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class DtClassifyServiceImpl implements IDtClassifyService {

    @Autowired
    DtClassifyMapper dtClassifyMapper;
    @Autowired
    IDTaskService idTaskService;
    @Autowired
    IDParagraphService idParagraphService;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DParagraphMapper dParagraphMapper;
    @Autowired
    ParagraphMapper paragraphMapper;
    @Autowired
    DtuCommentMapper dtuCommentMapper;
    @Autowired
    ExcelUtil excelUtil;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    UserSubtaskMapper userSubtaskMapper;
    @Autowired
    ResponseUtil responseUtil;
    /**
     * 查询content+label，可能不上

     * @return
     */
    public List<ParagraphLabelEntity> queryClassifyParaLabel(int docId, int userId,String status,int taskId){
        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){
                List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassifyParaLabel(docId,userId,dTask.getTkid());
                return contentLabelEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassifyWithStatus(data);
                return contentLabelEntityList;
            }
        }else{
            List<ParagraphLabelEntity> contentLabelEntityList=dtClassifyMapper.selectClassify(docId);
            return contentLabelEntityList;
        }

    }

    public ParagraphLabelEntity getClassifyDone(int subtaskId, int userId,int taskId){
        ParagraphLabelEntity data = dtClassifyMapper.selectCurrentDone(subtaskId);
        return data;
    }

/**
 * 从列表中选取任务时，会根据任务状态，分配普通任务或者检测任务，若已经没有任务，则分配为null
 *
 * */
    public ParagraphLabelEntity getClassifyData(int userId, int taskId){
        ParagraphLabelEntity data = new ParagraphLabelEntity();
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
                //已经领取了任务，但未完成
                pid = dTask.getPid();
                Paragraph paragraph = paragraphMapper.selectByPrimaryKey(pid);
                data = new ParagraphLabelEntity(paragraph);
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

    public ResponseEntity qualityControl(int userId,int taskId,int subtaskId,int docId,int[] labelId){
        ResponseEntity responseEntity = new ResponseEntity();
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask userSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(taskId,subtaskId);
        if(userSubtask!=null){
            addClassify(taskId,subtaskId,labelId);
        }else{
            contrastWithTest(userTaskInf,labelId);
        }
        return responseEntity;
    }


    /**
     *
     * 
     * @param taskId
     *
     * @param subtaskId
     * @param labelId
     * @return
     */
    public ResponseEntity addClassify(int taskId,int subtaskId,int[] labelId){

        //先判断d_task表有没有插入
        ResponseEntity responseEntity = new ResponseEntity();
        UserSubtask curuserSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(taskId,subtaskId);
        int userId = curuserSubtask.getUserId();
        dtClassifyMapper.deleteBeforeUpdate(userId,taskId,subtaskId);
        dtClassifyMapper.alterDtClassifyTable();
        for(int i=0;i<labelId.length;i++){
            DtClassify dtClassify =new DtClassify();
            dtClassify.setTaskId(taskId);
            dtClassify.setSubtaskId(subtaskId);
            dtClassify.setUserId(userId);
            dtClassify.setLabelId(labelId[i]);
            dtClassify.setGoodlabel(0);
            dtClassify.setBadlabel(0);
            int dtClassifyRes=dtClassifyMapper.insert(dtClassify);
            if(dtClassifyRes<0){
                return responseUtil.judgeResult(4004);
            }
        }

        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        dTask.setPid(null);
        dTask.setAlreadypart(dTask.getAlreadypart()+1);
        dTaskMapper.updateByPrimaryKey(dTask);
        curuserSubtask.setDone("yes");
        SimpleDateFormat sd = new SimpleDateFormat();
        curuserSubtask.setDotime(sd.format(new Date()));
        userSubtaskMapper.update(curuserSubtask);
        return responseEntity;

    }

    public void contrastWithTest(DTask dTask,int[] labelId){
        int testsubtaskid = dTask.getPid();
        Task testTask = taskMapper.selectTaskById(dTask.getTaskId());
        int rightlabel = 0;
        List<DtClassify> dataList = dtClassifyMapper.selectByTaskidAndSubtaskid(testTask.getTesttaskId(),testsubtaskid);
        for(int i:labelId){
            for(DtClassify j:dataList){
                if(i == j.getLabelId()){
                    rightlabel++;
                }
            }
        }

        int totaltest = dTask.getTotaltest();
        dTask.setTotaltest(totaltest+1);
        float currentaccuracy =(float) (rightlabel)/(dataList.size());
        System.out.println(currentaccuracy);
        float accuracy = Float.valueOf(dTask.getAccuracy());
        float newaccuracy = (accuracy*totaltest+currentaccuracy)/(totaltest+1);
        dTask.setAccuracy(String.valueOf(newaccuracy));
        dTask.setPid(null);
        dTask.setCurrentStatus("notest");
        dTaskMapper.updateByPrimaryKey(dTask);
    }


   public DtClassify addComment(int dtdId,int cNum,int flag,int uId){
       DtClassify dtClassify=dtClassifyMapper.selectByPrimaryKey(dtdId);
        if(flag>0){
            dtClassify.setGoodlabel(dtClassify.getGoodlabel()+cNum);
            int res=dtClassifyMapper.updateByPrimaryKey(dtClassify);
            if(cNum>0){

                DtuComment dtuComment=new DtuComment();
                dtuComment.setDtdId(dtdId);
                dtuComment.setuId(uId);
                dtuComment.setCnum(1);
                int res2=dtuCommentMapper.insert(dtuComment);
            }else{

                int res3=dtuCommentMapper.deleteByDtdIdAndUId(dtdId,uId);
            }
        }else{
            dtClassify.setBadlabel(dtClassify.getBadlabel()+cNum);
            int res=dtClassifyMapper.updateByPrimaryKey(dtClassify);
            if(cNum>0){

                DtuComment dtuComment=new DtuComment();
                dtuComment.setDtdId(dtdId);
                dtuComment.setuId(uId);
                dtuComment.setCnum(-1);
                int res2=dtuCommentMapper.insert(dtuComment);
            }else{

                int res3=dtuCommentMapper.deleteByDtdIdAndUId(dtdId,uId);
            }
        }
        DtClassify dtClassifyRes=dtClassifyMapper.selectByPrimaryKey(dtdId);
        return dtClassifyRes;
   }


   public List<LabelCountEntity> queryAlreadyLabel(int tid){
       List<LabelCountEntity> labelCountEntityList=dtClassifyMapper.selectLabelCount(tid);
       return  labelCountEntityList;
   }



    public List<ClassifyData> queryClassifyData(int tid){
        List<ClassifyData> classifyDataList=dtClassifyMapper.getClassifyDataOut(tid);
        return classifyDataList;
    }


    public HSSFWorkbook getClassifyExcel(List<ClassifyData> classifyDataList){
        String[] title = {"文件名","段落序号","段落内容","标签"};
        String sheetName = "文本分类数据导出";
        HSSFWorkbook wb = excelUtil.getClassifyExcel(sheetName, title, classifyDataList, null);
        return wb;
    }


    public DTask getDTask(Task task,int userId){
        DTask dTask=new DTask();
        dTask.setUserId(userId);
        dTask.setTaskId(task.getTid());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        dTask.setDotime(df.format(new Date()));
        dTask.setDstatus("进行中");
        dTask.setDpercent("0");
        int totalPart=paragraphMapper.countTotalPart(task.getTid());
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
    public ParagraphLabelEntity getNomalTask(DTask dTask,Task task){
        ParagraphLabelEntity paragraphLabelEntity = new ParagraphLabelEntity();
        int currenttask = task.getCurrenttask();
        int startid = task.getStartid();
        Paragraph paragraph = paragraphMapper.selectByPrimaryKey(currenttask+startid);
        paragraphLabelEntity = new ParagraphLabelEntity(paragraph);
        dTask.setPid(currenttask+startid);
        dTaskMapper.updateByPrimaryKey(dTask);

        currenttask++;
        task.setCurrenttask(currenttask);
        taskMapper.updateById(task);

        //创建user_task记录
        UserSubtask userSubtask = new UserSubtask(dTask.getUserId(),dTask.getTaskId(),dTask.getPid(),"no");
        userSubtaskMapper.insert(userSubtask);
        return paragraphLabelEntity;
    }

    //只管分配检测任务，并更新数据库
    public ParagraphLabelEntity getTestTask(DTask dTask,Task task){
        Task testtask = taskMapper.selectTaskById(task.getTesttaskId());
        ParagraphLabelEntity paragraphLabelEntity = new ParagraphLabelEntity();
        //检测任务的总数,确保分配的检测任务不会越界
        int totaltest = testtask.getTotaltask();
        int subtaskId = dTask.getTotaltest()%totaltest;

        Paragraph testdata = paragraphMapper.selectByPrimaryKey(testtask.getStartid()+subtaskId);

        System.out.println(testdata);
        paragraphLabelEntity.setParacontent(testdata.getParacontent());
        paragraphLabelEntity.setPid(testdata.getPid());
        //更新用户当前申请的任务

        dTask.setTaskId(task.getTid());
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        dTask.setDotime(df.format(new Date()));
        dTask.setCurrentStatus("test");
        dTask.setPid(testdata.getPid());
        dTaskMapper.updateByPrimaryKey(dTask);
        return paragraphLabelEntity;
    }

    public ParagraphLabelEntity getLastClassifyData(int userId, int taskId,int subtaskId){
        ParagraphLabelEntity data;
        Paragraph paragraph = new Paragraph();
        List<DtClassify> alreadyList;
        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask currentTask = userSubtaskMapper.selectByUserIdAndSubtaskId(taskId,subtaskId);
        //currentTask为null表示当前为检测任务，返回最后一个用户完成的任务
        if(currentTask == null){
            //获取最后一个任务
            UserSubtask theLasttask = userSubtaskMapper.selectTheLastData(userId,taskId);
            data = dtClassifyMapper.selectCurrentDone(theLasttask.getSubtaskId());
            return data;
        }
        //获取上一个任务
        UserSubtask userSubtask = userSubtaskMapper.selectLastData(userId,taskId,subtaskId);
        System.out.println("getLastExtractionData"+userId+" "+taskId+" "+subtaskId);
        //如果没有上一个任务，则直接返回null
        if(userSubtask == null){return null;}
        data = dtClassifyMapper.selectCurrentDone(userSubtask.getSubtaskId());
        return data;
    }



    /**当前任务可能有三种位置，为最后一个任务，为倒数第二个任务，为其他位置的任务
     * 在最后一个任务时，可能为①检测任务；②普通任务，而下一个位置，可能为①检测任务；②普通任务
     * 在倒数第二个任务时，当前任务只能为普通任务，但是下一个任务可能为①检测任务；②普通任务
     * 在其他位置时，当前任务只能为普通任务，下一个任务只能为普通任务
     */
    public ResponseEntity getNextClassifyData(int userId, int taskId,int subtaskId){
        ResponseEntity data = new ResponseEntity();
        ParagraphLabelEntity subtaskdata;
        List<DtClassify> entityList;
        UserSubtask currentSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(taskId,subtaskId);
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
                        Paragraph subtask = paragraphMapper.selectByPrimaryKey(dTask.getPid());
                        subtaskdata = dtClassifyMapper.selectCurrentDone(subtaskId);
                        //List<Map<String, Object>> entityDone = transforEntityList(entityList);
                        //List<Map<String, Object>> relationDone = transforRelationList(relationList);
                        data.setData(subtaskdata);
                        return data;
                    }else{
                        //任务已完成，分配新任务
                        subtaskdata = getClassifyData(userId,taskId);
                        if(subtaskdata == null){
                            data.setStatus(5001);
                            data.setMsg("任务已完成！");
                        }else{
                            data.setData(subtaskdata);
                        }
                        return data;
                    }
                }
            }else{
                //当前任务后面有已完成的任务，返回下一个任务
                subtaskdata = dtClassifyMapper.selectCurrentDone(nextSubtask.getSubtaskId());
                data.setData(subtaskdata);
                return data;
            }
        }else{
            if(dTask.getCurrentStatus().equals("test")){
                //当前测试任务未完成
                data.setStatus(5000);
                data.setMsg("当前任务未提交");
            }else{
                //重新申请任务
                subtaskdata = getClassifyData(userId,taskId);
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


    //任务管理查看上一个任务
    public ParagraphLabelEntity getLastDone(int taskId,int subtaskId){
        ParagraphLabelEntity data;
        UserSubtask lasttask = userSubtaskMapper.selectLastDone(taskId,subtaskId);
        if(lasttask == null){ return null; }
        data = dtClassifyMapper.selectCurrentDone(lasttask.getSubtaskId());
        return data;
    }

    //任务管理查看下一个任务
    public ParagraphLabelEntity getNextDone(int taskId,int subtaskId){
        ParagraphLabelEntity data;
        UserSubtask nexttask = userSubtaskMapper.selectNextDone(taskId,subtaskId);
        if(nexttask == null){ return null; }
        data = dtClassifyMapper.selectCurrentDone(nexttask.getSubtaskId());
        return data;
    }
}
