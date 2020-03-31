package com.annotation.dao;


import com.annotation.model.UserSubtask;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface UserSubtaskMapper {
    int alterDtInstanceTable();
    int insert(UserSubtask data);
    UserSubtask selectByUserIdAndSubtaskId(@Param("userId")Integer userId,@Param("taskId")Integer taskId,@Param("subtaskId")Integer subtaskId);
    UserSubtask selectLastData(@Param("userId")Integer userId,@Param("taskId")Integer taskId,@Param("subtaskId")Integer subtaskId);
    UserSubtask selectNextData(@Param("userId")Integer userId,@Param("taskId")Integer taskId,@Param("subtaskId")Integer subtaskId);
    UserSubtask selectTheLastData(@Param("userId")Integer userId,@Param("taskId")Integer taskId);

    int update(UserSubtask data);

    int deleteAllByTaskId(@Param("taskId")Integer taskId);
}