package com.annotation.controller;

import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDParagraphService;
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
@RequestMapping("/dpara")
public class DParagraphController {
    @Autowired
    IDParagraphService idParagraphService;
    @Autowired
    ResponseUtil responseUtil;



    @Transactional
    @PostMapping("/doc/status")
    public ResponseEntity updateStatusByDocId(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                       int docId, int taskId,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        int upRes=idParagraphService.updateStatusByDocId(userId,docId,taskId);
        if(upRes==4010|| upRes==4011|| upRes==4012){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            ResponseEntity responseEntity=responseUtil.judgeResult(upRes);
            return responseEntity;
        }else{
            ResponseEntity responseEntity=new ResponseEntity();
            responseEntity.setMsg("完成该文档");
            responseEntity.setStatus(0);
            return responseEntity;
        }

    }


    @Transactional
    @PostMapping("/status")
    public ResponseEntity updateStatus(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                       int docId, int taskId,int paraId,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        int upRes=idParagraphService.updateStatus(userId,docId,taskId,paraId);
        if(upRes==4010|| upRes==4013|| upRes==4012){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            ResponseEntity responseEntity=responseUtil.judgeResult(upRes);
            return responseEntity;
        }else{
            ResponseEntity responseEntity=new ResponseEntity();
            responseEntity.setMsg("完成该文档");
            responseEntity.setStatus(0);
            return responseEntity;
        }

    }
}
