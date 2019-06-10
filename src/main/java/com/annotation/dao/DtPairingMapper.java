package com.annotation.dao;

import com.annotation.model.DtPairing;
import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.model.entity.PairingData;
import com.annotation.model.entity.resHandle.ResPairingData;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface DtPairingMapper {

    /**
     * 根据文件id获取所有的instance和item
     * 文本关系标注
     * @param docId
     * @return
     */
    List<InstanceListitemEntity> selectPairing(@Param("docId")Integer docId);

    List<InstanceListitemEntity> selectInstanceListitem(@Param("docId")Integer docId,
                                                        @Param("userId")Integer userId,
                                                        @Param("dTaskId")Integer dTaskId);

    List<InstanceListitemEntity> selectPairingWithStatus(Map<String,Object> data);


    int deleteByDtId(Integer dtId);

    int alterDtPairingTable();


    /**
     * 单个记录判定重复后再插入
     * 一对一
     * @param dtInstId
     * @param aListItemId
     * @param bListItemId
     * @return
     */
    int insertRelationListByOneToOne(@Param("dtid")int dtid, @Param("aListItemId")int aListItemId, @Param("bListItemId")int bListItemId);

    /**
     * 单个记录判定重复后再插入
     * 一对多
     * @param dtInstId
     * @param aListItemId
     * @param bListItemId
     * @return
     */
    int insertRelationListByOneToMany(@Param("dtid")int dtid, @Param("aListItemId")int aListItemId, @Param("bListItemId")int bListItemId);

    /**
     * 单个记录判定重复后再插入
     * 多对多
     * @param dtInstId
     * @param aListItemId
     * @param bListItemId
     * @return
     */
    int insertRelationListByManyToMany(@Param("dtid")int dtid, @Param("aListItemId")int aListItemId, @Param("bListItemId")int bListItemId);


    /**
     * 标注数据导出
     * @param tid
     * @return
     */
    List<PairingData> getPairingDataOut(int tid);


    List<ResPairingData> getResPairingData(@Param("tid")Integer tid,
                                                @Param("docId")Integer docId,
                                                @Param("instanceIndex")Integer instanceIndex);


    int deleteByPrimaryKey(Integer dtdId);

    int insert(DtPairing record);

    DtPairing selectByPrimaryKey(Integer dtdId);

    List<DtPairing> selectAll();

    int updateByPrimaryKey(DtPairing record);
}