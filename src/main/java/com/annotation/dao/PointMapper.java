package com.annotation.dao;

import com.annotation.model.Point;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface PointMapper {

    /**
     * 设置数据库自增长
     * @return
     */
    int alterPointTable();

    int insert(Point point);

    Point selectByUserId(Integer userId);

    int updateownByPrimaryKey(Point point);

    int updateobtainByPrimaryKey(Point point);
}