package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.Document;
import com.annotation.model.User;
import com.annotation.model.entity.*;
import com.annotation.service.*;
import com.annotation.util.ExcelUtil;
import com.annotation.util.FileUtil;
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
    public JSONObject exportRelation(HttpServletRequest request,HttpServletResponse response,int tid) throws Exception {
        //获取数据
        List<RelationData> relationDataList=iDtRelationService.queryRelationData(tid);
        JSONObject jso =new JSONObject();
        if(relationDataList==null){
            jso.put("msg","查询失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","success");
            jso.put("code",0);
            jso.put("data",relationDataList);
        }
        return jso;
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
     * 添加单个文件
     * @param request
     * @param httpSession
     * @param multipartFile
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
//    @RequestMapping(value = "addsinglefile", method = RequestMethod.POST)
//    @ResponseBody
//    public ResponseEntity addSingleFile(HttpServletRequest request,HttpSession httpSession,
//                          HttpServletResponse httpServletResponse,
//                          @RequestParam( value="files",required=false)MultipartFile multipartFile,
//                                        String userid) throws IllegalStateException, IOException {//这里一定要写required=false 不然前端不传文件一定报错。到不了后台。
//        ResponseEntity responseEntity = new ResponseEntity();
//
//        String filename =multipartFile.getOriginalFilename();//文件名称
//        InputStream inputStream = multipartFile.getInputStream();
//        String docContent="";//文件内容
//        String docType="";//文件类型
//        try {
//            if (filename.endsWith(".doc")) {
//                docType=".doc";
//                WordExtractor ex = new WordExtractor(inputStream);
//                docContent = ex.getText();
//            } else if (filename.endsWith("docx")) {
//                docType=".docx";
//                XWPFDocument xdoc = new XWPFDocument(inputStream);
//                XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);
//                docContent= extractor.getText();
//                inputStream.close();
//            } else if(filename.endsWith(".txt")){
//                docType=".txt";
//                InputStreamReader reader = new InputStreamReader(inputStream,"GBK");
//                BufferedReader br = new BufferedReader(reader);
//                String line;
//                StringBuilder sb = new StringBuilder();
//                while ((line = br.readLine()) != null) {
//                    sb.append(line);
//                }
//                docContent = sb.toString();
//            }else{
//                responseEntity.setStatus(-1);
//                responseEntity.setMsg(filename+"文件类型不符合要求");
//                return responseEntity;
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//
//        User user =(User)httpSession.getAttribute("currentUser");
//        if(!userid.equals(null) && !userid.equals("")){
//            user.setId(Integer.parseInt(userid));
//        }
//
//        Document document = new Document();
//        document.setFilename(filename);
//        document.setFiletype(docType);
//        document.setFilesize((int)multipartFile.getSize());
//
//        //todo:建文件服务器后设置路径
//        document.setAbsolutepath("");
//        document.setRelativepath("");
//
//        //设置时间
//        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//        document.setDocuploadtime(df.format(new Date()));
//        document.setDoccomptime("");
//        document.setDocstatus("未完成");
//
//        //添加文件
//        //防止自增的ID不连续
//        iDocumentService.alterDocumentTable();
//        int docRes =iDocumentService.addDocument(document,user,docContent);
//
//        switch (docRes){
//            case -1:
//                responseEntity.setStatus(-1);
//                responseEntity.setMsg(filename+"添加文件失败，请检查");
//                break;
//            case -2:
//                responseEntity.setStatus(-1);
//                responseEntity.setMsg(filename+"文件分段内容长度太长，请重新用#分段");
//                break;
//            case -3:
//                responseEntity.setStatus(-1);
//                responseEntity.setMsg(filename+"文件内容插入失败");
//                break;
//            default:
//                responseEntity.setStatus(0);
//                responseEntity.setMsg(filename+"文件上传成功");
//                Map<String, Object> data = new HashMap<>();
//                data.put("docId", docRes);//返回文件id，方便后续添加任务
//                responseEntity.setData(data);
//        }
//
//        return responseEntity;
//
//    }

    //todo:多文件上传，还没处理
//    @Transactional
//    @RequestMapping(value = "addmultifile", method = RequestMethod.POST)
//    @ResponseBody
//    public String addMultiFile(HttpServletRequest request,HttpSession httpSession,
//                                        @RequestParam( value="files[]",required=false)MultipartFile[] multipartFiles) throws IllegalStateException, IOException {//这里一定要写required=false 不然前端不传文件一定报错。到不了后台。
//       String retuName ="";
//        for(int i=0;i<multipartFiles.length;i++){
//            MultipartFile file=multipartFiles[i];
//
//
//            retuName=retuName+file.getOriginalFilename()+"#";
//        }
//        return retuName;
//
//    }

    /**
     * 分页查询---用户上传的文件列表
     * @param httpServletRequest
     * @param httpServletResponse
     * @param httpSession
     * @param page
     * @param limit
     * @return
     */
//    @RequestMapping(value = "getDoclist", method = RequestMethod.GET)
//    @ResponseBody
//    public JSONObject getDoclist(HttpServletRequest httpServletRequest,HttpServletResponse httpServletResponse,
//                                HttpSession httpSession, int page, int limit) {
//        User user =(User)httpSession.getAttribute("currentUser");
//
//        List<Document> documentList = iDocumentService.queryDocByRelatedInfo(user.getId(),page,limit);
//
//        int count=iDocumentService.countNumByUserId(user.getId());
//
//        JSONObject rs =new JSONObject();
//        if(documentList !=null){
//            rs.put("msg","success");
//            rs.put("code",0);
//            rs.put("data",documentList);
//            rs.put("count",count);
//        }else{
//            rs.put("msg","查询失败");
//            rs.put("code",-1);
//        }
//
//        return rs;
//    }

    /**
     * 返回文件内容，文件预览
     * @param file
     * @return
     */
//    @RequestMapping(value = "getDoccontent", method = RequestMethod.GET)
//    @ResponseBody
//    public ResponseEntity getDoccontent(@RequestParam( value="files",required=false) MultipartFile file) throws IllegalStateException, IOException{
//
//        ResponseEntity responseEntity = new ResponseEntity();
//
//        String filename =file.getOriginalFilename();//文件名称
//        int filetype = FileUtil.checkfiletype(filename);
//        if(filetype==-1){
//            responseEntity.setStatus(-1);
//            responseEntity.setMsg(filename+"文件类型不符合要求");
//            return responseEntity;
//        }
//
//        int content = FileUtil.checkfilecontent(file);
//        if(content==-4){
//            responseEntity.setStatus(-1);
//            responseEntity.setMsg(filename +"单个文件大小超过限制");
//            return responseEntity;
//        }else if(content==-2){
//            responseEntity.setStatus(-1);
//            responseEntity.setMsg(filename +"文件中有的item为空");
//            return responseEntity;
//        }else if(content==-3){
//            responseEntity.setStatus(-1);
//            responseEntity.setMsg(filename+"文件中有的item超过字数限制,文件分段内容长度太长，请重新用#分段");
//            return responseEntity;
//        }
//
//        String docContent = FileUtil.parsefilecontent(file);
//        responseEntity.setStatus(0);
//        responseEntity.setMsg(filename+"文件内容解析成功");
//        Map<String, Object> data = new HashMap<>();
//        data.put("docContent", docContent);//返回文件id，方便后续添加任务
//        responseEntity.setData(data);
//        return responseEntity;
//    }

}
