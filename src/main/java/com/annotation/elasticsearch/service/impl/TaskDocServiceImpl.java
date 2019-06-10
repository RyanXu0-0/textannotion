//package com.annotation.elasticsearch.service.impl;
//
//import com.annotation.elasticsearch.document.TaskDoc;
//
//import com.annotation.elasticsearch.repository.TaskDocRepository;
//import com.annotation.elasticsearch.service.TaskDocService;
//import com.annotation.model.Task;
//import com.annotation.service.ITaskService;
//import org.elasticsearch.index.query.QueryStringQueryBuilder;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
//import org.springframework.stereotype.Repository;
//
//import java.util.ArrayList;
//import java.util.Iterator;
//import java.util.List;
//
///**
// * Created by twinkleStar on 2019/2/23.
// */
//@Repository
//public class TaskDocServiceImpl implements TaskDocService{
//
//    @Autowired
//    ElasticsearchTemplate elasticsearchTemplate;
//    @Autowired
//    ITaskService iTaskService;
//
////    public void createIndex(){
////        elasticsearchTemplate.createIndex(TaskTest.class);
////        elasticsearchTemplate.putMapping(TaskTest.class);
////    }
////    public List<TaskTest> search(String searchContent) {
////        QueryStringQueryBuilder builder = new QueryStringQueryBuilder(searchContent);
////        System.out.println("查询的语句:"+builder);
////        Iterable<TaskTest> searchResult = taskDao.search(builder);
////        Iterator<TaskTest> iterator = searchResult.iterator();
////        List<TaskTest> list=new ArrayList<>();
////        while (iterator.hasNext()) {
////            list.add(iterator.next());
////        }
////        return list;
////    }
//
//
//
//
////    public void saveTask(){
////        List<Task> taskList=iTaskService.queryTotalTaskOfUndo(1,20);
////        for (Task task1:taskList){
////            TaskDoc taskDoc=new TaskDoc();
////            taskDoc.setAttendnum(task1.getAttendnum());
////            taskDoc.setViewnum(task1.getViewnum());
////            taskDoc.setCreatetime(task1.getCreatetime());
////            taskDoc.setDeadline(task1.getDeadline());
////            taskDoc.setDescription(task1.getDescription());
////            taskDoc.setOtherinfo(task1.getOtherinfo());
////            taskDoc.setPubUserName(task1.getPubUserName());
////            taskDoc.setTitle(task1.getTitle());
////            taskDoc.setTid(task1.getTid());
////            taskDoc.setTypeName(task1.getTypeName());
////            taskDoc.setUserId(task1.getUserId());
////            taskDoc.setTaskcompstatus(task1.getTaskcompstatus());
////            taskDocRepository.save(taskDoc);
////        }
////
////    }
//}
