package com.annotation.service;

import com.annotation.model.DTask;
import com.annotation.model.DtExtraction;
import com.annotation.model.DtExtractionRelation;
import com.annotation.model.entity.*;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

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
    ResponseEntity addExtraction(int userId, int taskId,int subtaskId, List<Entity> entities, List<Relation> relations);
    int addExtraction(int userId,int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd);
    List<ExtractionData> queryExtractionData(int tid);

    void contrastWithTest(DTask dTask,List<Entity> entities, List<Relation> relations);

    ParagraphLabelEntity getExtractionData(int userId, int taskId);

    ResponseEntity qualityControl(DoExtractionData doExtractionData);

    ParagraphLabelEntity getLastExtractionData(int userId, int taskId,int subtaskId);

    ResponseEntity getNextExtractionData(int userId, int taskId,int subtaskId);

    HSSFWorkbook getExtractionExcel(List<ExtractionData> extractionDataList);

    List<ParagraphLabelEntity> getExtractionDone(int subtaskId, int userId,int taskId);
}
