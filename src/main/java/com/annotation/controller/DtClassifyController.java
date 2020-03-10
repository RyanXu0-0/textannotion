package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.DtClassify;
import com.annotation.model.User;
import com.annotation.model.entity.LabelCountEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDParagraphService;
import com.annotation.service.IDtClassifyService;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Random;

/**
 * Created by twinkleStar on 2019/2/2.
 */

@RestController
@RequestMapping("/classify")
public class DtClassifyController {

    @Autowired
    IDtClassifyService iDtClassifyService;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    IDParagraphService idParagraphService;

    /**
     * 根据文件ID查询内容
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @param userId
     * @return
     */
    @GetMapping
    public JSONObject getClassificationPara(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                            int docId,String status,int taskId,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtClassifyService.queryClassifyParaLabel(docId,userId,status,taskId);

        //List<Content> contentList = iContentService.selectContentByDocId(docId);
        JSONObject rs = new JSONObject();
        if(paragraphLabelEntityList != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("data",paragraphLabelEntityList);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }


    /**
     * todo
     * 获取当前任务应做的段落
     * @param httpSession
     * @param docId
     * @param taskId
     * @param userId
     * @return
     */
    @GetMapping
    @RequestMapping("/getCurrentTaskParagraph")
    public JSONObject getCurrentClassificationTask(HttpSession httpSession, int docId,int taskId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtClassifyService.queryClassifyParaLabel(docId,userId,"进行中",taskId);


        JSONObject rs = new JSONObject();
        Random r = new Random();
        if(paragraphLabelEntityList != null){
            rs.put("type","common_task");
            rs.put("msg","query file successfully");
            rs.put("code",0);
            int random = r.nextInt(paragraphLabelEntityList.size());
            rs.put("data",paragraphLabelEntityList.get(random));
        }else{
            rs.put("msg","query file fail");
            rs.put("code",-1);
        }
        return rs;
    }


    /**
     * todo
     * 跳过当前任务应做的段落,并进入下一段
     * @param httpSession
     * @param docId
     * @param taskId
     * @param userId
     * @return
     */
    @GetMapping
    @RequestMapping("/passCurrentTaskParagraph")
    public JSONObject passCurrentTaskParagraph(HttpSession httpSession,int docId,  int paraId , int taskId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtClassifyService.queryClassifyParaLabel(docId,userId,"进行中",taskId);

        JSONObject rs = new JSONObject();
        Random r = new Random();
        if(paragraphLabelEntityList != null){
            rs.put("type","test_task");
            rs.put("msg","query file successfully");
            rs.put("code",0);
            int random = r.nextInt(paragraphLabelEntityList.size());
            rs.put("data",paragraphLabelEntityList.get(random));
        }else{
            rs.put("msg","query file fail");
            rs.put("code",-1);
        }
        return rs;

    }


    /**
     * todo
     * @param httpSession
     * @param taskId
     * @param docId
     * @param paraId
     * @param labelId
     * @param userId
     * @return
     */

    @PostMapping
    @RequestMapping("/compareWithOtherAnnotation")
    public String compareWithOtherAnnotation(HttpSession httpSession,int docId,int taskId,int paraId,int[] labelId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        return "90.5% 相似度";
    }






    /**
     * 提交段落标签
     * @param httpSession
     * @param taskId
     * @param docId
     * @param paraId
     * @param labelId
     * @param userId
     * @return
     */
    @PostMapping
    public ResponseEntity doClassify(HttpSession httpSession,
                                     int taskId,int docId,int paraId,int[] labelId,@RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        int dtid =iDtClassifyService.addClassify(userId,taskId, docId, paraId,labelId);//创建做任务表的结果

        if(dtid==4001 || dtid==4005|| dtid==4006|| dtid==4007|| dtid==4008|| dtid==4009){
            ResponseEntity responseEntity = responseUtil.judgeResult(dtid);
            return responseEntity;
        }else{
            return responseUtil.judgeDoTaskController(dtid);
        }

    }


    /**
     * 根据文件ID和UserID查询内容
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @return
     */
    @GetMapping("/detail")
    public JSONObject getClassificationDetail(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                              int docId,int userId,String status,int taskId) {
        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtClassifyService.queryClassifyParaLabel(docId,userId,status,taskId);

        List<LabelCountEntity> labelCountEntityList=iDtClassifyService.queryAlreadyLabel(taskId);
        JSONObject rs = new JSONObject();
        if(paragraphLabelEntityList != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("data",paragraphLabelEntityList);
            rs.put("labelCount",labelCountEntityList);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }



    @PostMapping("/ucomment")
    public ResponseEntity addComment(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                       int dtdId,int cNum,int flag,int uId) {
        //User user =(User)httpSession.getAttribute("currentUser");


        DtClassify dtClassifyRes=iDtClassifyService.addComment(dtdId, cNum, flag, uId);
        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setMsg("评论成功");
        responseEntity.setStatus(0);
        responseEntity.setData(dtClassifyRes);
        return responseEntity;
    }










}
