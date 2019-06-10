package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.Label;
import com.annotation.model.User;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDtRelationService;
import com.annotation.service.IInstanceLabelService;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@RestController
@RequestMapping("/relation")
public class DtRelationController {

    @Autowired
    IDtRelationService iDtRelationService;
    @Autowired
    IInstanceLabelService iInstanceLabelService;
    @Autowired
    ResponseUtil responseUtil;

    /**
     * 根据文件ID获取instance+item
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @param userId
     * @return
     */
    @GetMapping
    public JSONObject getRelationInstance(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                          int docId,String status,int taskId,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<InstanceItemEntity> instanceItemEntityList = iDtRelationService.queryInstanceItem(docId,userId,status,taskId);
        List<Label> instanceLabel =iInstanceLabelService.queryInstanceLabelByDocId(docId);
        List<Label> item1Label =iInstanceLabelService.queryItem1LabelByDocId(docId);
        List<Label> item2Label = iInstanceLabelService.queryItem2LabelByDocId(docId);

        JSONObject rs = new JSONObject();
        if(instanceItemEntityList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("instanceItem",instanceItemEntityList);
            rs.put("instanceLabel",instanceLabel);
            rs.put("item1Label",item1Label);
            rs.put("item2Label",item2Label);
        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }


    @GetMapping("/detail")
    public JSONObject getRelationInstanceDetail(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                          int docId,String status,int taskId,int userId) {


        List<InstanceItemEntity> instanceItemEntityList = iDtRelationService.queryInstanceItem(docId,userId,status,taskId);
        List<Label> instanceLabel =iInstanceLabelService.queryInstanceLabelByDocId(docId);
        List<Label> item1Label =iInstanceLabelService.queryItem1LabelByDocId(docId);
        List<Label> item2Label = iInstanceLabelService.queryItem2LabelByDocId(docId);

        JSONObject rs = new JSONObject();
        if(instanceItemEntityList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("instanceItem",instanceItemEntityList);
            rs.put("instanceLabel",instanceLabel);
            rs.put("item1Label",item1Label);
            rs.put("item2Label",item2Label);
        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

    /**
     * 文本关系
     * instance+item
     * @param httpSession
     * @param taskId
     * @param docId
     * @param instanceId
     * @param instanceLabels
     * @param item1Id
     * @param item1Labels
     * @param item2Id
     * @param item2Labels
     * @param userId
     * @return
     */
    @PostMapping
    public ResponseEntity doRelation(HttpSession httpSession,
                                      int taskId,int docId,int instanceId,int[] instanceLabels, int item1Id, int[] item1Labels, int item2Id, int[] item2Labels,@RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        int dtid =iDtRelationService.addRelation(userId,taskId,docId,instanceId,instanceLabels,item1Id,item1Labels,item2Id,item2Labels);//创建做任务表的结果
        if(dtid==4001 || dtid==4002|| dtid==4004|| dtid==4005){
            ResponseEntity responseEntity = responseUtil.judgeResult(dtid);
            return responseEntity;
        }else{
            return responseUtil.judgeDoTaskController(dtid);
        }
    }


}
