package com.annotation.dao;

import com.annotation.model.PointUnit;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface PointUnitMapper {

    /**
     * 设置数据库自增长
     * @return
     */
    int alterPointUnitTable();

    int insert(PointUnit pointUnit);

    PointUnit selectBytaskId(Integer taskId);

    int deleteByTid(Integer tid);

}