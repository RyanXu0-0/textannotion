package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.DtExtractionRelation;
import com.annotation.model.entity.*;
import com.annotation.service.IDParagraphService;
import com.annotation.service.IDTaskService;
import com.annotation.service.IDtExtractionService;
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
 * 信息抽取类型
 */
@Repository
public class DtExtractionServiceImpl implements IDtExtractionService {

    @Autowired
    DtExtractionMapper dtExtractionMapper;
    @Autowired
    IDTaskService idTaskService;
    @Autowired
    IDParagraphService idParagraphService;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    ParagraphMapper paragraphMapper;
    @Autowired
    DtExtractionRelationMapper dtExtractionRelationMapper;
    @Autowired
    TestExtractionDataMapper testExtractionDataMapper;
    @Autowired
    TestExtractionEntityMapper testExtractionEntityMapper;
    @Autowired
    TestExtractionRelMapper testExtractionRelMapper;
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    UserSubtaskMapper userSubtaskMapper;
    @Autowired
    ExcelUtil excelUtil;
    /**
     * 信息抽取查询详情
     * @param docId
     * @param userId
     * @return
     */
    public List<ParagraphLabelEntity> queryExtractionParaLabel(int docId, int userId,String status,int taskId){


        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        System.out.println("docId"+docId);
        if(dTask!=null){
            if(status.equals("全部")){
                List<ParagraphLabelEntity> contentLabelEntityList=dtExtractionMapper.selectExtractionParaLabel(docId,userId,dTask.getTkid(),taskId);
                return contentLabelEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("taskId",taskId);
                data.put("dTaskId",dTask.getTkid());
                List<ParagraphLabelEntity> contentLabelEntityList=dtExtractionMapper.selectExtractionWithStatus(data);
                return contentLabelEntityList;
            }
        }else{
            List<ParagraphLabelEntity> contentLabelEntityList=dtExtractionMapper.selectExtraction(docId);
            return contentLabelEntityList;
        }


    }


    /**
     * 信息抽取做任务
     * @param userId

     * @return
     */
    public int addExtraction(int userId,int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd){

//        int dTaskId=idTaskService.addDTaskOfPara(userId,taskId);
//        if(dTaskId==4001|| dTaskId==4005){
//            return dTaskId;
//        }
//
//        int dtid=idParagraphService.addDParagraph(dTaskId,docId,paraId);
//        if(dtid==4002){
//            return dtid;
//        }
//
//        dtExtractionMapper.alterDtExtractionTable();
//        DtExtraction dtExtraction =new DtExtraction();
//        dtExtraction.setDtId(dtid);
//        dtExtraction.setLabelId(labelId);
//        dtExtraction.setIndexBegin(indexBegin);
//        dtExtraction.setIndexEnd(indexEnd);
//
//        int dtExtractionRes=dtExtractionMapper.insert(dtExtraction);
//        if(dtExtractionRes<0){
            return 4003;
//        }else{
//            return dtid;
//        }

    }

    public ResponseEntity qualityControl(DoExtractionData doExtractionData){
        ResponseEntity responseEntity = new ResponseEntity();
        int userId = doExtractionData.getUserId();
        int taskId = doExtractionData.getTaskId();
        int subtaskId = doExtractionData.getSubtaskId();
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask userSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        if(userSubtask!=null){
            addExtraction(userId,taskId,subtaskId,doExtractionData.getEntities(),doExtractionData.getRelations());
        }else{
            contrastWithTest(userTaskInf,doExtractionData.getEntities(),doExtractionData.getRelations());
        }
        return responseEntity;
    }



    public ResponseEntity addExtraction(int userId, int taskId,int subtaskId, List<Entity> entities, List<Relation> relations){
        ResponseEntity responseEntity = new ResponseEntity();
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask curuserSubtask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        dtExtractionMapper.deleteBeforeUpdate(userId,taskId,subtaskId);
        dtExtractionRelationMapper.deleteBeforeUpdate(userId,taskId,subtaskId);
        for(Entity entity:entities){
            DtExtraction tempdata = new DtExtraction(taskId,subtaskId,userId,entity);
            int dtEntity = dtExtractionMapper.insert(tempdata);
            if (dtEntity<0) {
                responseEntity=responseUtil.judgeResult(4014);
                return responseEntity;
            }
        }

        for(Relation relation:relations){
            DtExtractionRelation tempRelation = new DtExtractionRelation(taskId,subtaskId,userId,relation);
            int dtRela = dtExtractionRelationMapper.insert(tempRelation);
            if (dtRela<0) {
                responseEntity=responseUtil.judgeResult(4015);
                return responseEntity;
            }
        }
        userTaskInf.setPid(null);
        userTaskInf.setAlreadypart(userTaskInf.getAlreadypart()+1);
        dTaskMapper.updateByPrimaryKey(userTaskInf);
        curuserSubtask.setDone("yes");
        SimpleDateFormat sd = new SimpleDateFormat();
        curuserSubtask.setDotime(sd.format(new Date()));
        userSubtaskMapper.update(curuserSubtask);
        return responseEntity;
    }


    public List<ExtractionData> queryExtractionData(int tid){
        List<ExtractionData> extractionDataList=dtExtractionMapper.getExtractionDataOut(tid);
        return extractionDataList;
    }

    public HSSFWorkbook getExtractionExcel(List<ExtractionData> extractionDataList){
        String[] title = {"文件名","任务索引","内容","E代表实体，R代表关系","实体Id","实体标签","开始索引","结束索引","实体"};

        String sheetName = "信息抽取数据导出";

        HSSFWorkbook wb = excelUtil.getExtractionExcel(sheetName, title, extractionDataList, null);
        return wb;

    }

    public void contrastWithTest(DTask dTask,List<Entity> entityList, List<Relation> relationList){
        int testsubtaskid = dTask.getPid();
        Task testTask = taskMapper.selectTaskById(dTask.getTaskId());
        List<DtExtraction> entityAnswer = dtExtractionMapper.selectByTaskidAndSubtaskid(testTask.getTesttaskId(),testsubtaskid);
        List<DtExtractionRelation> relationAnswer = dtExtractionRelationMapper.selectByTaskidAndSubtaskid(testTask.getTesttaskId(),testsubtaskid);;
        int entityAnswerlength = entityAnswer.size();
        int relationAnswerlength = relationAnswer.size();
        int rightentity = 0;
        int rightrel = 0;
        int totaltest;

        for (Entity j :entityList) {
            for(DtExtraction i: entityAnswer){
//                System.out.println(i.getEntity()+":"+j.getEntity());
//                System.out.println(i.getEntity().equals(j.getEntity()));
                if(i.getEntity().equals(j.getEntity())){
                    rightentity++;
                    break;
                }
            }
        }

        //临时存储实体
        Map<String,String> taskentity = new HashMap<String,String>();
        Map<String,String> answerentity = new HashMap<String,String>();
        for (DtExtraction i: entityAnswer) {
            answerentity.put(i.getEntityId(),i.getEntity());
        }
        for(Entity i :entityList){
            taskentity.put(i.getEntityId(),i.getEntity());
        }

        for (Relation i: relationList) {
            for (DtExtractionRelation j: relationAnswer) {
                if( i.getRelation().equals(j.getRelation()) &&
                        taskentity.get(i.getHeadEntity()).equals(answerentity.get(j.getHeadEntity())) &&
                        taskentity.get(i.getTailEntity()).equals(answerentity.get(j.getTailEntity()))
                ){
                    rightrel++;
                    break;
                }
            }
        }
        totaltest = dTask.getTotaltest();
        dTask.setTotaltest(totaltest+1);
        float currentaccuracy =(float) (rightentity+rightrel)/(entityAnswerlength+relationAnswerlength);
        System.out.println(currentaccuracy);
        float accuracy = Float.valueOf(dTask.getAccuracy());
        float newaccuracy = (accuracy*totaltest+currentaccuracy)/(totaltest+1);
        dTask.setAccuracy(String.valueOf(newaccuracy));
        dTask.setPid(null);
        dTask.setCurrentStatus("notest");
        dTaskMapper.updateByPrimaryKey(dTask);
    }

    //没有任务则返回Null
    public ParagraphLabelEntity getExtractionData(int userId, int taskId){
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
                //已经领取了任务，但未完成，普通任务和检测任务获取方式一样
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


    public ParagraphLabelEntity getLastExtractionData(int userId, int taskId,int subtaskId){
        ParagraphLabelEntity data;
        Paragraph paragraph = new Paragraph();
        List<DtExtraction> entityList;
        List<DtExtractionRelation> relationList;
        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        UserSubtask currentTask = userSubtaskMapper.selectByUserIdAndSubtaskId(userId,taskId,subtaskId);
        //currentTask为null表示当前为检测任务，返回最后一个用户完成的任务
        if(currentTask == null){
            UserSubtask theLasttask = userSubtaskMapper.selectTheLastData(userId,taskId);
            paragraph = paragraphMapper.selectByPrimaryKey(theLasttask.getSubtaskId());
            entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,theLasttask.getSubtaskId());
            relationList = dtExtractionRelationMapper.selectCurrentDone(userId,taskId,theLasttask.getSubtaskId());
            List<Map<String, Object>> entityDone = transforEntityList(entityList);
            List<Map<String, Object>> relationDone = transforRelationList(relationList);
            data = new ParagraphLabelEntity(paragraph,entityDone,relationDone);
            return data;
        }
        //返回上一个任务
        UserSubtask userSubtask = userSubtaskMapper.selectLastData(userId,taskId,subtaskId);
        System.out.println("getLastExtractionData"+userId+" "+taskId+" "+subtaskId);
        //如果没有上一个任务，则直接返回null
        if(userSubtask == null){return null;}
        paragraph = paragraphMapper.selectByPrimaryKey(userSubtask.getSubtaskId());
        entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,userSubtask.getSubtaskId());
        relationList = dtExtractionRelationMapper.selectCurrentDone(userId,taskId,userSubtask.getSubtaskId());
        List<Map<String, Object>> entityDone = transforEntityList(entityList);
        List<Map<String, Object>> relationDone = transforRelationList(relationList);
        data = new ParagraphLabelEntity(paragraph,entityDone,relationDone);
        return data;
    }

/**当前任务可能有三种位置，为最后一个任务，为倒数第二个任务，为其他位置的任务
 * 在最后一个任务时，可能为①检测任务；②普通任务，而下一个位置，可能为①检测任务；②普通任务
 * 在倒数第二个任务时，当前任务只能为普通任务，但是下一个任务可能为①检测任务；②普通任务
 * 在其他位置时，当前任务只能为普通任务，下一个任务只能为普通任务
    */
    public ResponseEntity getNextExtractionData(int userId, int taskId,int subtaskId){
        ResponseEntity data = new ResponseEntity();
        ParagraphLabelEntity subtaskdata;
        List<DtExtraction> entityList;
        List<DtExtractionRelation> relationList;
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
                        Paragraph subtask = paragraphMapper.selectByPrimaryKey(dTask.getPid());
                        entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,subtaskId);
                        relationList = dtExtractionRelationMapper.selectCurrentDone(userId,taskId,subtaskId);
                        List<Map<String, Object>> entityDone = transforEntityList(entityList);
                        List<Map<String, Object>> relationDone = transforRelationList(relationList);
                        subtaskdata = new ParagraphLabelEntity(subtask,entityDone,relationDone);
                        data.setData(subtaskdata);
                        return data;
                    }else{
                        //任务已完成，分配新任务
                        subtaskdata = getExtractionData(userId,taskId);
                        if(subtaskdata == null){
                            data.setStatus(5001);
                            data.setMsg("任务已完成！");
                        }else{
                            //重新分配新的任务
                            //entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,subtaskId);
                            //relationList = dtExtractionRelationMapper.selectCurrentDone(userId,taskId,subtaskId);
                            //List<Map<String, Object>> entityDone = transforEntityList(entityList);
                            //List<Map<String, Object>> relationDone = transforRelationList(relationList);
                            //subtaskdata.setAlreadyDone(entityDone);
                            //subtaskdata.setRelalreadyDone(relationDone);
                            data.setData(subtaskdata);
                        }
                        return data;
                    }
                }
            }else{
                //当前任务后面有已完成的任务，返回下一个任务
                Paragraph paragraph = paragraphMapper.selectByPrimaryKey(nextSubtask.getSubtaskId());
                entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,nextSubtask.getSubtaskId());
                relationList = dtExtractionRelationMapper.selectCurrentDone(userId,taskId,nextSubtask.getSubtaskId());
                List<Map<String, Object>> entityDone = transforEntityList(entityList);
                List<Map<String, Object>> relationDone = transforRelationList(relationList);
                subtaskdata = new ParagraphLabelEntity(paragraph,entityDone,relationDone);
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
                subtaskdata = getExtractionData(userId,taskId);
                if(subtaskdata == null){
                    data.setStatus(5001);
                    data.setMsg("任务已完成！");
                }else{
//                    entityList = dtExtractionMapper.selectCurrentDone(userId,taskId,subtaskId);
//                    relationList = dtExtractionRelationMapper.selectCurrentDone(userId,taskId,subtaskId);
//                    List<Map<String, Object>> entityDone = transforEntityList(entityList);
//                    List<Map<String, Object>> relationDone = transforRelationList(relationList);
//                    subtaskdata.setAlreadyDone(entityDone);
//                    subtaskdata.setRelalreadyDone(relationDone);
                    data.setData(subtaskdata);
                }

            }
            return data;
        }
    }


    private List<Map<String, Object>> transforEntityList(List<DtExtraction> entitylist) {
        List<Map<String, Object>> alreadyDone = new ArrayList<>();
        if (entitylist != null) {
            for (DtExtraction i : entitylist) {
                Map<String, Object> map = new HashMap<>();
                map.put("entityId", i.getEntityId());
                map.put("entityName", i.getEntityName());
                map.put("startIndex", i.getStartIndex());
                map.put("endIndex", i.getEndIndex());
                map.put("entity", i.getEntity());
                alreadyDone.add(map);
            }
        }
        return alreadyDone;
    }

    private List<Map<String, Object>> transforRelationList(List<DtExtractionRelation> relationlist) {
        List<Map<String, Object>> alreadyDone = new ArrayList<>();
        if(relationlist!=null){
            for (DtExtractionRelation i:relationlist){
                Map<String,Object> map = new HashMap<>();
                map.put("relationId",i.getRelationId());
                map.put("relation",i.getRelation());
                map.put("headEntity",i.getHeadEntity());
                map.put("tailEntity",i.getTailEntity());
                alreadyDone.add(map);
            }
        }
        return alreadyDone;
    }
}
