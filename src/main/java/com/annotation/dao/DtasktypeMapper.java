package com.annotation.dao;

import com.annotation.model.Dtasktype;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface DtasktypeMapper {

    /**
     * 设置数据库自增长
     * @return
     */
    int alterDtasktypeTable();

    int insert(Dtasktype dtasktype);


    Dtasktype selectBytasktype(@Param("userId")Integer userId,@Param("typeId")Integer typeId);

    int updateByPrimaryKey(Dtasktype dtasktype);

}