package com.annotation.service;

import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.RelationData;
import com.annotation.model.entity.ResponseEntity;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
public interface IDtRelationService {


    /**
     * 查询instance+item
     * @param docId
     * @return
     */
    List<InstanceItemEntity> queryInstanceItem(int docId, int userId,String status,int taskId);



    /**
     * 做任务---添加文本关系类型标注
     * InstanceItem

     * @return
     */
    //int addRelation(int userId,int taskId,int docId,int instanceId,int[] instanceLabels, int item1Id, int[] item1Labels, int item2Id, int[] item2Labels);

    /**
     * 做任务--插入dtdItemLabel表的操作，因为要插入两次，所以单独写出来

     * @return
     */
    //int insertLabels(int dtId,String labeltype,int[] labels);

    List<RelationData> queryRelationData(int tid);

    InstanceItemEntity getRelationData(int userId, int taskId);

    int qualityControl(int userId,int taskId,int docId,int instanceId,int[] instanceLabels, int[] item1Labels, int[] item2Labels);

    InstanceItemEntity getLastRelationData(int userId, int taskId,int subtaskId);

    ResponseEntity getNextRelationData(int userId, int taskId, int subtaskId);

    HSSFWorkbook getRelationExcel(List<RelationData> pairingDataList);
}
