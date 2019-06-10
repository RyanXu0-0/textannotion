package com.annotation.service.impl;

import com.annotation.dao.*;
//import com.annotation.elasticsearch.document.TaskDoc;
//import com.annotation.elasticsearch.repository.TaskDocRepository;

import com.annotation.model.*;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.TaskInfoEntity;
import com.annotation.service.ILabelService;
import com.annotation.service.ITaskService;
import com.annotation.util.ResponseUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import java.util.*;

/**
 * Created by twinkleStar on 2018/12/9.
 */

@Repository
public class TaskServiceImpl implements ITaskService{
    @Autowired
    TaskMapper taskMapper;
    @Autowired
    TaskDocumentMapper taskDocumentMapper;
    @Autowired
    DocumentMapper documentMapper;

    @Autowired
    ParagraphMapper paragraphMapper;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    ListitemMapper listitemMapper;
    @Autowired
    LabelMapper labelMapper;
    @Autowired
    TaskLabelMapper taskLabelMapper;
    @Autowired
    InstanceLabelMapper instanceLabelMapper;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DParagraphMapper dParagraphMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    DtClassifyMapper dtClassifyMapper;
    @Autowired
    DtExtractionMapper dtExtractionMapper;
    @Autowired
    DtRelationMapper dtRelationMapper;
    @Autowired
    DtPairingMapper dtPairingMapper;
    @Autowired
    DtSortingMapper dtSortingMapper;
//    @Autowired
//    TaskDocRepository taskDocRepository;
    @Autowired
    ILabelService iLabelService;

    @Autowired
    PointUnitMapper pointUnitMapper;

   public Label test(){
       Label labelList=iLabelService.queryLabelByTaskId("1");
       return labelList;
   }

    /**
     * 插入文件-doc关系表
     * @param taskId
     * @param docIds
     * @return
     */
    public int addTaskDoc(int taskId,List<Integer> docIds){
        for(int i=0;i<docIds.size();i++){
            TaskDocument taskDocument =new TaskDocument();
            taskDocument.setDocumentId(docIds.get(i));
            taskDocument.setTaskId(taskId);
            int task_docRes = taskDocumentMapper.insert(taskDocument);//插入关系表
            //插入任务-文件 关系表
            if(task_docRes <0){
                return 3002;
            }
        }
        return 0;
    }

    /**
     * 信息抽取和分类任务
     * @param task
     * @param docIds
     * @param labels
     * @param colors
     * @return
     */
    @Transactional
    public ResponseEntity addTaskOfDocPara(Task task, List<Integer> docIds, String[] labels, String[] colors){
        ResponseEntity responseEntity = new ResponseEntity();

        taskMapper.alterTaskTable();
        int taskRes=taskMapper.insert(task);//插入任务

        //插入任务表失败
        if(taskRes<0){
            responseEntity=responseUtil.judgeResult(3001);
            return responseEntity;
        }

        int esRes=saveTask(task);

        //任务表插入成功，继续插入关系表
        int taskDocRes=addTaskDoc(task.getTid(),docIds);
        if(taskDocRes!=0){
            responseEntity=responseUtil.judgeResult(taskDocRes);
            return responseEntity;
        }


//        for(int i=0;i<docIds.size();i++){
//            TaskDocument taskDocument =new TaskDocument();
//            taskDocument.setDocumentId(docIds.get(i));
//            taskDocument.setTaskId(task.getTid());
//            int task_docRes = taskDocumentMapper.insert(taskDocument);//插入关系表
//            //插入任务-文件 关系表
//            if(task_docRes <0){
//                responseEntity=responseUtil.judgeResult(3002);
//                return responseEntity;
//            }
//        }

        labelMapper.alterLabelTable();
        for(int i=0;i<labels.length;i++){

            //查询该标签是否已经存在
            Label selectLabel =labelMapper.selectLabelByLabelname(labels[i]);

            int labelId;
            //查询成功，则返回标签ID进行下一步插入
            if(selectLabel == null){
                //标签不存在再新建标签
                Label label=new Label();
                label.setLabelname(labels[i]);
                int labelRes=labelMapper.insert(label);
                labelId =label.getLid();

                //标签插入失败
                if(labelRes<0){
                    responseEntity=responseUtil.judgeResult(3003);
                    return responseEntity;
                }
            }else{
                labelId=selectLabel.getLid();
            }

            //插入文件-标签关系表
            TaskLabel taskLabel = new TaskLabel();
            taskLabel.setLabelId(labelId);
            taskLabel.setTaskId(task.getTid());
            if(colors!=null){
                taskLabel.setColor(colors[i]);
            }

            int task_labelRes = taskLabelMapper.insert(taskLabel);

            //文件-标签关系表插入失败
            if(task_labelRes<0){
                responseEntity=responseUtil.judgeResult(3004);
                return responseEntity;
            }
        }
        //返回任务ID
        responseEntity.setStatus(0);
        responseEntity.setMsg("创建任务成功");
        responseEntity.setData(task.getTid());
        return responseEntity;
    }




    /**
     * 文本关系
     * @param task
     * @param docIds
     * @param instanceLabel
     * @param item1Label
     * @param item2Label
     * @return
     */
    @Transactional
    public ResponseEntity addTaskOfRelation(Task task, List<Integer> docIds, String[] instanceLabel, String[] item1Label, String[] item2Label){

        ResponseEntity responseEntity = new ResponseEntity();

        taskMapper.alterTaskTable();
        int taskRes=taskMapper.insert(task);//插入任务

        //插入任务表失败返回-1
        if(taskRes < 0){
            responseEntity=responseUtil.judgeResult(3001);
            return responseEntity;
        }

        int esRes=saveTask(task);

        //任务表插入成功，继续插入关系表
        int taskDocRes=addTaskDoc(task.getTid(),docIds);
        if(taskDocRes!=0){
            responseEntity=responseUtil.judgeResult(taskDocRes);
            return responseEntity;
        }


        labelMapper.alterLabelTable();
        //插入instance标签
        for(int i=0;i<instanceLabel.length;i++) {

            //查询该标签是否已经存在
            Label selectInstLabel = labelMapper.selectLabelByLabelname(instanceLabel[i]);
            int labelId;
            //查询成功，则返回标签ID进行下一步插入
            if (selectInstLabel == null) {
                //标签不存在再新建标签
                Label label = new Label();
                label.setLabelname(instanceLabel[i]);
                int instanceLabelRes = labelMapper.insert(label);
                labelId = label.getLid();
                //标签插入失败
                if (instanceLabelRes<0) {
                    responseEntity=responseUtil.judgeResult(3005);
                    return responseEntity;
                }
            } else {
                labelId = selectInstLabel.getLid();
            }

            //插入instance_label关系表
            InstanceLabel instanceLabel0 = new InstanceLabel();
            instanceLabel0.setLabelId(labelId);
            instanceLabel0.setLabeltype("instance");
            instanceLabel0.setTaskId(task.getTid());

            //插入文件-标签关系表
            int instance_labelRes = instanceLabelMapper.insert(instanceLabel0);

            //文件-标签关系表插入失败
            if (instance_labelRes<0) {
                responseEntity=responseUtil.judgeResult(3006);
                //插入数据库有错误时整体回滚
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return responseEntity;
            }

        }

        //继续插入label标签表
        for(int j=0;j<item1Label.length;j++){
            //查询该标签是否已经存在
            Label selectItem1Label =labelMapper.selectLabelByLabelname(item1Label[j]);

            int labelitemId1;
            //查询成功，则返回标签ID进行下一步插入
            if(selectItem1Label == null){
                //标签不存在再新建标签
                Label label=new Label();
                label.setLabelname(item1Label[j]);
                int labelRes1=labelMapper.insert(label);
                labelitemId1 =label.getLid();

                //标签插入失败
                if(labelRes1 ==-1){
                    responseEntity=responseUtil.judgeResult(3007);
                    //插入数据库有错误时整体回滚
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return responseEntity;
                }
            }else{
                labelitemId1=selectItem1Label.getLid();
            }

            //插入instance_label关系表
            InstanceLabel instanceLabel1 = new InstanceLabel();
            instanceLabel1.setLabelId(labelitemId1);
            instanceLabel1.setLabeltype("item1");
            instanceLabel1.setTaskId(task.getTid());
            int insta_labelRes1 = instanceLabelMapper.insert(instanceLabel1);
            //文件-标签关系表插入失败
            if(insta_labelRes1<0){
                responseEntity=responseUtil.judgeResult(3008);
                //插入数据库有错误时整体回滚
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return responseEntity;
            }
        }

        //插入item2标签
        for(int k=0;k<item2Label.length;k++){
            //查询该标签是否已经存在
            Label selectItem2Label =labelMapper.selectLabelByLabelname(item2Label[k]);

            int labelitemId2;
            //查询成功，则返回标签ID进行下一步插入
            if(selectItem2Label == null){
                //标签不存在再新建标签
                Label label=new Label();
                label.setLabelname(item2Label[k]);
                int labelRes2 =labelMapper.insert(label);
                labelitemId2 =label.getLid();

                //标签插入失败
                if(labelRes2<0){
                    responseEntity=responseUtil.judgeResult(3009);
                    //插入数据库有错误时整体回滚
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return responseEntity;
                }
            }else{
                labelitemId2=selectItem2Label.getLid();
            }

            //插入insta_label关系表
            InstanceLabel instanceLabel2 = new InstanceLabel();
            instanceLabel2.setLabelId(labelitemId2);
            instanceLabel2.setLabeltype("item2");
            instanceLabel2.setTaskId(task.getTid());
            int insta_labelRes2 = instanceLabelMapper.insert(instanceLabel2);
            //文件-标签关系表插入失败
            if(insta_labelRes2<0){
                responseEntity=responseUtil.judgeResult(3010);
                //插入数据库有错误时整体回滚
                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                return responseEntity;
            }
        }
        responseEntity.setStatus(0);
        responseEntity.setMsg("创建任务成功");
        responseEntity.setData(task.getTid());
        //返回任务ID
        return responseEntity;
    }


    /**
     * 文本匹配/文本排序
     * @param task
     * @param docIds
     * @return
     */
    @Transactional
    public ResponseEntity addTaskOfPairingAndSorting(Task task, List<Integer> docIds){

        taskMapper.alterTaskTable();
        ResponseEntity responseEntity = new ResponseEntity();

        int taskRes=taskMapper.insert(task);//插入任务

        if(taskRes < 0){
            responseEntity=responseUtil.judgeResult(3001);
            return responseEntity;
        }

        int esRes=saveTask(task);

        //任务表插入成功，继续插入关系表
        int taskDocRes=addTaskDoc(task.getTid(),docIds);
        if(taskDocRes!=0){
            responseEntity=responseUtil.judgeResult(taskDocRes);
            return responseEntity;
        }

        responseEntity.setStatus(0);
        responseEntity.setMsg("创建任务成功");
        responseEntity.setData(task.getTid());
        return responseEntity;
    }


    /**
     * 分页查询所有可以做的任务
     * @param page
     * @param limit
     * @return
     */
    public List<Task> queryTotalTaskOfUndo(int page,int limit){
        int startNum =(page-1)*limit;
        Map<String,Object> data =new HashMap();
        data.put("currIndex",startNum);
        data.put("pageSize",limit);
        List<Task> task =taskMapper.selectTotalTaskOfUndo(data);
        return task;
    }

    /**
     * 获取所有任务的数量
     * numInt.intValue();
     * @return
     */
    public int countNumOfUndo(){
        int num = taskMapper.countNumOfTaskUndo();
        return num;
    }


    /**
     * 分页查询
     * @param userid
     * @param page
     * @param limit
     * @return
     */
    public List<Task> queryMyPubTask(int userid,int page,int limit){
        int startNum =(page-1)*limit;
        Map<String,Object> data =new HashMap();
        data.put("currIndex",startNum);
        data.put("pageSize",limit);
        data.put("userId",userid);
        List<Task> task =taskMapper.selectMyPubTask(data);
        return task;
    }

    /**
     * 获取所有任务的数量
     * numInt.intValue();
     * @return
     */
    public int countNumOfMyPubTask(int userId){
        int num = taskMapper.countNumOfMyPubTask(userId);
        return num;
    }

    /**
     * 根据用户ID查询任务总数
     * @param userId
     * @return
     */
//    public int countTasknumByUserId(int userId){
//        Integer numInt = taskMapper.countTaskNumByUserid(userId);
//        if(numInt == null){
//            return 0;
//        } else{
//            return numInt.intValue();
//        }
//    }

//    /**
//     * 获取所有的任务
//     * @return
//     */
//    public List<Task> getAll(){
//        List<Task> tasks = taskMapper.getAll();
//        return tasks;
//    }






    /**
     * 根据任务ID获取任务详情
     * 不同任务类型调用不同的接口
     * @param tid
     * @return
     */
    public TaskInfoEntity queryTaskInfo(int tid,int typeId){

        TaskInfoEntity taskInfoEntity =new TaskInfoEntity();

        //更新浏览次数
        Task task =taskMapper.selectTaskById(tid);
        task.setViewnum(task.getViewnum()+1);
        int updateViewnum =taskMapper.updateById(task);

        saveTask(task);

        /**
         * 信息抽取和分类
         * task.getTypeName().equals("信息抽取")
         */
        if (typeId==1 || typeId==2 ){
            taskInfoEntity =taskMapper.selectTaskInfoWithDocLabel(tid);

        /**
         * 文本关系类别标注
         */
        }else if(typeId==3 ){
            taskInfoEntity =taskMapper.selectTaskInfoWithDocInstanceLabel(tid);

            //todo:instance和item1\item2标签分开来存储
            //如果该任务有标签，则查询并返回标签列表
//            if(taskLabelMapper.selectLabelsByTaskid(tid)!=null){
//                TaskInfoEntity taskInfoEntity1=taskMapper.selectTaskInfoWithLabel(tid);
//                taskInfoEntity.setLabelList(taskInfoEntity1.getLabelList());
//            }

        /**
         * 文本配对标注
         */
        }else if(typeId==4){
            taskInfoEntity =taskMapper.selectTaskInfoWithDoc(tid);

            /**
             *文本排序
             */
        }else if(typeId==5){


            taskInfoEntity =taskMapper.selectTaskInfoWithDoc(tid);
            /**
             * 文本类比排序
             */
        }else if(typeId==6){


            taskInfoEntity =taskMapper.selectTaskInfoWithDoc(tid);
        }else{
            //todo：其他类型，待开发
        }

        return taskInfoEntity;
    }



    @Transactional
    public int deleteTaskInfo(int tid,int typeId){

        List<DTask> dTaskList=dTaskMapper.selectByTaskId(tid);

        if(dTaskList!=null){
            if(typeId==1){

                for (DTask dTask : dTaskList) {
                    int tkId=dTask.getTkid();
                    List<DParagraph> dParagraphList=dParagraphMapper.selectByDtaskId(tkId);
                    for(DParagraph dParagraph:dParagraphList){
                        int dtId=dParagraph.getDtid();
                        int delDtExtraction=dtExtractionMapper.deleteByDtId(dtId);
                        if(delDtExtraction<0){
                            return -1;
                        }
                    }

                    int delDPara=dParagraphMapper.deleteByDtaskId(tkId);
                    if(delDPara<0){
                        return -1;
                    }

                }

            }else if(typeId==2){

                for (DTask dTask : dTaskList) {
                    int tkId=dTask.getTkid();
                    List<DParagraph> dParagraphList=dParagraphMapper.selectByDtaskId(tkId);
                    for(DParagraph dParagraph:dParagraphList){
                        int dtId=dParagraph.getDtid();
                        int delDtClass=dtClassifyMapper.deleteByDtId(dtId);
                        if(delDtClass<0){
                            return -1;
                        }
                    }

                    int delDPara=dParagraphMapper.deleteByDtaskId(tkId);
                    if(delDPara<0){
                        return -1;
                    }

                }
            }else if(typeId==3){

                for (DTask dTask : dTaskList) {
                    int tkId=dTask.getTkid();
                    List<DInstance> dInstanceList=dInstanceMapper.selectByDtaskId(tkId);
                    for(DInstance dInstance:dInstanceList){
                        int dtId=dInstance.getDtid();
                        int delRelation=dtRelationMapper.deleteByDtId(dtId);
                        if(delRelation<0){
                            return -1;
                        }
                    }

                    int delDInstance=dInstanceMapper.deleteByDtaskId(tkId);
                    if(delDInstance<0){
                        return -1;
                    }

                }
            }else if(typeId==4){

                for (DTask dTask : dTaskList) {
                    int tkId=dTask.getTkid();
                    List<DInstance> dInstanceList=dInstanceMapper.selectByDtaskId(tkId);
                    for(DInstance dInstance:dInstanceList){
                        int dtId=dInstance.getDtid();
                        int delPairing=dtPairingMapper.deleteByDtId(dtId);
                        if(delPairing<0){
                            return -1;
                        }
                    }

                    int delDInstance=dInstanceMapper.deleteByDtaskId(tkId);
                    if(delDInstance<0){
                        return -1;
                    }

                }
            }else{

                for (DTask dTask : dTaskList) {
                    int tkId=dTask.getTkid();
                    List<DInstance> dInstanceList=dInstanceMapper.selectByDtaskId(tkId);
                    for(DInstance dInstance:dInstanceList){
                        int dtId=dInstance.getDtid();
                        int delSorting=dtSortingMapper.deleteByDtId(dtId);
                        if(delSorting<0){
                            return -1;
                        }
                    }

                    int delDInstance=dInstanceMapper.deleteByDtaskId(tkId);
                    if(delDInstance<0){
                        return -1;
                    }

                }
            }


            int delDTask=dTaskMapper.deleteByTaskId(tid);
            if(delDTask<0){
                return  -1;
            }
        }

        int[] docIds=taskDocumentMapper.selectDocIdByTid(tid);
        int delPointUnit=pointUnitMapper.deleteByTid(tid);
        if(delPointUnit<0){

            return -1;
        }

        if(typeId==1 || typeId==2){

            int delRes1=taskLabelMapper.deleteByTid(tid);
            if(delRes1<0){
                return -1;
            }
            for(int i=0;i<docIds.length;i++){
                int delRes2=paragraphMapper.deleteByDocId(docIds[i]);
                if(delRes2<0){
                    return -1;
                }
            }

        }else if(typeId==3){

            for(int i=0;i<docIds.length;i++){
                int[] instIds=instanceMapper.selectInstanceByDocId(docIds[i]);
                for(int j=0;j<instIds.length;j++){
                    int delRes1=itemMapper.deleteByInstId(instIds[j]);
                    if(delRes1<0){
                        return -1;
                    }
                }

                int delRes=instanceMapper.deleteByDocId(docIds[i]);
                if(delRes<0){
                    return -1;
                }
            }

            int delRes3=instanceLabelMapper.deleteByTid(tid);
            if(delRes3<0){
                return -1;
            }

        }else if(typeId==4){


            for(int i=0;i<docIds.length;i++){
                int[] instIds=instanceMapper.selectInstanceByDocId(docIds[i]);
                for(int j=0;j<instIds.length;j++){

                    int delRes1=listitemMapper.deleteByInstId(instIds[j]);
                    if(delRes1<0){
                        return -1;
                    }
                }


                int delRes=instanceMapper.deleteByDocId(docIds[i]);
                if(delRes<0){
                    return -1;
                }
            }

        }else if(typeId==5 || typeId==6){
            for(int i=0;i<docIds.length;i++){
                int[] instIds=instanceMapper.selectInstanceByDocId(docIds[i]);
                for(int j=0;j<instIds.length;j++){
                    int delRes1=itemMapper.deleteByInstId(instIds[j]);
                    if(delRes1<0){
                        return -1;
                    }
                }


                int delRes=instanceMapper.deleteByDocId(docIds[i]);
                if(delRes<0){
                    return -1;
                }
            }
        }

        int delRes3=taskDocumentMapper.deleteByTid(tid);
        if(delRes3<0){
            return -1;
        }

        for(int i=0;i<docIds.length;i++){
            int delRes1=documentMapper.deleteByPrimaryKey(docIds[i]);
            if(delRes1<0){
                return -1;
            }
        }

        int delRes=taskMapper.deleteByPrimaryKey(tid);
        if(delRes<0){
            return -1;
        }

        return 0;
    }










//todo:es插入，暂时省略
    public int saveTask(Task task){
//        TaskDoc taskDoc=new TaskDoc();
//        taskDoc.setAttendnum(task.getAttendnum());
//        taskDoc.setViewnum(task.getViewnum());
//        taskDoc.setCreatetime(task.getCreatetime());
//        taskDoc.setDeadline(task.getDeadline());
//        taskDoc.setDescription(task.getDescription());
//        taskDoc.setOtherinfo(task.getOtherinfo());
//        taskDoc.setPubUserName(task.getPubUserName());
//        taskDoc.setTitle(task.getTitle());
//        taskDoc.setTid(task.getTid());
//        taskDoc.setTypeName(task.getTypeName());
//        taskDoc.setUserId(task.getUserId());
//        taskDoc.setTaskcompstatus(task.getTaskcompstatus());
//        taskDocRepository.save(taskDoc);
        return 1;

    }

//    /**
//     * 返回这个任务的发布者姓名
//     * @param tid
//     * @return
//     */
//    public String queryUserName(int tid){
//        String username=taskMapper.selectUserName(tid);
//        return username;
//    }
	
	



//
//    public ResponseEntity  addTaskOneSorting(Task task, User user, List<Integer> docids){
//
//        ResponseEntity responseEntity = new ResponseEntity();
//        task.setUserId(user.getId());
//        taskMapper.alterTaskTable();
//        int taskRes=taskMapper.insert(task);//插入任务
//
//        //插入任务表失败返回-1
//        if(taskRes == -1){
//            responseEntity.setStatus(-1);
//            responseEntity.setMsg("添加任务失败，请检查");
//            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//            return responseEntity;
//        }
//
//        //任务表插入成功，继续插入关系表
//        for(int i=0;i<docids.size();i++){
//            TaskDocument taskDocument =new TaskDocument();
//            taskDocument.setDocumentId(docids.get(i));
//            taskDocument.setTaskId(task.getTid());
//            int task_docRes = taskDocumentMapper.insert(taskDocument);//插入关系表
//            //插入任务-文件 关系表，失败返回-2
//            if(task_docRes == -1){
//                //todo:删除已经插入的任务表
//                responseEntity.setStatus(-2);
//                responseEntity.setMsg("任务-文件关系插入失败");
//                //插入数据库有错误时整体回滚
//                TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//                return responseEntity;
//            }
//        }
//
//        //返回任务ID
//        return responseEntity;
//    }

    /**
     * 根据任务类型查询任务
     * @param tasktype
     * @return
     */
    public List<Task> selectTaskByType(String tasktype){
        List<Task> tasks = taskMapper.selectTaskByType(tasktype);
        return tasks;
    }

}





