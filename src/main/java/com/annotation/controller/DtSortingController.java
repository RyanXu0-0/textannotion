package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.User;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.resHandle.ResSortingData;
import com.annotation.service.IDtSortingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@RestController
@RequestMapping("/sorting")
public class DtSortingController {

    @Autowired
    IDtSortingService iDtSortingService;


    /**
     * 根据文件ID获取instance+item
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @param userId
     * @return
     */
    @GetMapping
    public JSONObject getSortingInstanceItem(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                             int docId,String status,int taskId,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<InstanceItemEntity> instanceItemEntityList = new ArrayList<InstanceItemEntity>();
        InstanceItemEntity instanceItemEntities  = iDtSortingService.getSortingData(userId,taskId);
        instanceItemEntityList.add(instanceItemEntities);

        JSONObject rs = new JSONObject();
        if(instanceItemEntityList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("instanceItem",instanceItemEntityList);

        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }


    @GetMapping("/detail")
    public JSONObject getSortingInstanceItemDetail(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                             int subtaskId,int taskId,int userId) {

        InstanceItemEntity instanceItemEntity = iDtSortingService.getSortingDone(subtaskId,userId,taskId);

        JSONObject rs = new JSONObject();
        if(instanceItemEntity != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("instanceItem",instanceItemEntity);

        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

    @PostMapping
    public ResponseEntity doSorting(HttpSession httpSession,
                                         int taskId,int docId,int instanceId, int[] itemIds, int[] newIndex,@RequestParam(defaultValue="0")int userId) {

       if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        ResponseEntity responseEntity =iDtSortingService.qualityControl(taskId,instanceId,userId,itemIds,newIndex);//创建做任务表的结果
        return responseEntity;
    }



    @GetMapping("/result")
    public JSONObject getResSorting( HttpSession httpSession,
                                             int tid,int docId,int instanceIndex) {

        List<ResSortingData> resSortingDataList = iDtSortingService.queryResSortingData(tid,docId,instanceIndex);

        JSONObject rs = new JSONObject();
        if(resSortingDataList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("resSorting",resSortingDataList);
        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

    @PostMapping
    @RequestMapping("/lasttask")
    public JSONObject lastSortingTask(HttpSession httpSession,int taskId,int subtaskId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        System.out.println("当前任务id："+subtaskId);
        InstanceItemEntity instanceItemEntity = iDtSortingService.getLastSortingData(userId,taskId,subtaskId);
        JSONObject rs = new JSONObject();
        if(instanceItemEntity != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("data",instanceItemEntity);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }



    @PostMapping
    @RequestMapping("/nexttask")
    public JSONObject nextSortingTask(HttpSession httpSession,int taskId,int subtaskId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        ResponseEntity response  = iDtSortingService.getNextSortingData(userId,taskId,subtaskId);
        JSONObject rs = new JSONObject();
        if(response.getData()!= null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("data",response.getData());
        }else{
            rs.put("msg",response.getMsg());
            rs.put("code",response.getStatus());
        }
        return rs;
    }

    @PostMapping
    @RequestMapping("/lastdonetask")
    public JSONObject lastDoneClassifyTask(HttpSession httpSession,int taskId,int subtaskId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        System.out.println("当前任务id："+subtaskId);
        InstanceItemEntity instanceItemEntity = iDtSortingService.getLastDone(taskId,subtaskId);
        JSONObject rs = new JSONObject();
        if(instanceItemEntity != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("data",instanceItemEntity);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }

    @PostMapping
    @RequestMapping("/nextdonetask")
    public JSONObject nextDoneClassifyTask(HttpSession httpSession,int taskId,int subtaskId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        System.out.println("当前任务id："+subtaskId);
        InstanceItemEntity instanceItemEntity = iDtSortingService.getNextDone(taskId,subtaskId);
        JSONObject rs = new JSONObject();
        if(instanceItemEntity != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("data",instanceItemEntity);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }
}
