package com.annotation.service.impl;

import com.annotation.dao.DInstanceMapper;
import com.annotation.dao.DTaskMapper;
import com.annotation.dao.DtRelationMapper;
import com.annotation.dao.TaskMapper;
import com.annotation.model.*;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.RelationData;
import com.annotation.service.IDTaskService;
import com.annotation.service.IDtRelationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class DtRelationServiceImpl implements IDtRelationService {

    @Autowired
    DtRelationMapper dtRelationMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    @Autowired
    DInstanceMapper dInstanceMapper;
    @Autowired
    IDTaskService idTaskService;
    @Autowired
    TaskMapper taskMapper;

    /**
     * 根据文件的ID查询instance+Item
     * 文本关系类别
     * @param docId
     * @return
     */
    public List<InstanceItemEntity> queryInstanceItem(int docId , int userId,String status,int taskId){

        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        if(dTask!=null){
            if(status.equals("全部")){
                List<InstanceItemEntity> instanceItemEntityList=dtRelationMapper.selectRelationInstanceItem(docId,userId,dTask.getTkid());
                return instanceItemEntityList;
            }else{
                Map<String,Object> data =new HashMap();
                data.put("docId",docId);
                data.put("userId",userId);
                data.put("status",status);
                data.put("dTaskId",dTask.getTkid());
                List<InstanceItemEntity> instanceItemEntityList=dtRelationMapper.selectRelationWithStatus(data);
                return instanceItemEntityList;
            }
        }else{
            List<InstanceItemEntity> instanceItemEntityList=dtRelationMapper.selectRelation(docId);
            return instanceItemEntityList;
        }



    }


    /**
     *
     * @param userId
     * @param taskId
     * @param docId
     * @param instanceId
     * @param instanceLabels
     * @param item1Id
     * @param item1Labels
     * @param item2Id
     * @param item2Labels
     * @return
     */
    @Transactional
    public int addRelation(int userId,int taskId,int docId,int instanceId,int[] instanceLabels, int item1Id, int[] item1Labels, int item2Id, int[] item2Labels){
        int dTaskId=idTaskService.addDTaskOfInstance(userId,taskId);
        if(dTaskId==4001|| dTaskId==4005){
            return dTaskId;
        }

        //插入d_instance
        int dtid;
        DInstance dInstanceSelect=dInstanceMapper.selectByDtaskIdAndInstId(dTaskId,instanceId,docId);

        if(dInstanceSelect!=null){
            dtid=dInstanceSelect.getDtid();
        }else{
            DInstance dInstance =new DInstance();
            dInstance.setDocumentId(docId);
            dInstance.setDtaskId(dTaskId);
            dInstance.setDtstatus("进行中");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
            dInstance.setDotime(df.format(new Date()));
            dInstance.setInstanceId(instanceId);

            int dParaRes=dInstanceMapper.insert(dInstance);
            if(dParaRes<0){
                return 4006;
            }else{
                dtid=dInstance.getDtid();
            }
        }

        dtRelationMapper.alterDtRelationTable();
        //todo；小于0的判断是不是有问题
        if(instanceLabels!=null){
            int iRes0= insertLabels(dtid,"instance",instanceLabels);
            if(iRes0<0){
                return 4007;
            }
        }

        if(item1Labels!=null){
            int iRes0= insertLabels(dtid,"item1",item1Labels);
            if(iRes0<0){
                return 4008;
            }
        }

        if(item2Labels!=null){
            int iRes0= insertLabels(dtid,"item2",item2Labels);
            if(iRes0<0){
                return 4009;
            }
        }

        //返回做任务ID
        return dtid;
    }


    /**
     * 批量插入label
     * @param dtid
     * @param labeltype
     * @param itemLabels
     * @return
     */
    public int insertLabels(int dtid,String labeltype,int[] itemLabels){
        int res=dtRelationMapper.insertLabelList(dtid,labeltype,itemLabels);
        return res;
    }

    public List<RelationData> queryRelationData(int tid){
        List<RelationData> relationDataList=dtRelationMapper.getRelationDataOut(tid);
        return relationDataList;
    }


//
//    public InstanceItemEntity classifyGetTask(int userId, int taskId) {
//        ParagraphLabelEntity data = new ParagraphLabelEntity();
//        DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
//        int pid;
//        idTaskService.addDTask(userId,38,"test",10);
//        Task task = taskMapper.selectTaskById(taskId);
//        int currenttask = task.getCurrenttask();
//        int curfrequence = task.getFrequence();
//        int totaltask = task.getTotaltask();
//        int startpid = task.getStartid();
//        //判断任务是否分配完了
//        if(currenttask == totaltask || curfrequence >= 4){return null;}
//        //先看之前有没有领取过任务，有就则继续派发，再看领取的任务完成与否
//        if (dTask!=null) {
//            if(dTask.getPid() != null){
//                //已经领取了任务，但未完成
//                if("notest".equals(dTask.getCurrentStatus()) || dTask.getCurrentStatus() == null){
//                    pid = dTask.getPid();
//                    Paragraph paragraph = paragraphMapper.selectByPrimaryKey(pid);
//                    data = new ParagraphLabelEntity(paragraph);
//                }else{
//                    TestExtractionData tempData = testExtractionDataMapper.selectDataId(dTask.getPid());
//                    data.setParacontent(tempData.getContent());
//                }
//                return data;
//            }else{
//                //查找任务
//                Paragraph paragraph = paragraphMapper.selectByPrimaryKey(currenttask+startpid);
//                data = new ParagraphLabelEntity(paragraph);
//                //更新用户当前申请的任务
//                dTask.setPid(currenttask+startpid);
//                dTaskMapper.updateByPrimaryKey(dTask);
//                //更新task信息 currenttask{0-31},curfrequence={0123}
//                if(currenttask == totaltask-1 && curfrequence < 4){
//                    currenttask = 0;
//                    curfrequence++;
//                }else{currenttask++;}
//                if(currenttask == totaltask-1 || curfrequence > 4){
//                    task.setTaskcompstatus("已分配完");
//                }
//                task.setCurrenttask(currenttask);
//                task.setFrequence(curfrequence);
//                taskMapper.updateById(task);
//                return data;
//            }
//        } else {
//            data = this.extractionFirsttask(task,userId);
//            return data;
//        }
//    }



}
