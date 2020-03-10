package com.annotation.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.annotation.dao.DTaskMapper;
import com.annotation.dao.DtasktypeMapper;
import com.annotation.dao.UserMapper;
import com.annotation.model.*;
import com.annotation.model.DtExtractionRelation;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.service.ICrowdsourcingService;
import com.annotation.service.IDtExtractionService;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 * 实体抽取和关系抽取
 */
@Controller
@RequestMapping("/extraction")
public class DtExtractionController {

    @Autowired
    IDtExtractionService iDtExtractionService;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    ICrowdsourcingService crowdsourcingService;
    @Autowired
    DtasktypeMapper dtasktypeMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    DTaskMapper dTaskMapper;
    /**
     * 根据文件ID查询内容
     * 信息抽取
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @param userId
     * @return
     */
    @ResponseBody
    @GetMapping
    public JSONObject getExtractionPara(HttpServletRequest httpServletRequest, HttpSession httpSession, HttpServletResponse httpServletResponse,
                                        int docId,String status,int taskId,@RequestParam(defaultValue="0")int userId) {
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
        List<ParagraphLabelEntity> paragraphLabelEntityList = new ArrayList<>();
       // List<ParagraphLabelEntity> paragraphLabelEntityList=iDtExtractionService.queryExtractionParaLabel(docId,userId,status,taskId);
        paragraphLabelEntityList.add(crowdsourcingService.extractionCrowdsourcing(userId,taskId));
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


    @PostMapping("/submit")
    public String submitData(HttpSession httpSession,int taskId, @RequestParam(value = "entities")String entities,@RequestParam(value = "relations") String relations){
        User userInfo =(User)httpSession.getAttribute("currentUser");
        int userId = userInfo.getId();
        List<DtExtraction> entityList=new ArrayList<>();
        List<DtExtractionRelation> relationList=new ArrayList<>();
        JSONArray entitiesArray= JSONArray.parseArray(entities);
        JSONArray relationsArray= JSONArray.parseArray(relations);
        DTask dTask = dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
        for(int i=0;i<entitiesArray.size();i++){
            JSONObject jsonResult = entitiesArray.getJSONObject(i);
            DtExtraction tempEntity=JSONObject.toJavaObject(jsonResult, DtExtraction.class);
            System.out.println(tempEntity.toString());
            entityList.add(tempEntity);
        }
        System.out.println(userId+taskId);
        for(int i=0;i<relationsArray.size();i++){
            JSONObject jsonResult = relationsArray.getJSONObject(i);
            DtExtractionRelation tempRelation=JSONObject.toJavaObject(jsonResult,DtExtractionRelation.class);
            System.out.println(tempRelation.toString());
            relationList.add(tempRelation);
        }
        if("test".equals(dTask.getCurrentStatus())){
            iDtExtractionService.contrastWithTest(dTask,entityList,relationList);
            return "u_homepage";
        }
        iDtExtractionService.addExtraction(userId,taskId,entityList,relationList);
        return "u_homepage";
    }

    @PostMapping("/nexttask")
    public void getNextTask(){
        System.out.println("nexttask");
    }

    /**
     *
     * @param httpSession
     * @param taskId
     * @param docId
     * @param userId
     * @return
     */
//   @PostMapping
   // @ResponseBody
//    public ResponseEntity doExtraction(HttpSession httpSession,
//                                       int taskId,int docId,int paraId,int labelId,int indexBegin,int indexEnd,@RequestParam(defaultValue="0")int userId) {
//
//       if(userId==0){
//           User user =(User)httpSession.getAttribute("currentUser");
//           userId = user.getId();
//       }
//
//        int dtid =iDtExtractionService.addExtraction(userId,taskId,docId,paraId,labelId,indexBegin,indexEnd);//创建做任务表的结果
//
//        if(dtid==4001 || dtid==4002|| dtid==4003|| dtid==4005){
//            ResponseEntity responseEntity = responseUtil.judgeResult(dtid);
//            return responseEntity;
//        }else{
//            return responseUtil.judgeDoTaskController(dtid);
//        }
//
//    }

    @ResponseBody
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

}
