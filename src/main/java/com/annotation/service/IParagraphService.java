package com.annotation.service;

import com.annotation.model.Paragraph;
import com.annotation.model.entity.ParagraphLabelEntity;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/16.
 */
public interface IParagraphService {

    /**
     * 根据文件ID查询content内容
     * @param docId
     * @return
     */
   public List<Paragraph> selectContentByDocId(int docId);
   // public List<Paragraph> selectContentByDocId(int docId);





}
