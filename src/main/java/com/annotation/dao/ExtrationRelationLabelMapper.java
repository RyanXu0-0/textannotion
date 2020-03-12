package com.annotation.dao;

import com.annotation.model.ExtrationRelationLabel;
import org.springframework.stereotype.Repository;

@Repository
public interface ExtrationRelationLabelMapper {
    ExtrationRelationLabel selectByTaskid(int taskid);
    int insert(ExtrationRelationLabel record);
    int deleteByTaskId(int taskid);
    int alterRelationLabelTable();
}
