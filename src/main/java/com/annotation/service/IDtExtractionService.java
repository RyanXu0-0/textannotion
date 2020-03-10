package com.annotation.service;

import com.annotation.model.DTask;
import com.annotation.model.DtExtraction;
import com.annotation.model.DtExtractionRelation;
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

     * @return
     */
    int addExtraction(int userId, int taskId, List<DtExtraction> entityList, List<DtExtractionRelation> relationList);

    List<ExtractionData> queryExtractionData(int tid);

    void contrastWithTest(DTask dTask, List<DtExtraction> entityList, List<DtExtractionRelation> relationList);

}
