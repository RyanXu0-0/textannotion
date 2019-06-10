package com.annotation.dao;

import com.annotation.model.DParagraph;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DParagraphMapper {


    /**
     *
     * @param dtaskId
     * @param paraId
     * @param docId
     * @return
     */
    DParagraph selectByDtaskIdAndParaId(@Param("dtaskId")Integer dtaskId,
                                        @Param("docId")Integer docId,
                                        @Param("paraId")Integer paraId);



    List<DParagraph> selectByDtaskIdAndDocId(@Param("dtaskId")Integer dtaskId,
                                        @Param("docId")Integer docId);

    List<DParagraph> selectByDtaskId(Integer tkId);

    int updateStatusByPk(DParagraph record);

    int countDParaNum(@Param("docId")Integer docId,@Param("dtaskId")Integer dtaskId);

    int deleteByDtaskId(Integer dtaskId);

    /**
     *
     * @param record
     * @return
     */
    int insert(DParagraph record);


    int alterDParagraphTable();



    int deleteByPrimaryKey(Integer dtid);



    DParagraph selectByPrimaryKey(Integer dtid);

    List<DParagraph> selectAll();

    int updateByPrimaryKey(DParagraph record);
}