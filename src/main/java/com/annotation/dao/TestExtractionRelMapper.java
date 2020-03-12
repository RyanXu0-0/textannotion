package com.annotation.dao;

import com.annotation.model.TestExtractionRel;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Ryan on 2019/12/23.
 */
@Mapper
@Repository
public interface TestExtractionRelMapper {



    int insert(TestExtractionRel record);

    List<TestExtractionRel> selectTaskid(int taskId);

    List<TestExtractionRel> selectByTaskidAndSubtaskid(@Param("taskId")Integer taskId, @Param("subtaskId") Integer subtaskId);

    int deleteByTaskid(Integer tid);

    int insertAll(List<TestExtractionRel> list);
}
