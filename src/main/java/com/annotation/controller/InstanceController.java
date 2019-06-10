package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;

import com.annotation.model.Item;
import com.annotation.model.Label;
import com.annotation.model.Listitem;
import com.annotation.model.User;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.spi.WebServiceFeatureAnnotation;
import java.util.List;

/**
 * Created by twinkleStar on 2018/12/29.
 */

@RestController
@RequestMapping("/instance")
public class InstanceController {

    @Autowired
    IInstanceService iInstanceService;
    @Autowired
    ILabelService iLabelService;

    /**
     * 根据文件ID获取item的内容
     * @param docId
     * @return
     */
    @GetMapping(value = "/item")
    public JSONObject getItemContent(int docId) {

        List<Item> itemList = iInstanceService.selectItemContentByDocId(docId);

        JSONObject rs = new JSONObject();
        if(itemList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("data",itemList);

        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

    /**
     * 根据文件ID获取listitem的内容
     * @param docId
     * @return
     */
    @GetMapping(value = "/listitem")
    public JSONObject getListItemContent(int docId) {

        List<Listitem> listitemList = iInstanceService.selectListItemContentByDocId(docId);

        JSONObject rs = new JSONObject();
        if(listitemList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("data",listitemList);

        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }



}
