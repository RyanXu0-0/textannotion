package com.annotation.service;

import com.annotation.model.entity.*;
import com.annotation.model.entity.resHandle.ResSortingData;
import org.apache.ibatis.annotations.Param;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
public interface IDtSortingService {


    /**
     * 查询instance+item
     * @param docId
     * @return
     */
    List<InstanceItemEntity> querySortingInstanceItem(int docId, int userId,String status,int taskId);

    InstanceItemEntity getSortingData(int userId, int taskId);

    /**
     * 做任务---添加文本排序类型标注
     * @param

     * @return
     */
    ResponseEntity addSorting(int taskId,int instanceId, int userId, int[] itemIds, int[] newIndexs);

    ResponseEntity qualityControl(int taskId,int instanceId, int userId, int[] itemIds, int[] newIndexs);

    List<SortingData> querySortingData(int tid);

    HSSFWorkbook getSortingExcel(List<SortingData> sortingDataList);

    List<ResSortingData> queryResSortingData(int tid,int docId,int instanceIndex);

    List<ExportSortingData> querySortingDataAndroid(int tid);

    InstanceItemEntity getLastSortingData(int userId, int taskId,int subtaskId);

    ResponseEntity getNextSortingData(int userId, int taskId,int subtaskId);

    InstanceItemEntity getSortingDone(int subtaskId , int userId,int taskId);

    InstanceItemEntity getLastDone(int taskId,int subtaskId);

    InstanceItemEntity getNextDone(int taskId,int subtaskId);
}
