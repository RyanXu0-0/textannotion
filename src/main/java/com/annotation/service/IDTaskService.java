package com.annotation.service;

import com.annotation.model.DTask;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/4.
 */
public interface IDTaskService {

    /**
     * 查询某个任务的做任务情况（多个参与者）
     * @param taskId
     * @param page
     * @param limit
     * @return
     */
    List<DTask> queryMyPubTaskByDoingDetail(int taskId, int page, int limit);

    List<DTask> queryMyDoingTask(int userId, String dtstatus,int page, int limit);

    int addDTaskOfPara(int userId,int TaskId);

    int addDTaskOfInstance(int userId,int TaskId);
}
