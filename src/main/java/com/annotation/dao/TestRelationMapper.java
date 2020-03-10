package com.annotation.dao;

import com.annotation.model.TestDocument;
import com.annotation.model.TestExtractionData;
import com.annotation.model.TestRelation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Ryan on 2019/12/9.
 */
@Mapper
@Repository
public interface TestRelationMapper {

    int insertAllRelationData(List<TestExtractionData> list);

    int insertAllRelationAnswer(List<TestRelation> list);
    int alterRelationDataTable();

    int alterRelationAnswerTable();
}
