package com.annotation.dao;

import com.annotation.model.ExtrationRelationLabel;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExtrationRelationLabelMapper {
    List<ExtrationRelationLabel> selectByTaskid(int taskid);
    int insert(ExtrationRelationLabel record);
    int deleteByTaskId(int taskid);
    int alterRelationLabelTable();

    int delete(@Param("taskId") Integer taskId);
}
