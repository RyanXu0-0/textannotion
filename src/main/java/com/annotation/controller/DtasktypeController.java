package com.annotation.controller;

import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDtasktypeService;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by twinkleStar on 2019/2/8.
 */
@RestController
@RequestMapping("/dtasktype")
public class DtasktypeController {

    @Autowired
    IDtasktypeService iDtasktypeService;
    @Autowired
    ResponseUtil responseUtil;

    /*@Transactional
    @PostMapping("/insert")
    public ResponseEntity insertDtasktype(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,HttpSession httpSession,@RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        int upRes = iDtasktypeService.insert(userId);
        if(upRes<0){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            ResponseEntity responseEntity=new ResponseEntity();
            responseEntity.setMsg("插入失败");
            responseEntity.setStatus(-1);
            return responseEntity;
        }else{
            ResponseEntity responseEntity=new ResponseEntity();
            responseEntity.setMsg("插入成功");
            responseEntity.setStatus(0);
            return responseEntity;
        }
    }*/


    @Transactional
    @PostMapping("/update")
    public ResponseEntity updateDtasktype(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                          int typeId,@RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        int upRes=iDtasktypeService.updateByUserId(userId,typeId);

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
