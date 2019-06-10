package com.annotation.dao;

import com.annotation.model.DInstance;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface DInstanceMapper {


    /**
     *
     * @param dtaskId
     * @param instId
     * @param docId
     * @return
     */
    DInstance selectByDtaskIdAndInstId(@Param("dtaskId")Integer dtaskId,
                                        @Param("instId")Integer instId,
                                        @Param("docId")Integer docId);


    List<DInstance> selectByDtaskIdAndDocId(@Param("dtaskId")Integer dtaskId,
                                             @Param("docId")Integer docId);

    List<DInstance> selectByDtaskId(Integer tkId);

    int updateStatusByPk(DInstance record);

    int insert(DInstance record);

    int alterDInstanceTable();

    int countDInstanceNum(@Param("docId")Integer docId,@Param("dtaskId")Integer dtaskId);

    int deleteByDtaskId(Integer dtaskId);

    int deleteByPrimaryKey(Integer dtid);



    DInstance selectByPrimaryKey(Integer dtid);

    List<DInstance> selectAll();

    int updateByPrimaryKey(DInstance record);
}