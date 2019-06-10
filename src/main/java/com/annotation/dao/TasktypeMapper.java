package com.annotation.dao;

import com.annotation.model.Tasktype;

import java.util.List;

public interface TasktypeMapper {
    int deleteByPrimaryKey(Integer typeid);

    int insert(Tasktype record);

    Tasktype selectByPrimaryKey(Integer typeid);

    List<Tasktype> selectAll();

    int updateByPrimaryKey(Tasktype record);
}