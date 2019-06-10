package com.annotation.dao;

import com.annotation.model.Item;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ItemMapper {

    int deleteByInstId(Integer instId);

    int deleteByPrimaryKey(Integer itid);

    int insert(Item record);

    Item selectByPrimaryKey(Integer itid);

    List<Item> selectAll();

    int updateByPrimaryKey(Item record);

    int alterItemTable();

    List<Item> selectItemContentByDocId(int docId);
}