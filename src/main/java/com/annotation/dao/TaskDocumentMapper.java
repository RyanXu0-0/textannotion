package com.annotation.dao;

import com.annotation.model.TaskDocument;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/10.
 */
@Mapper
@Repository
public interface TaskDocumentMapper {


    List<TaskDocument> selectAll();

    /**
     * 插入任务-文件关系表
     * @param record
     * @return
     */
    int insert(TaskDocument record);

    int[] selectDocIdByTid(Integer tid);

    int deleteByTid(Integer tid);
}
