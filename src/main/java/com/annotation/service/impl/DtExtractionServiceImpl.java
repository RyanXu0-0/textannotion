package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.ExtractionData;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.service.IDParagraphService;
import com.annotation.service.IDTaskService;
import com.annotation.service.IDtExtractionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.text.SimpleDateFormat;
import java.util.Date;
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
     * @param taskId
     * @param docId
     * @param paraId
     * @param labelId
     * @param indexBegin
     * @param indexEnd
     * @return
     */
    public int addExtraction(int userId,int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd){

        int dTaskId=idTaskService.addDTaskOfPara(userId,taskId);
        if(dTaskId==4001|| dTaskId==4005){
            return dTaskId;
        }

        int dtid=idParagraphService.addDParagraph(dTaskId,docId,paraId);
        if(dtid==4002){
            return dtid;
        }

        dtExtractionMapper.alterDtExtractionTable();
        DtExtraction dtExtraction =new DtExtraction();
        dtExtraction.setDtId(dtid);
        dtExtraction.setLabelId(labelId);
        dtExtraction.setIndexBegin(indexBegin);
        dtExtraction.setIndexEnd(indexEnd);

        int dtExtractionRes=dtExtractionMapper.insert(dtExtraction);
        if(dtExtractionRes<0){
            return 4003;
        }else{
            return dtid;
        }

    }

    public List<ExtractionData> queryExtractionData(int tid){
        List<ExtractionData> extractionDataList=dtExtractionMapper.getExtractionDataOut(tid);
        return extractionDataList;
    }



}
