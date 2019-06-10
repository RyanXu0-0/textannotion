package com.annotation.util;

import com.alibaba.fastjson.JSONObject;
//import com.annotation.elasticsearch.document.TaskDoc;
import com.annotation.model.*;
import com.annotation.model.entity.ParagraphLabelEntity;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.SortingData;
import org.apache.poi.hssf.usermodel.HSSFSheet;
//import org.elasticsearch.index.query.QueryBuilders;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.data.annotation.AccessType;
//import org.springframework.data.domain.Page;
//import org.springframework.data.domain.PageRequest;
//import org.springframework.data.domain.Pageable;
//import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFHeader;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by twinkleStar on 2019/3/8.
 */
public class test {


//    use textannotation;
//    SELECT dtask_id, document_id ,count(*) as doc
//    FROM extannotation.d_paragraph group by document_id;


//@PostMapping("/comment")
//public ResponseEntity doComment(HttpSession httpSession,
//                                 int dtdId,int labelId,int commentNum) {
//
//    User user =(User)httpSession.getAttribute("currentUser");
//
//    int dtmRes =iDtClassifyService.addComment(user.getId(),dtdId, labelId, commentNum);//创建做任务表的结果
//
//    if(dtmRes==4016 || dtmRes==4017){
//        ResponseEntity responseEntity = responseUtil.judgeResult(dtmRes);
//        return responseEntity;
//    }else{
//        return responseUtil.judgeDoTaskController(dtmRes);
//    }
//
//}


//@GetMapping("/comment")
//public ResponseEntity handleComment(HttpSession httpSession,
//                                int taskId,int docId,String status) {
//
//    User user =(User)httpSession.getAttribute("currentUser");
//
//    int dtmRes =iDtClassifyService.calComment(user.getId(),taskId, docId,status);
//
//    if(dtmRes==4016 || dtmRes==4017){
//        ResponseEntity responseEntity = responseUtil.judgeResult(dtmRes);
//        return responseEntity;
//    }else{
//        return responseUtil.judgeDoTaskController(dtmRes);
//    }
//
//}


//@GetMapping("/comment")
//public JSONObject handleComment(HttpSession httpSession,int docId,String status,int taskId) {
//    User user =(User)httpSession.getAttribute("currentUser");
//    List<ParagraphLabelEntity> paraLabelEntityList=iDtClassifyService.calComment(docId,user.getId(),status,taskId);
//
//    JSONObject rs = new JSONObject();
//    if(paraLabelEntityList != null){
//        rs.put("msg","预处理成功");
//        rs.put("code",0);
//        rs.put("data",paraLabelEntityList);
//    }else{
//        rs.put("msg","预处理失败");
//        rs.put("code",-1);
//    }
//    return rs;
//}


//public int updateStatus(int userId,int docId,int taskId,int instanceId){
//    DTask dTask=iDTaskService.selectByTaskIdAndUserId(taskId,userId);
//    if(dTask==null){
//        return 4010;
//    }else{
//        int dTaskId=dTask.getTkid();
//
//        DInstance dInstance=dInstanceMapper.selectByDtaskIdAndInstId(dTaskId,instanceId,docId);
//        if(dInstance==null){
//            return 4013;
//        }else {
//
//            int alreadyPart=dTask.getAlreadypart()+1;
//            int totalPart=dTask.getTotalpart();
//            dTask.setAlreadypart(alreadyPart);
//
//            /**
//             * 保留一位小数
//             */
//            NumberFormat nf=NumberFormat.getPercentInstance();
//            nf.setMinimumFractionDigits(1);
//            double res=(double) alreadyPart/totalPart;
//            String dpercent= nf.format(res);
//            dTask.setDpercent(dpercent);
//            if(alreadyPart==totalPart){
//                dTask.setDstatus("已完成");
//            }
//            int dTaskRes=dTaskMapper.updateByPrimaryKey(dTask);
//
//            dInstance.setDtstatus("已完成");
//            int dRes=dInstanceMapper.updateStatusByPk(dInstance);
//            if(dRes<0){
//                return 4012;
//            }
//        }
//
//    }
//    return 0;
//}

//@Transactional
//@DeleteMapping("/{tid}/{typeId}")
//public JSONObject deleteTask( HttpSession httpSession,
//                             @PathVariable("tid") int taskId, @PathVariable("typeId")int typeId) {
//    User user =(User)httpSession.getAttribute("currentUser");
//    int delRes=0;
//    if(typeId==1){
//         delRes = iDTaskService.deleteExtraction(taskId,user.getId());
//    }else if(typeId==2){
//         delRes = iDTaskService.deleteClassify(taskId,user.getId());
//    }else if(typeId==3){
//         delRes = iDTaskService.deleteRelation(taskId,user.getId());
//    }else if(typeId==4){
//         delRes = iDTaskService.deletePairing(taskId,user.getId());
//    }else if(typeId==5 || typeId==6){
//         delRes = iDTaskService.deleteSorting(taskId,user.getId(),typeId);
//    }
//
//    JSONObject jso =new JSONObject();
//    if(delRes<0){
//        ResponseEntity responseEntity=responseUtil.judgeResult(delRes);
//        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//        jso.put("msg",responseEntity.getMsg());
//        jso.put("code",-1);
//    }else{
//        jso.put("msg","success");
//        jso.put("code",0);
//    }
//    return jso;
//}

//public class ExcelUtil {
//public HSSFWorkbook getExcelDoc(String sheetName,String[] title,String[][] values, HSSFWorkbook wb){
//    if(wb == null){
//        wb = new HSSFWorkbook();
//    }
//    HSSFSheet excelDoc = wb.createSheet(sheetName);
//    HSSFRow excelDocRow = excelDoc.createRow(0);
//    HSSFCellStyle excelStyle = wb.createCellStyle();
//    excelStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
//    HSSFCell hssfCell = null;
//    for(int i=0;i<title.length;i++){
//        hssfCell = excelDocRow.createCell(i);
//        hssfCell.setCellValue(title[i]);
//        hssfCell.setCellStyle(excelStyle);
//    }
//
//    for(int i=0;i<values.length;i++){
//        excelDocRow = excelDoc.createRow(i + 1);
//        for(int j=0;j<values[i].length;j++){
//            excelDocRow.createCell(j).setCellValue(values[i][j]);
//        }
//    }
//    return wb;
//}
//}

//public ResponseEntity checkAddDocInstanceListitem(MultipartFile[] files, int userId) throws IllegalStateException{
//    //省略遍历校验文件代码
//    for (MultipartFile file : files) {
//        //省略document参数的传递
//        int docRes = addDocInstanceListItem(document, userId, docContent);
//        //省略返回值和返回值的校验
//    }
//}

//public int addDocInstanceListItem(Document document,int userId,String docContent){
//    String[] instanceArr = docContent.split("#");
//    document.setUserId(userId);
//    int docInsertRes = documentMapper.insert(document);//插入结果
//    if(docInsertRes <0){
//        return 2006;
//    }else{
//        int docId=document.getDid();//插入成功的文件ID
//        instanceMapper.alterInstanceTable();
//        int addContentRes =addInstanceListItem(docId,instanceArr);
//     //省略返回值校验和处理
//    }
//}
//public int addInstanceListItem(int docId,String[] instanceArr){
//    for(int i=0;i<instanceArr.length;i++){
//        String[] itemArr = instanceArr[i].split("-------");
//        //省略参数的传递
//        int instanceRes =instanceMapper.insert(instance);
//        if(instanceRes<0){
//            return 2011;
//        }else{
//            int instId=instance.getInstid();
//            listitemMapper.alterListitemTable();
//            int addItemRes =addListItem(instId,itemArr);
//        //省略返回值的校验
//        }
//    }
//}


//public int addListItem(int instId,String[] itemArr){
//    for(int i=0;i<itemArr.length;i++){
//        String[] listitemArr = itemArr[i].split("&&&&&&&");
//        for(int j=0;j<listitemArr.length;j++){
//            Listitem listitem = new Listitem();
//            listitem.setListIndex(i+1);
//            listitem.setLitemindex(j+1);
//            listitem.setLitemcontent(listitemArr[j]);
//            listitem.setInstanceId(instId);
//            int listitemRes = listitemMapper.insert(listitem);
//         //省略返回值的校验
//        }
//    }
//    return 0;
//}

//public int updateStatusByDocId(int userId,int docId,int taskId){
//    DTask dTask=dTaskMapper.selectByTaskIdAndUserId(taskId,userId);
//    if(dTask==null){
//        return 4010;
//    }else{
//        int dTaskId=dTask.getTkid();
//        int[] pids=instanceMapper.selectInstanceByDocId(docId);
//        int alreadyInstanceNum=dInstanceMapper.countDInstanceNum(docId,dTaskId);
//        int alreadyPart=dTask.getAlreadypart()+alreadyInstanceNum;
//        int totalPart=dTask.getTotalpart();
//        dTask.setAlreadypart(alreadyPart);
//        NumberFormat nf=NumberFormat.getPercentInstance();
//        nf.setMinimumFractionDigits(1);
//        double res=(double)alreadyPart/totalPart;
//        String dpercent= nf.format(res);
//        dTask.setDpercent(dpercent);
//        if(alreadyPart==totalPart){
//            dTask.setDstatus("已完成");
//        }
//        int dTaskRes=dTaskMapper.updateByPrimaryKey(dTask);
//        List<DInstance> dInstanceList=dInstanceMapper.selectByDtaskIdAndDocId(dTaskId,docId);
//        if(pids.length!=dInstanceList.size()){
//            return 4011;
//        }else {
//            for(DInstance dInstance:dInstanceList){
//                dInstance.setDtstatus("已完成");
//                int dRes=dInstanceMapper.updateStatusByPk(dInstance);
//                if(dRes<0){
//                    return 4012;
//                }
//            }
//        }
//    }
//    return 0;
//}
//
//
//@PostMapping(value = "/keyword")
//public JSONObject taskSearch(HttpSession httpSession, HttpServletRequest request, HttpServletResponse httpServletResponse,
//                             String title, String type, String pubUsername,
//                             int page, int limit) {
//    NativeSearchQueryBuilder queryBuilder = new NativeSearchQueryBuilder();
//    if(type!=null && type!=""){
//        queryBuilder.withQuery(QueryBuilders.termQuery("typeName", type).boost(3));
//    }
//    if(pubUsername!=null && pubUsername!=""){
//        queryBuilder.withQuery(QueryBuilders.termQuery("pubUserName", pubUsername));
//    }
//    if(title!=null && title!=""){
//        queryBuilder.withQuery(QueryBuilders.matchQuery("title", title));
//    }
//    Pageable pageable = new PageRequest(page-1, limit);
//    queryBuilder.withPageable(pageable);
//    Page<TaskDoc> taskList = this.taskDocRepository.search(queryBuilder.build());
//    JSONObject jso =new JSONObject();
//    if(taskList==null){
//        jso.put("msg","查询失败");
//        jso.put("code",-1);
//    }else{
//        jso.put("msg","success");
//        jso.put("code",0);
//        jso.put("data",taskList.getContent());
//        jso.put("count",taskList.getTotalElements());
//    }
//    return jso;
//}



//@Autowired
//ResponseUtil responseUtil;

//public ResponseEntity sendEmail(String userName,String userEmail,String sendAddress,
//                       List<Task> taskList,String auth,String title,String serverName) {
//    EmailEntity emailEntity= new EmailEntity();
//    emailEntity.setContent(taskList);
//    emailEntity.setUsername(userName);
//    emailEntity.setSendaddress(sendAddress);
//    emailEntity.setUserEmail(userEmail);
//    emailEntity.setTitle(title);
//    int res = emailUtil.emailHandle(serverName, sendAddress, auth,emailEntity);
//    ResponseEntity responseEntity=new ResponseEntity();
//    if(res!=0){
//        responseEntity=responseUtil.judgeResult(res);
//    }else{
//        responseEntity.setStatus(res);
//    }
//    return responseEntity;
//}


    //文本分类类型数据导出



}


