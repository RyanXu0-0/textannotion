package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.Point;
import com.annotation.service.IDtasktypeService;
import com.annotation.service.IPointService;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by twinkleStar on 2019/2/8.
 */
@RestController
@RequestMapping("/point")
public class PointController {

    @Autowired
    IPointService iPointService;
    @Autowired
    ResponseUtil responseUtil;

    @GetMapping("/select")
    public JSONObject updatePoint(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                          @RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        Point point =iPointService.selectByUserId(userId);
        JSONObject rs = new JSONObject();
        if(point != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("data",point);

        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

    @Transactional
    @PostMapping("/update")
    public ResponseEntity updatePoint(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                          @RequestParam(defaultValue="0")int userId,int obtainuserId,int taskId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        int upRes=iPointService.updateByUserId(userId,obtainuserId,taskId);

        if(upRes<0){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            ResponseEntity responseEntity=new ResponseEntity();
            responseEntity.setMsg("更新失败");
            responseEntity.setStatus(-1);
            return responseEntity;
        }else{
            ResponseEntity responseEntity=new ResponseEntity();
            responseEntity.setMsg("更新成功");
            responseEntity.setStatus(0);
            return responseEntity;
        }

    }
}
