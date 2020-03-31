package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.Document;
import com.annotation.model.User;
import com.annotation.model.entity.*;
import com.annotation.service.*;
import com.annotation.util.ExcelUtil;
import com.annotation.util.FileUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.hwpf.usermodel.Paragraph;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2018/12/8.
 */

@RestController
@RequestMapping("/file")
public class DocumentController {

//    @Autowired
//    IDocumentService iDocumentService;

    @Autowired
    ExcelUtil excelUtil;
    @Autowired
    IDtPairingService iDtPairingService;
    @Autowired
    IDtClassifyService iDtClassifyService;
    @Autowired
    IDtSortingService iDtSortingService;
    @Autowired
    IDtExtractionService iDtExtractionService;
    @Autowired
    IDtRelationService iDtRelationService;

    //文本配对类型导出
    @RequestMapping(value = "/pairing")
    @ResponseBody
    public void exportPairing(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
       List<PairingData> pairingDataList=iDtPairingService.queryPairingData(tid);


           //todo:判断d_task表中完成度！=0%的记录
           String fileName = "文本配对数据导出"+System.currentTimeMillis()+".xls";
           HSSFWorkbook wb=iDtPairingService.getPairingExcel(pairingDataList);
           //响应到客户端
           try {
               this.setResponseHeader(response, fileName);
               OutputStream os = response.getOutputStream();
               wb.write(os);
               os.flush();
               os.close();
           } catch (Exception e) {
               e.printStackTrace();
           }







    }


    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            try {
                fileName = new String(fileName.getBytes(),"ISO8859-1");
            } catch (UnsupportedEncodingException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            response.setContentType("application/octet-stream;charset=ISO8859-1");
            response.setHeader("Content-Disposition", "attachment;filename="+ fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }



    @RequestMapping(value = "/classify")
    @ResponseBody
    public void exportClassify(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<ClassifyData> classifyDataList=iDtClassifyService.queryClassifyData(tid);

        String fileName = "文本分类数据导出"+System.currentTimeMillis()+".xls";
        HSSFWorkbook wb=iDtClassifyService.getClassifyExcel(classifyDataList);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/extraction")
    @ResponseBody
    public JSONObject exportExtraction(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<ExtractionData> extractionDataList=iDtExtractionService.queryExtractionData(tid);
        JSONObject jso =new JSONObject();
        if(extractionDataList==null){
            jso.put("msg","查询失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","success");
            jso.put("code",0);
            jso.put("data",extractionDataList);
        }
        return jso;
    }


    @RequestMapping(value = "/relation")
    @ResponseBody
    public void exportRelation(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<RelationData> relationDataList=iDtRelationService.queryRelationData(tid);
        String fileName = "关系类型数据导出"+System.currentTimeMillis()+".xls";
        HSSFWorkbook wb=iDtRelationService.getRelationExcel(relationDataList);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/sortingandroid")
    @ResponseBody
    public JSONObject exportSortingAndroid(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<ExportSortingData> sortingDataList=iDtSortingService.querySortingDataAndroid(tid);
        JSONObject jso =new JSONObject();
        if(sortingDataList==null){
            jso.put("msg","查询失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","success");
            jso.put("code",0);
            jso.put("data",sortingDataList);
        }
        return jso;
    }




    @RequestMapping(value = "/sorting")
    @ResponseBody
    public void exportSorting(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<SortingData> sortingDataList=iDtSortingService.querySortingData(tid);

        String fileName = "排序类型数据导出"+System.currentTimeMillis()+".xls";
        HSSFWorkbook wb=iDtSortingService.getSortingExcel(sortingDataList);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }




    /**
     * excel导出
     */
    @GetMapping("/extraction")
    public void exportPermMatrix(HttpServletRequest request, HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<ExtractionData> extractionDataList=iDtExtractionService.queryExtractionData(tid);

        String fileName = "信息抽取类型数据导出"+System.currentTimeMillis()+".xls";
        HSSFWorkbook wb=iDtExtractionService.getExtractionExcel(extractionDataList);

        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
