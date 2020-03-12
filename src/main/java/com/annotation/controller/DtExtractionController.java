package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.dao.DtasktypeMapper;
import com.annotation.model.Dtasktype;
import com.annotation.model.User;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDtExtractionService;
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
@RequestMapping("/extraction")
public class DtExtractionController {

    @Autowired
    IDtExtractionService iDtExtractionService;
    @Autowired
    ResponseUtil responseUtil;

    @Autowired
    DtasktypeMapper dtasktypeMapper;

    /**
     * 根据文件ID查询内容
     * 信息抽取
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @param userId
     * @return
     */
    @GetMapping
    public JSONObject getExtractionPara(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                        int docId,String status,int taskId,@RequestParam(defaultValue="0")int userId) {

        System.out.println("userId:"+userId);
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        //信息抽取的typeId为1
        Dtasktype dtasktype = dtasktypeMapper.selectBytasktype(userId,1);
        if(dtasktype!=null){
            int typevalue = dtasktype.getTypevalue();
            if(typevalue==0){
                JSONObject rs = new JSONObject();
                rs.put("msg","还未通过信息抽取类型的任务的标注例题的测试");
                rs.put("code",-2);
                return rs;
            }
        }

        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtExtractionService.queryExtractionParaLabel(docId,userId,status,taskId);

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
     *
     * @param httpSession
     * @param taskId
     * @param docId
     * @param paraId
     * @param labelId
     * @param indexBegin
     * @param indexEnd
     * @param userId
     * @return
     */
   @PostMapping
    public ResponseEntity doExtraction(HttpSession httpSession,
                                       int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd,@RequestParam(defaultValue="0")int userId) {

       if(userId==0){
           User user =(User)httpSession.getAttribute("currentUser");
           userId = user.getId();
       }

        int dtid =iDtExtractionService.addExtraction(userId,taskId,docId,paraId,labelId,indexBegin,indexEnd);//创建做任务表的结果

        if(dtid==4001 || dtid==4002|| dtid==4003|| dtid==4005){
            ResponseEntity responseEntity = responseUtil.judgeResult(dtid);
            return responseEntity;
        }else{
            return responseUtil.judgeDoTaskController(dtid);
        }

    }


    @GetMapping("/detail")
    public JSONObject getExtractionDetail(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                          int docId,int userId,String status,int taskId) {


        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtExtractionService.queryExtractionParaLabel(docId,userId,status,taskId);

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

        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtExtractionService.queryExtractionParaLabel(docId,userId,"全部",taskId);


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

        List<ParagraphLabelEntity> paragraphLabelEntityList=iDtExtractionService.queryExtractionParaLabel(docId,userId,"全部",taskId);

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
     * @param userId
     * @return
     */

    @PostMapping
    @RequestMapping("/compareWithOtherAnnotation")
    public String compareWithOtherAnnotation(HttpSession httpSession,int docId,int taskId,int paraId,@RequestParam(defaultValue="0")int userId){

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        return "90.5% 相似度";
    }





}
