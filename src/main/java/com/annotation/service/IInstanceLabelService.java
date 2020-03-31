package com.annotation.service;

import com.annotation.model.Label;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
public interface IInstanceLabelService {

    /**
     * 根据文件ID查询instance对应的label
     * @param docId
     * @return
     */
    List<Label> queryInstanceLabelByDocId(int docId);

    /**
     * 根据文件ID查询item1对应的label
     * @param docId
     * @return
     */
    List<Label> queryItem1LabelByDocId(int docId);

    /**
     * 根据文件ID查询item2对应的label
     * @param taskId
     * @return
     */
    List<Label> queryItem2LabelByTaskId(int taskId);

    /**
            * 根据文件ID查询instance对应的label
     * @param taskId
     * @return
             */
    List<Label> queryInstanceLabelByTaskId(int taskId);

    /**
     * 根据文件ID查询item1对应的label
     * @param taskId
     * @return
     */
    List<Label> queryItem1LabelByTaskId(int taskId);

    /**
     * 根据文件ID查询item2对应的label
     * @param docId
     * @return
     */
    List<Label> queryItem2LabelByDocId(int docId);
}
