package com.annotation.dao;


import com.annotation.model.DtExtractionRelation;
import com.annotation.model.TestExtractionRel;
import com.annotation.model.entity.ExtractionData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


@Mapper
@Repository
public interface DtExtractionRelationMapper {

    List<DtExtractionRelation> selectByTaskidAndSubtaskid(@Param("taskId")Integer taskId, @Param("subtaskId") Integer subtaskId);

    int insert(DtExtractionRelation record);
    int alterDtExtractionRelationTable();

    int deleteBeforeUpdate(@Param("userId") Integer userId,@Param("taskId")Integer taskId,@Param("subtaskId")Integer subtaskId);

    List<DtExtractionRelation> selectCurrentDone(@Param("userId") Integer userId, @Param("taskId")Integer taskId, @Param("subtaskId")Integer subtaskId);

    int delete(@Param("taskId") Integer taskId);

    int deleteAllByTaskId(@Param("taskId")Integer taskId);
}