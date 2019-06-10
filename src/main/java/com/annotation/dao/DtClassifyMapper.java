package com.annotation.dao;

import com.annotation.model.DtClassify;
import com.annotation.model.entity.ClassifyData;
import com.annotation.model.entity.LabelCountEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DtClassifyMapper {



    /**
     * 根据文件ID查询所有的段落已经做过的标签
     * 分类
     * @param docId
     * @param userId
     * @return
     */
    List<ParagraphLabelEntity> selectClassifyParaLabel(@Param("docId") Integer docId,
                                                       @Param("userId")Integer userId,
                                                       @Param("dTaskId")Integer dTaskId);

    List<ParagraphLabelEntity> selectClassify(@Param("docId") Integer docId);

    int deleteByDtId(Integer dtId);


    List<ParagraphLabelEntity> selectClassifyWithStatus(Map<String,Object> data);

    /**
     * 根据文件ID查询所有的段落已经做过的标签
     * 分类
     * @param docId
     * @param userId
     * @return
     */
    List<ParagraphLabelEntity> selectClassifyWithoutDocId(@Param("tid") Integer tid, @Param("userId")Integer userId);

    List<LabelCountEntity> selectLabelCount(@Param("tid") Integer tid);


    //标注数据导出
    List<ClassifyData> getClassifyDataOut(int tid);



    int insert(DtClassify record);

    int alterDtClassifyTable();



    int deleteByPrimaryKey(Integer dtdId);



    DtClassify selectByPrimaryKey(Integer dtdId);

    List<DtClassify> selectAll();

    int updateByPrimaryKey(DtClassify record);
}