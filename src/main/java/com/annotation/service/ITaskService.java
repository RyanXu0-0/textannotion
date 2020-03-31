package com.annotation.service;

import com.annotation.model.Task;
import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.TaskInfoEntity;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/9.
 */
public interface ITaskService {

    /**
     * 添加doc和task关系表
     * @param taskId
     * @param docIds
     * @return
     */
    int addTaskDoc(int taskId,List<Integer> docIds);

    /**
     * 信息抽取
     * @param task
     * @param docIds
     * @param labels
     * @param colors
     * @return
     */
    @Transactional
    ResponseEntity addTaskOfExtration(Task task, List<Integer> docIds, String[] labels,String[] relalabels, String[] colors);

    /**
     * 信息抽取检测任务
     * @param task
     * @param docIds
     * @param labels
     * @param colors
     * @return
     */
    @Transactional
    ResponseEntity addTestOfExtration(Task task, List<Integer> docIds, String[] labels,String[] relalabels, String[] colors);

    /**
     * 分类
     * @param task
     * @param docIds
     * @param labels
     * @param colors
     * @return
     */
    @Transactional
    ResponseEntity addTaskOfDocPara(Task task, List<Integer> docIds, String[] labels, String[] colors);

    /**
     * 分类
     * @param task
     * @param docIds
     * @param labels
     * @param colors
     * @return
     */
    @Transactional
    ResponseEntity addTestOfDocPara(Task task, List<Integer> docIds, String[] labels, String[] colors);


    /**
     * 文本关系
     * @param task
     * @param docIds
     * @param instanceLabel
     * @param item1Label
     * @param item2Label
     * @return
     */
    @Transactional
    ResponseEntity addTaskOfRelation(Task task, List<Integer> docIds, String[] instanceLabel, String[] item1Label, String[] item2Label);

    @Transactional
    ResponseEntity addTestOfRelation(Task task, List<Integer> docIds, String[] instanceLabel, String[] item1Label, String[] item2Label);

    /**
     * 文本匹配/文本排序
     * @param task
     * @param docids
     * @return
     */
    @Transactional
    ResponseEntity addTaskOfPairingAndSorting(Task task, List<Integer> docids);

    @Transactional
    ResponseEntity addTestOfPairingAndSorting(Task task, List<Integer> docids);


    /**
     * 分页查询所有可以做的任务
     * @param page
     * @param limit
     * @return
     */
    List<Task> queryTotalTaskOfUndo(User user, int page, int limit);


    /**
     * 查询所有可以做的任务的数量
     *
     * @return
     */
    int countNumOfUndo(int userId);

    /**
     *
     * @param userId
     * @param page
     * @param limit
     * @return
     */
    List<Task> queryMyPubTask(int userId, int page, int limit);

    int countNumOfMyPubTask(int userId);

    /**
     * 根据ID查询任务详情
     *
     * @param tid
     * @return
     */
    TaskInfoEntity queryTaskInfo(int tid,int typeId);


    @Transactional
    int deleteTaskInfo(int tid,int typeId);







    /**
     * 根据用户ID查询任务总数
     *
     * @param userId
     * @return
     */
//    int countTasknumByUserId(int userId);

//    /**
//     * 获取所有的任务
//     *
//     * @return
//     */
//    public List<Task> getAll();


    int saveTask(Task task);




    /**
     * 根据任务ID查询发布者姓名
     *
     * @param tid
     * @return
     */
//    String queryUserName(int tid);

     /**
     * 根据任务类型查询任务
     * @param tasktype
     * @return
     */
     List<Task> selectTaskByType(String tasktype);






}
