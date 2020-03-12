package com.annotation.dao;

import com.annotation.model.TestDocument;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Ryan on 2019/12/9.
 */
@Mapper
@Repository
public interface TestDocumentMapper {


    List<TestDocument> selectAll();

    /**
     * 插入任务-文件关系表
     * @param record
     * @return
     */
    int insert(TestDocument record);

    int[] selectDocIdByTid(Integer tid);

    int deleteByTid(Integer tid);

    int alterTable();
}
