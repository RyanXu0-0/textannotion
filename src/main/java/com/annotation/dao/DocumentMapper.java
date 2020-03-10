package com.annotation.dao;

import com.annotation.model.Document;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface DocumentMapper {

       /**
        * 插入文件信息 --> document
        * @param record
        * @return
        */
       int insert(Document record);

       /**
        * 设置数据库自增长为1
        * @return
        */
       int alterDocumentTable();


       int deleteByPrimaryKey(Integer did);




}