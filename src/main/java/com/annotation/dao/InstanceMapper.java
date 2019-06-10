package com.annotation.dao;

import com.annotation.model.Instance;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.InstanceListitemEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface InstanceMapper {


    /**
     * 设置数据库自增长为1
     * @return
     */
    int alterInstanceTable();

    /**
     *
     * @param record
     * @return
     */
    int insert(Instance record);

    int[] selectInstanceByDocId(Integer docId);

    int deleteByDocId(Integer docId);

    int deleteByPrimaryKey(Integer insid);


    int countTotalPart(Integer tid);

    int countInstanceNum(Integer countParaNum);





}