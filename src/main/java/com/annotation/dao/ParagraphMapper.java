package com.annotation.dao;

import com.annotation.model.Paragraph;
import com.annotation.model.entity.ParagraphLabelEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ParagraphMapper {

    /**
     * 插入文件内容
     * @param record
     * @return
     */
    int insert(Paragraph record);

    /**
     * 设置数据库自增长为1
     * @return
     */
    int alterParagraphTable();

    int[] selectParaByDocId(Integer docId);


    int deleteByDocId(Integer docId);

    int countTotalPart(Integer tid);

    int countParaNum(Integer docId);

    int deleteByPrimaryKey(Integer pid);



    Paragraph selectByPrimaryKey(Integer pid);

    List<Paragraph> selectAll();

    int updateByPrimaryKey(Paragraph record);

    List<Paragraph> selectContentByDocId(Integer docId);


}