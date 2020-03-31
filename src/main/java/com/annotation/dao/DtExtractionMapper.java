package com.annotation.dao;

import com.annotation.model.DtExtraction;
import com.annotation.model.TestExtractionEntity;
import com.annotation.model.entity.ExtractionData;
import com.annotation.model.entity.ParagraphLabelEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DtExtractionMapper {



    List<DtExtraction> selectByTaskidAndSubtaskid(@Param("taskId")int taskId, @Param("subtaskId") int subtaskId);
    /**
     * 根据文件ID查询所有的段落已经做过的标签
     * @param docId
     * @return
     */
    List<ParagraphLabelEntity> selectExtraction(@Param("docId") Integer docId);

    List<ParagraphLabelEntity> selectExtractionParaLabel(@Param("docId") Integer docId,
                                                         @Param("userId")Integer userId,
                                                         @Param("dTaskId")Integer dTaskId,
                                                         @Param("taskId")Integer taskId);

    int deleteAllByTaskId(@Param("taskId")Integer taskId);

    List<ParagraphLabelEntity> selectExtractionWithStatus(Map<String,Object> data);



    int insert(DtExtraction record);

    int alterDtExtractionTable();


    int deleteByPrimaryKey(Integer dtdId);

    int deleteBeforeUpdate(@Param("userId") Integer userId,@Param("taskId")Integer taskId,@Param("subtaskId")Integer subtaskId);

    DtExtraction selectByPrimaryKey(Integer dtdId);

    List<DtExtraction> selectAll();

    int updateByPrimaryKey(DtExtraction record);
    //标注数据导出
    List<ExtractionData> getExtractionDataOut(int tid);

    List<DtExtraction> selectCurrentDone(@Param("userId") Integer userId,@Param("taskId")Integer taskId,@Param("subtaskId")Integer subtaskId);
}