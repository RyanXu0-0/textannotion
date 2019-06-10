package com.annotation.dao;

import com.annotation.model.TaskLabel;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/12.
 */

@Mapper
@Repository
public interface TaskLabelMapper {


    List<TaskLabel> selectAll();

    /**
     *
     * @param record
     * @return
     */
    int insert(TaskLabel record);



    int deleteByTid(Integer tid);


    //List<TaskLabel> selectLabelsByTaskid(int tid);
}
