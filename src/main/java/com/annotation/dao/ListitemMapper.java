package com.annotation.dao;

import com.annotation.model.Listitem;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ListitemMapper {


    /**
     *
     * @return
     */
    int alterListitemTable();

    /**
     *
     * @param record
     * @return
     */
    int insert(Listitem record);




    int deleteByPrimaryKey(Integer ltid);

    int deleteByInstId(Integer instId);


    Listitem selectByPrimaryKey(Integer liid);

    List<Listitem> selectAll();

    int updateByPrimaryKey(Listitem record);

    List<Listitem> selectListItemContentByDocId(int docId);


}