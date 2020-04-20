package com.annotation.service;

import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.model.entity.PairingData;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.resHandle.ResPairingData;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
public interface IDtPairingService {

    /**
     * 查询instance+listitem
     * @param docId
     * @return
     */
    List<InstanceListitemEntity> queryInstanceListitem(int docId, int userId,String status,int taskId);

    /**
     * 做任务---文本配对关系
     * @param userId
     * @param aListItemId
     * @param bListItemId
     * @return
     */
    String addPairing(int taskId,int docId,int instanceId,int userId,int[] aListItemId,int[] bListItemId,String taskType);




    /**
     * 文本配对--一对一
     * @param dtInstId
     * @param aListitemId
     * @param bListitemId
     * @return
     */
    String insertOneToOneRelations(int dtInstId,int[] aListitemId,int[] bListitemId);

    /**
     * 文本配对--一对多
     * @param dtInstId
     * @param aListitemId
     * @param bListitemId
     * @return
     */
    String insertOneToManyRelations(int dtInstId,int[] aListitemId,int[] bListitemId);


    /**
     * 文本配对--多对多
     * @param dtInstId
     * @param aListitemId
     * @param bListitemId
     * @return
     */
    String insertManyToManyRelations(int dtInstId,int[] aListitemId,int[] bListitemId);


    List<PairingData> queryPairingData(int tid);

    HSSFWorkbook getPairingExcel(List<PairingData> pairingDataList);

    List<ResPairingData> queryResPairingData(int tid, int docId, int instanceIndex);


    InstanceListitemEntity getPairingData(int userId, int taskId);
    String qualityControl(int taskId,int docId,int subtaskId,int userId,int[] aListItemId,int[] bListItemId,String taskType);


    ResponseEntity getNextPairingData(int userId, int taskId, int subtaskId);

    InstanceListitemEntity getLastPairingData(int userId, int taskId,int subtaskId);

    List<InstanceListitemEntity> getInstanceDone(int subtaskId, int userId,int taskId);
}
