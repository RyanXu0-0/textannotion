package com.annotation.service;

import com.annotation.model.entity.ExportSortingData;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.SortingData;
import com.annotation.model.entity.resHandle.ResSortingData;
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



    /**
     * 做任务---添加文本排序类型标注
     * @param

     * @return
     */
    ResponseEntity addSorting(int taskId,int docId,int instanceId, int userId, int[] itemIds, int[] newIndexs);



    List<SortingData> querySortingData(int tid);

    HSSFWorkbook getSortingExcel(List<SortingData> sortingDataList);

    List<ResSortingData> queryResSortingData(int tid,int docId,int instanceIndex);

    List<ExportSortingData> querySortingDataAndroid(int tid);

}
