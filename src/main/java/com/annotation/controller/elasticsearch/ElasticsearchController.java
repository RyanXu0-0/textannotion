//package com.annotation.controller.elasticsearch;
//
//import com.alibaba.fastjson.JSONObject;
//import com.annotation.elasticsearch.document.TaskDoc;
//import com.annotation.elasticsearch.repository.TaskDocRepository;
//import com.annotation.elasticsearch.service.TaskDocService;
//import org.elasticsearch.index.query.QueryBuilders;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
//import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RestController;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.util.List;
//
///**
// * Created by twinkleStar on 2019/2/22.
// */
//@RestController
//@RequestMapping("task")
//public class ElasticsearchController {
//    @Autowired
//    TaskDocService taskDocService;
//    @Autowired
//    ElasticsearchTemplate elasticsearchTemplate;
//    @Autowired
//    TaskDocRepository taskDocRepository;
//
//
//    @PostMapping(value = "/keyword")
//    public JSONObject taskSearch(HttpSession httpSession, HttpServletRequest request, HttpServletResponse httpServletResponse,
//                                 String title, String type, String pubUsername,
//                                 int page, int limit) {
//
//        NativeSearchQueryBuilder queryBuilder = new NativeSearchQueryBuilder();
//        //queryBuilder.withQuery(QueryBuilders.termQuery("typeName", "文本").boost(3));
//
//        if(type!=null && type!=""){
//           queryBuilder.withQuery(QueryBuilders.termQuery("typeName", type));
//        }
//        if(pubUsername!=null && pubUsername!=""){
//            queryBuilder.withQuery(QueryBuilders.termQuery("pubUserName", pubUsername));
//        }
//
//        if(title!=null && title!=""){
//            queryBuilder.withQuery(QueryBuilders.termQuery("title", title));
//        }
//
//
//        Pageable pageable = new PageRequest(page-1, limit);
//        queryBuilder.withPageable(pageable);
//        Page<TaskDoc> taskList = this.taskDocRepository.search(queryBuilder.build());
////        long total = items.getTotalElements();
////        System.out.println("总条数 = " + total);
////        System.out.println("总页数 = " + items.getTotalPages());
////        System.out.println("当前页：" + items.getNumber());
////        System.out.println("每页大小：" + items.getSize());
//
//
//        JSONObject jso =new JSONObject();
//        if(taskList==null){
//            jso.put("msg","查询失败");
//            jso.put("code",-1);
//        }else{
//            jso.put("msg","success");
//            jso.put("code",0);
//            jso.put("data",taskList.getContent());
//            jso.put("count",taskList.getTotalElements());
//        }
//        return jso;
//    }
//
//}
