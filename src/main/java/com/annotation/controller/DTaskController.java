package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.DTask;
import com.annotation.model.User;
import com.annotation.service.IDTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by twinkleStar on 2019/2/4.
 */
@RestController
@RequestMapping("/dtask")
public class DTaskController {

    @Autowired
    IDTaskService idTaskService;

    /**
     * 做我发布的单个任务的做的情况
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param taskId
     * @param page
     * @param limit
     * @return
     */
    @GetMapping(value = "/detail")
    public JSONObject getMyPubTaskByDoingDetail(
            HttpServletRequest request, HttpServletResponse httpServletResponse,
            HttpSession httpSession, int taskId, int page, int limit) {

        List<DTask> dTaskList = idTaskService.queryMyPubTaskByDoingDetail(taskId,page,limit);
        int count=dTaskList.size();

        JSONObject rs =new JSONObject();
        if(dTaskList==null){
            rs.put("msg","查询失败");
            rs.put("code",-1);
            rs.put("count",0);
        }else{
            rs.put("msg","success");
            rs.put("code",0);
            rs.put("data",dTaskList);
            rs.put("count",count);
        }

        return rs;
    }


    /**
     * 根据状态（已完成/进行中）查询我做的任务
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param dtstatus
     * @param page
     * @param limit
     * @return
     */
    @GetMapping(value = "/status")
    public JSONObject getMyDoingTaskList(
            HttpServletRequest request,
            HttpServletResponse httpServletResponse,
            HttpSession httpSession,
            String dtstatus,
            int page, int limit,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<DTask> dTaskList = idTaskService.queryMyDoingTask(userId,dtstatus,page,limit);
        int count=dTaskList.size();
        JSONObject rs =new JSONObject();
        if(dTaskList==null){
            rs.put("msg","查询失败");
            rs.put("code",-1);
            rs.put("count",0);
        }else{
            rs.put("msg","success");
            rs.put("code",0);
            rs.put("data",dTaskList);
            rs.put("count",count);
        }

        return rs;
    }
}
