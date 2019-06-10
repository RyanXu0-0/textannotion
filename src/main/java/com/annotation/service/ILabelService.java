package com.annotation.service;

import com.annotation.model.Label;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/19.
 */
public interface ILabelService {

    /**
     * 根据任务ID查询标签
     * @param taskid
     * @return
     */
    Label queryLabelByTaskId(String taskid);




}
