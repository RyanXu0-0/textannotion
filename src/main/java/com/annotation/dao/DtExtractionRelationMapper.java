package com.annotation.dao;


import com.annotation.model.DtExtractionRelation;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface DtExtractionRelationMapper {

    int insert(DtExtractionRelation record);
    int alterDtExtractionRelationTable();
}