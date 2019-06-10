package com.annotation.service;

import com.annotation.model.entity.ExtractionData;
import com.annotation.model.entity.ParagraphLabelEntity;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
public interface IDtExtractionService {

    /**
     * 查询信息抽取任务详情
     * @param docId
     * @return
     */
    List<ParagraphLabelEntity> queryExtractionParaLabel(int docId, int userId,String status,int taskId);


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
    int addExtraction(int userId,int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd);

    public List<ExtractionData> queryExtractionData(int tid);

}
