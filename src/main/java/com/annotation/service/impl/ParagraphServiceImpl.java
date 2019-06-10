package com.annotation.service.impl;

import com.annotation.dao.ParagraphMapper;
import com.annotation.model.Paragraph;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.service.IParagraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/16.
 */

@Repository
public class ParagraphServiceImpl implements IParagraphService {

    @Autowired
    ParagraphMapper paragraphMapper;

    /**
     * 根据文件ID查询content表的内容
     * @param docId
     * @return
     */
    public List<Paragraph> selectContentByDocId(int docId){
        List<Paragraph> contentList =paragraphMapper.selectContentByDocId(docId);
        return contentList;
    }



}
