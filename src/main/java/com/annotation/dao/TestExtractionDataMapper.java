package com.annotation.dao;

import com.annotation.model.TestExtractionData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Ryan on 2019/12/9.
 */
@Mapper
@Repository
public interface TestExtractionDataMapper {



    int insertextraction(TestExtractionData record);

    int insertAll(List<TestExtractionData> list);

    int insertAllClassify(List<TestExtractionData> list);

    TestExtractionData selectByTaskid(@Param("taskId") int taskId,@Param("subtaskId") int subtaskId);

    int countTestNum(int taskId);
    int deleteByTaskid(Integer tid);
    TestExtractionData selectDataId(int dataId);
    TestExtractionData selectFirst(@Param("taskId")int taskId);
    TestExtractionData selectClassifyByDataId(int dataId);
    TestExtractionData selectClassifyByTaskid(@Param("taskId") int taskId,@Param("subtaskId") int subtaskId);

}
