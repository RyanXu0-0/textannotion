package com.annotation.dao;

import com.annotation.model.DtSorting;
import com.annotation.model.entity.ExportSortingData;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.SortingData;
import com.annotation.model.entity.resHandle.ResSortingData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DtSortingMapper {


    /**
     * 根据文件id获取所有的instance和item
     * 包括已经做好的
     * @param docId
     * @param
     * @return
     */
    List<InstanceItemEntity> selectSorting(@Param("docId")Integer docId);

    List<InstanceItemEntity> selectSortingInstanceItem(@Param("docId")Integer docId,
                                                       @Param("userId")Integer userId,
                                                       @Param("dTaskId")Integer dTaskId);


    List<InstanceItemEntity> selectSortingWithStatus(Map<String,Object> data);


    int deleteByDtId(Integer dtId);



    DtSorting selectByDtIdAndItemId(@Param("dtId")Integer dtid,
                                    @Param("itemId")Integer itemId);


    //标注数据导出
    List<SortingData> getSortingDataOut(int tid);



    List<ResSortingData> getResSortingData(@Param("tid")Integer tid,
                                           @Param("docId")Integer docId,
                                           @Param("instanceIndex")Integer instanceIndex);

    int alterDtSortingTable();

    int insert(DtSorting record);

    int updateNewIndex(DtSorting record);



    int deleteByPrimaryKey(Integer dtdId);



    DtSorting selectByPrimaryKey(Integer dtdId);

    List<DtSorting> selectAll();

    int updateByPrimaryKey(DtSorting record);

    //标注数据导出
    List<ExportSortingData> getSortingDataOutAndroid(int tid);
}