package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.Paragraph;
import com.annotation.model.User;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.service.IDtClassifyService;
import com.annotation.service.IDtExtractionService;
import com.annotation.service.IParagraphService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by twinkleStar on 2018/12/16.
 */


@RestController
@RequestMapping("/paragraph")
public class ParagraphController {

    @Autowired
    IParagraphService iParagraphService;

    /**
     *
     * @param docId
     * @return
     */
    @GetMapping
    public JSONObject getParagraphContent(int docId) {

        List<Paragraph> contentList = iParagraphService.selectContentByDocId(docId);

        JSONObject rs = new JSONObject();
        if(contentList != null){
            rs.put("msg","查询成功");
            rs.put("code",0);
            rs.put("data",contentList);

        }else{
            rs.put("msg","查询失败");
            rs.put("code",-1);
        }
        return rs;
    }

}
