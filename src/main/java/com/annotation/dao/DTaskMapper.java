package com.annotation.dao;

import com.annotation.model.DTask;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DTaskMapper {

    /**
     *
     * @param taskId
     * @param userId
     * @return
     */
    DTask selectByTaskIdAndUserId(@Param("taskId")Integer taskId,@Param("userId")Integer userId);




    /**
     *
     * @param record
     * @return
     */
    int insert(DTask record);



    /**
     * 分页查询
     * @param data
     * @return
     */
    List<DTask> selectMyPubTaskByDoingDetail(Map<String,Object> data);



    /**
     * 分页查询
     * @param data
     * @return
     */
    List<DTask> selectMyDoingTaskByStatus(Map<String,Object> data);

    int deleteByTaskId(Integer tid);

    int deleteByPrimaryKey(Integer tkid);


    List<DTask> selectByTaskId(Integer tid);

    DTask selectByPrimaryKey(Integer tkid);

    List<DTask> selectAll();

    int updateByPrimaryKey(DTask record);
}