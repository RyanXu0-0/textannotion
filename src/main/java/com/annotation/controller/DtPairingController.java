package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.User;
import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.model.entity.resHandle.ResPairingData;
import com.annotation.service.IDtPairingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@RestController
@RequestMapping("/pairing")
public class DtPairingController {



    @Autowired
    IDtPairingService iDtPairingService;
    /**
     * 根据文件ID查询instance+listitem
     * @param httpServletRequest
     * @param httpServletResponse
     * @param docId
     * @return
     */
    @GetMapping
    public JSONObject getPairingInstance(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                         int docId,String status,int taskId,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<InstanceListitemEntity> instanceItemEntityList = iDtPairingService.queryInstanceListitem(docId,userId,status,taskId);
        JSONObject rs = new JSONObject();
        if(instanceItemEntityList != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("instanceItem",instanceItemEntityList);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }


    @GetMapping("/detail")
    public JSONObject getPairingInstanceDetail(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, HttpSession httpSession,
                                         int docId,String status,int taskId,int userId) {

        List<InstanceListitemEntity> instanceItemEntityList = iDtPairingService.queryInstanceListitem(docId,userId,status,taskId);
        JSONObject rs = new JSONObject();
        if(instanceItemEntityList != null){
            rs.put("msg","查询文件内容成功");
            rs.put("code",0);
            rs.put("instanceItem",instanceItemEntityList);
        }else{
            rs.put("msg","查询文件内容失败");
            rs.put("code",-1);
        }
        return rs;
    }

    /**
     * 做任务文本配对
     * @param httpSession
     * @param taskId
     * @param docId
     * @param instanceId
     * @param aListitemId
     * @param bListitemId
     * @param taskType
     * @param userId
     * @return
     */
    @PostMapping
    public JSONObject doPairing(HttpSession httpSession,
                                  int taskId,int docId,int instanceId,int[] aListitemId, int[] bListitemId,String taskType,@RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        String dtInstItRes =iDtPairingService.addPairing(taskId,docId,instanceId,userId,aListitemId,bListitemId,taskType);
        JSONObject jso =new JSONObject();

        if(dtInstItRes.contains("0")){
            jso.put("msg","部分添加失败");
            jso.put("code",-1);
            jso.put("faildata",dtInstItRes.substring(1));
//            String tmpStr=dtInstItRes.substring(1);
//            String[] tmpArr=tmpStr.split("#");

        }else{
            switch (dtInstItRes){
                case "-1":
                    jso.put("msg","添加做任务表失败，请检查");
                    jso.put("code",-1);
                    break;
                case "-3":
                    jso.put("msg","更新任务状态失败");
                    jso.put("code",-1);
                    break;
                case "-4":
                    jso.put("msg","更新文档状态失败");
                    jso.put("code",-1);
                    break;
                default:
                    jso.put("msg","添加做任务表成功");
                    jso.put("code",0);
                    jso.put("dtInstid",dtInstItRes);
            }
        }



        return jso;
    }


    @GetMapping("/result")
    public JSONObject getResPairing( HttpSession httpSession,
                                     int tid,int docId,int instanceIndex) {

        List<ResPairingData> resPairingDataList = iDtPairingService.queryResPairingData(tid,docId,instanceIndex);

        JSONObject rs = new JSONObject();
        if(resPairingDataList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("resPairing",resPairingDataList);
        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

}
