package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.DtExtractionRelation;
import com.annotation.model.entity.ExtractionData;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.service.IDParagraphService;
import com.annotation.service.IDTaskService;
import com.annotation.service.IDtExtractionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
//    public int addExtraction(int userId,int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd){
//
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
//            return 4003;
//        }else{
//            return dtid;
//        }
//
//    }
    public int addExtraction(int userId,int taskId,List<DtExtraction> entityList,List<DtExtractionRelation> relationList){
        DTask userTaskInf = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        int subtaskId = userTaskInf.getPid();
        for(DtExtraction tempdata:entityList){
            tempdata.setTaskId(taskId);
            tempdata.setUserId(userId);
            tempdata.setSubtaskId(subtaskId);
            dtExtractionMapper.insert(tempdata);
        }

        for(DtExtractionRelation tempRelation:relationList){
            tempRelation.setTaskId(taskId);
            tempRelation.setUserId(userId);
            tempRelation.setSubtaskId(subtaskId);
            dtExtractionRelationMapper.insert(tempRelation);
        }
        userTaskInf.setPid(null);
        userTaskInf.setAlreadypart(userTaskInf.getAlreadypart()+1);
        dTaskMapper.updateByPrimaryKey(userTaskInf);
        return 0;
    }


    public List<ExtractionData> queryExtractionData(int tid){
        List<ExtractionData> extractionDataList=dtExtractionMapper.getExtractionDataOut(tid);
        return extractionDataList;
    }

    public void contrastWithTest(DTask dTask,List<DtExtraction> entityList,List<DtExtractionRelation> relationList){
        int testsubtaskid = testExtractionDataMapper.selectDataId(dTask.getPid()).getSubtaskId();
        List<TestExtractionEntity> entityAnswer = testExtractionEntityMapper.selectByTaskidAndSubtaskid(dTask.getTaskId(),testsubtaskid);;
        List<TestExtractionRel> relationAnswer = testExtractionRelMapper.selectByTaskidAndSubtaskid(dTask.getTaskId(),testsubtaskid);;
        int entityAnswerlength = entityAnswer.size();
        int relationAnswerlength = relationAnswer.size();
        int rightentity = 0;
        int rightrel = 0;
        int totaltest;

        for (DtExtraction j :entityList) {
            for(TestExtractionEntity i: entityAnswer){
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
        for (TestExtractionEntity i: entityAnswer) {
            answerentity.put(i.getEntityId(),i.getEntity());
        }
        for(DtExtraction i :entityList){
            taskentity.put(i.getEntityId(),i.getEntity());
        }

        for (DtExtractionRelation i: relationList) {
            for (TestExtractionRel j: relationAnswer) {
                if( i.getRelation().equals(j.getRelation()) &&
                        taskentity.get(i.getHeadEntity()).equals(answerentity.get(j.getHeadentity())) &&
                        taskentity.get(i.getTailEntity()).equals(answerentity.get(j.getTailentity()))
                ){
                    rightrel++;
                    break;
                }
            }
        }
        totaltest = dTask.getTotaltest();
        dTask.setTotaltest(totaltest+1);
        NumberFormat nf = NumberFormat.getPercentInstance();
        nf.setMaximumFractionDigits(1);
        System.out.println(rightentity);
        float currentaccuracy =(float) (rightentity+rightrel)/(entityAnswerlength+relationAnswerlength);
        System.out.println(currentaccuracy);
        float accuracy = Float.valueOf(dTask.getAccuracy().replace("%",""))/100;
        float newaccuracy = (accuracy*totaltest+currentaccuracy)/(totaltest+1);
        dTask.setAccuracy(newaccuracy+"%");
        dTask.setPid(null);
        dTask.setCurrentStatus("notest");
        dTaskMapper.updateByPrimaryKey(dTask);
    }

}
