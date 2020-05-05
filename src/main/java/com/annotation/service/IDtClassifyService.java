package com.annotation.service;

import com.annotation.model.DtClassify;
import com.annotation.model.entity.ClassifyData;
import com.annotation.model.entity.LabelCountEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.ResponseEntity;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
public interface IDtClassifyService {

    /**
     * 查询content+label
     * @param docId
     * @return
     */
    List<ParagraphLabelEntity> queryClassifyParaLabel(int docId, int userId,String status,int taskId);


    /**
     * 分类任务
     *
     * @param taskId
     *
     * @param paraId
     * @param labelId
     * @return
     */
    ResponseEntity addClassify(int taskId,int paraId,int[] labelId);


    DtClassify addComment(int dtdId, int cNum, int flag, int uId);

    List<LabelCountEntity> queryAlreadyLabel(int tid);

    List<ClassifyData> queryClassifyData(int tid);

    HSSFWorkbook getClassifyExcel(List<ClassifyData> classifyDataList);

    ParagraphLabelEntity getClassifyData(int userId, int taskId);

    ParagraphLabelEntity getLastClassifyData(int userId, int taskId,int subtaskId);

    ResponseEntity getNextClassifyData(int userId, int taskId,int subtaskId);

    ParagraphLabelEntity getClassifyDone(int subtaskId, int userId,int taskId);

    ParagraphLabelEntity getLastDone(int taskId,int subtaskId);

    ParagraphLabelEntity getNextDone(int taskId,int subtaskId);
}
