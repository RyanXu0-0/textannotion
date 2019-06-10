package com.annotation.dao;

import com.annotation.model.DtRelation;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.RelationData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DtRelationMapper {


    /**
     * 根据文件id获取所有的instance和item
     * 包括已经做好的
     * @param docId
     * @param
     * @return
     */
    List<InstanceItemEntity> selectRelation(@Param("docId")Integer docId);

    List<InstanceItemEntity> selectRelationWithStatus(Map<String,Object> data);

    List<InstanceItemEntity> selectRelationInstanceItem(@Param("docId")Integer docId,
                                                        @Param("userId")Integer userId,
                                                        @Param("dTaskId")Integer dTaskId);


    int deleteByDtId(Integer dtId);

    int insert(DtRelation record);

    int alterDtRelationTable();

    /**
     * 批量插入labelid
     * 做任务表
     * @param dtInstId
     * @param labeltype
     * @param itemLabels
     * @return
     */
    int insertLabelList(@Param("dt_id")Integer dt_id,@Param("labeltype")String labeltype, @Param("itemLabels")int[] itemLabels);






    int deleteByPrimaryKey(Integer dtdId);



    DtRelation selectByPrimaryKey(Integer dtdId);

    List<DtRelation> selectAll();

    int updateByPrimaryKey(DtRelation record);
    //标注数据导出
    List<RelationData> getRelationDataOut(int tid);
}