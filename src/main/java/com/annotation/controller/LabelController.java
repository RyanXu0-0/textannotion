package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.Label;
import com.annotation.service.ILabelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by twinkleStar on 2018/12/19.
 */
@RestController
@RequestMapping("/label/")
public class LabelController {

    @Autowired
    ILabelService iLabelService;

    /**
     * 根据文件内容查询标签
     * @param httpSession
     * @param taskid
     * @return
     */
//    @RequestMapping(value = "getLabelByTask", method = RequestMethod.GET)
//    @ResponseBody
//    public JSONObject getLabelByTask(HttpServletRequest request, HttpServletResponse httpServletResponse,
//                                     HttpSession httpSession, int taskid) {
//        List<Label> labels = iLabelService.queryLabelByTaskId(taskid);
//        JSONObject rs =new JSONObject();
//        if(labels!=null){
//            rs.put("label",labels);
//            rs.put("status",0);
//            rs.put("msg","查询成功");
//        }else{
//            rs.put("status",-1);
//            rs.put("msg","查询失败");
//        }
//        return rs;
//    }
//

}
