package com.annotation.dao;

import com.annotation.model.TestExtractionEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Ryan on 2019/12/23.
 */
@Mapper
@Repository
public interface TestExtractionEntityMapper {



    int insert(TestExtractionEntity record);

    List<TestExtractionEntity> selectTaskid(int taskId);

    List<TestExtractionEntity> selectByTaskidAndSubtaskid(@Param("taskId")int taskId,@Param("subtaskId") int subtaskId);

    int deleteByTaskid(Integer tid);

    int insertAll(List<TestExtractionEntity> list);
}
