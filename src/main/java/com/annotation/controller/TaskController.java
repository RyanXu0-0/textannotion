package com.annotation.controller;

import com.alibaba.fastjson.JSONObject;
import com.annotation.model.Task;
import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.model.entity.TaskInfoEntity;
import com.annotation.service.IDocumentService;
import com.annotation.service.IPointUnitService;
import com.annotation.service.ITaskService;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by twinkleStar on 2018/12/9.
 * 处理提交的任务
 */

@RestController
@RequestMapping("/task")
public class TaskController {

    @Autowired
    IDocumentService IDocumentService;
    @Autowired
    ITaskService iTaskService;
    @Autowired
    ResponseUtil responseUtil;
    @Autowired
    IPointUnitService iPointUnitService;


    /**
     * 信息抽取的创建
     * @param multipartFiles
     * @param request
     * @param httpSession
     * @param task
     * @param label
     * @param color
     * @param userId
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @PostMapping(value = "/paralabel")
    @Transactional
    public ResponseEntity pubParaLabelTask(
            @RequestParam( value="files[]",required=false)MultipartFile[] multipartFiles,
            @RequestParam(value="testfiles[]",required=false)MultipartFile[] testFiles,
            HttpServletRequest request, HttpSession httpSession,
            Task task, String[] label,String[] relalabel, String[] color,@RequestParam(defaultValue="0")int userId,@RequestParam(defaultValue="0")int pointUnit)throws IllegalStateException, IOException {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<Integer> docids = new ArrayList<Integer>();
        List<Integer> testfileids = new ArrayList<Integer>();
        //文件上传结果，把解析的任务存储到数据库
        ResponseEntity docResponseEntity = IDocumentService.checkAddDocParagraph(multipartFiles,userId);
        if(docResponseEntity.getStatus()!=0){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return docResponseEntity;
        }else{
            //获取到上传文件的ID
            HashMap<String,List<Integer>> hashmap = (HashMap)docResponseEntity.getData();
            docids = hashmap.get("docIds");
        }


        //首先设置iftest为no，当用户处理完自己的检测任务后，设置字段为yes
        task.setIftest("no");

        task.setUserId(userId);
        ResponseEntity taskRes =iTaskService.addTaskOfExtration(task,docids,label,relalabel,color);//创建任务的结果

        int taskid = (Integer)taskRes.getData();
        iPointUnitService.insert(pointUnit,taskid);

        //处理测试集,最后处理，有标签需要插入
        //首先插入文件，然后插入任务和标签
        if(testFiles.length > 0){
            ResponseEntity testResponseEntity = IDocumentService.checkAddDocParagraph(multipartFiles,userId);
            HashMap<String,List<Integer>> hashmap = (HashMap)testResponseEntity.getData();
            testfileids = hashmap.get("docIds");
            ResponseEntity testtaskRes =iTaskService.addTestOfExtration(task,testfileids,label,relalabel,color);//创建任务的结果
        }
        return responseUtil.judgeTaskController(taskRes,docids);
    }



    /**
     * 分类任务的创建
     * @param multipartFiles
     * @param request
     * @param httpSession
     * @param task
     * @param label
     * @param color
     * @param userId
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @PostMapping(value = "/classify")
    @Transactional
    public ResponseEntity pubClassifyTask(
            @RequestParam( value="files[]",required=false)MultipartFile[] multipartFiles,
            @RequestParam(value="testfiles[]",required=false)MultipartFile[] testFiles,
            HttpServletRequest request, HttpSession httpSession,
            Task task, String[] label, String[] color,@RequestParam(defaultValue="0")int userId,@RequestParam(defaultValue="0")int pointUnit)throws IllegalStateException, IOException {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }


        List<Integer> docids = new ArrayList<Integer>();

        //文件上传结果
        ResponseEntity docResponseEntity = IDocumentService.checkAddDocParagraph(multipartFiles,userId);

        if(docResponseEntity.getStatus()!=0){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return docResponseEntity;
        }else{
            //获取到上传文件的ID
            HashMap<String,List<Integer>> hashmap = (HashMap)docResponseEntity.getData();
            docids = hashmap.get("docIds");
        }


        task.setUserId(userId);

        task.setIftest("no");

        System.out.println(task.getIftest()+testFiles.length);
        ResponseEntity taskRes =iTaskService.addTaskOfDocPara(task,docids,label,color);//创建任务的结果

        int taskid = (Integer)taskRes.getData();
        iPointUnitService.insert(pointUnit,taskid);

        //处理测试集,最后处理，有标签需要插入
        //首先插入文件，然后插入任务和标签
        if(testFiles.length > 0){
            ResponseEntity testResponseEntity = IDocumentService.checkAddDocParagraph(multipartFiles,userId);
            HashMap<String,List<Integer>> hashmap = (HashMap)testResponseEntity.getData();
            List<Integer> testfileids = hashmap.get("docIds");
            ResponseEntity testtaskRes =iTaskService.addTestOfDocPara(task,testfileids,label,color);//创建任务的结果
        }

        return responseUtil.judgeTaskController(taskRes,docids);

    }

//文本关系
    @PostMapping(value = "/relation")
    @Transactional
    public ResponseEntity pubRelationTask(
            @RequestParam( value="files[]",required=false)MultipartFile[] multipartFiles,
            @RequestParam(value="testfiles[]",required=false)MultipartFile[] testFiles,
            HttpServletRequest request,HttpSession httpSession,
            Task task, String[] instLabel, String[] item1Label, String[] item2Label,
            int labelnum, int labelnum1, int labelnum2,@RequestParam(defaultValue="0")int userId,@RequestParam(defaultValue="0")int pointUnit)throws IllegalStateException, IOException {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<Integer> docids = new ArrayList<Integer>();

        //获取上传的文件数组
        ResponseEntity fileResponseEntity = IDocumentService.checkAddDocInstanceItem(multipartFiles,userId,labelnum,labelnum1,labelnum2);

        if(fileResponseEntity.getStatus()!=0){
            //插入数据库有错误时整体回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return fileResponseEntity;
        }else{
            //获取到上传文件的ID
            HashMap<String,List<Integer>> hashmap = (HashMap)fileResponseEntity.getData();
            //List<Integer> list = hashmap.get("docIds");
            docids = hashmap.get("docIds");
        }

        task.setIftest("no");

        task.setUserId(userId);
        ResponseEntity taskRes =iTaskService.addTaskOfRelation(task,docids,instLabel,item1Label,item2Label);//创建任务的结果
        int taskid = (Integer)taskRes.getData();
        iPointUnitService.insert(pointUnit,taskid);



        if(testFiles.length > 0){
            ResponseEntity testResponseEntity = IDocumentService.checkAddDocInstanceItem(multipartFiles,userId,labelnum,labelnum1,labelnum2);
            HashMap<String,List<Integer>> hashmap = (HashMap)testResponseEntity.getData();
            List<Integer> testfileids = hashmap.get("docIds");
            ResponseEntity testtaskRes =iTaskService.addTestOfRelation(task,testfileids,instLabel,item1Label,item2Label);//创建任务的结果
        }
        return responseUtil.judgeTaskController(taskRes,docids);
    }


    @PostMapping(value = "/pairing")
    @Transactional
    public ResponseEntity pubPairingTask(
            @RequestParam( value="files[]",required=false)MultipartFile[] multipartFiles,
            @RequestParam(value="testfiles[]",required=false)MultipartFile[] testFiles,
            HttpServletRequest request,HttpSession httpSession, Task task,@RequestParam(defaultValue="0")int userId)throws IllegalStateException, IOException {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        List<Integer> docids = new ArrayList<Integer>();

        //获取上传的文件数组
        ResponseEntity docRes = IDocumentService.checkAddDocInstanceListitem(multipartFiles,userId);

        if(docRes.getStatus() != 0){
            //插入数据库有错误时整体回滚
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return docRes;
        }else{
            //获取到上传文件的ID
            HashMap<String,List<Integer>> hashmap = (HashMap)docRes.getData();
            docids = hashmap.get("docIds");
        }


        task.setIftest("no");

        task.setUserId(userId);
        ResponseEntity taskRes =iTaskService.addTaskOfPairingAndSorting(task,docids);//创建任务的结果
        int taskid = (Integer)taskRes.getData();

        System.out.println("taskid:"+taskid);
        if(testFiles.length > 0){
            ResponseEntity testResponseEntity = IDocumentService.checkAddDocInstanceListitem(multipartFiles,userId);
            HashMap<String,List<Integer>> hashmap = (HashMap)testResponseEntity.getData();
            List<Integer> testfileids = hashmap.get("docIds");
            ResponseEntity testtaskRes =iTaskService.addTestOfPairingAndSorting(task,testfileids);//创建任务的结果
        }
        return responseUtil.judgeTaskController(taskRes,docids);

    }

    /**
     * 文本排序
     * @param httpSession
     * @param request
     * @param multipartFiles
     * @param task
     * @param userId
     * @return
     */
    @Transactional
    @RequestMapping(value = "/sorting", method = RequestMethod.POST)
    public ResponseEntity pubSortingTask(
            @RequestParam( value="files[]",required=false)MultipartFile[] multipartFiles,
            @RequestParam(value="testfiles[]",required=false)MultipartFile[] testFiles,
            HttpServletRequest request, HttpSession httpSession, Task task,int typeId,@RequestParam(defaultValue="0")int userId,@RequestParam(defaultValue="0")int pointUnit)throws IllegalStateException, IOException {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        List<Integer> docids = new ArrayList<Integer>();


        //获取上传的文件数组
        ResponseEntity fileResponseEntity = IDocumentService.checkAddSortingDoc(multipartFiles,userId,typeId);
        if (fileResponseEntity.getStatus()!=0) {
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            return fileResponseEntity;
        } else {
            //获取到上传文件的ID
            HashMap<String, List<Integer>> hashmap = (HashMap) fileResponseEntity.getData();
            docids = hashmap.get("docIds");
        }


        task.setIftest("no");

        task.setUserId(userId);
        ResponseEntity taskRes = iTaskService.addTaskOfPairingAndSorting(task,docids);//创建任务的结果

        int taskid = (Integer)taskRes.getData();
        iPointUnitService.insert(pointUnit,taskid);


        if(testFiles.length > 0 && typeId == 5){
            ResponseEntity testResponseEntity = IDocumentService.checkAddSortingDoc(multipartFiles,userId,typeId);
            HashMap<String,List<Integer>> hashmap = (HashMap)testResponseEntity.getData();
            List<Integer> testfileids = hashmap.get("docIds");
            ResponseEntity testtaskRes =iTaskService.addTestOfPairingAndSorting(task,testfileids);//创建任务的结果
        }else{

            ResponseEntity testResponseEntity = IDocumentService.checkAddSortingDoc(multipartFiles,userId,typeId);
            HashMap<String,List<Integer>> hashmap = (HashMap)testResponseEntity.getData();
            List<Integer> testfileids = hashmap.get("docIds");
            ResponseEntity testtaskRes =iTaskService.addTestOfPairingAndSorting(task,testfileids);//创建任务的结果

        }
        return responseUtil.judgeTaskController(taskRes,docids);
    }



    /**
     * 分页查询所有可以做的的任务
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param page
     * @param limit
     * @return
     */
    @GetMapping(value = "/all")
    public JSONObject getTotalTaskOfUndo(HttpServletRequest request,
                                         HttpServletResponse httpServletResponse,
                                         HttpSession httpSession,int page,int limit) {

        User user =(User)httpSession.getAttribute("currentUser");
        List<Task> taskList = iTaskService.queryTotalTaskOfUndo(user,page,limit);
        int count=iTaskService.countNumOfUndo(user.getId());
//        System.out.println(count);
        JSONObject jso =new JSONObject();
        if(taskList==null){
            jso.put("msg","查询失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","success");
            jso.put("code",0);
            jso.put("data",taskList);
            jso.put("count",count);
        }

        return jso;
    }


    /**
     * 分页查询我发布的任务
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param page
     * @param limit
     * @param userId
     * @return
     */
    @GetMapping(value = "/my/pub")
    public JSONObject getTasklist(HttpServletRequest request,HttpServletResponse httpServletResponse, HttpSession httpSession, int page, int limit,@RequestParam(defaultValue="0")int userId) {
        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }
        List<Task> taskList = iTaskService.queryMyPubTask(userId,page,limit);
        int count=iTaskService.countNumOfMyPubTask(userId);
        JSONObject rs =new JSONObject();
        if(taskList==null){
            rs.put("msg","查询失败");
            rs.put("code",-1);
            rs.put("count",0);
        }else{
            rs.put("msg","success");
            rs.put("code",0);
            rs.put("data",taskList);
            rs.put("count",count);
        }

        return rs;
    }

    /**
     * 根据任务ID获取任务详情
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param tid
     * @param typeId
     * @return
     */
    @GetMapping(value = "/detail")
    public JSONObject getTaskDetailInfo(HttpServletRequest request,HttpServletResponse httpServletResponse, HttpSession httpSession,
                                  int tid,int typeId) {
        TaskInfoEntity taskInfoEntity = iTaskService.queryTaskInfo(tid,typeId);
        //String username=iTaskService.queryUserName(tid);
        JSONObject jso =new JSONObject();
        if(taskInfoEntity==null){
            jso.put("msg","查询失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","success");
            jso.put("code",0);
            jso.put("data",taskInfoEntity);
            //jso.put("pubUserName",username);
        }

        return jso;
    }





    /**
     * 根据任务ID获取任务详情
     * @param request
     * @param httpServletResponse
     * @param httpSession
     * @param taskId
     * @param typeId
     * @return
     */
    @Transactional
    @DeleteMapping("/{tid}/{typeId}")
    public JSONObject deleteTask(HttpServletRequest request,HttpServletResponse httpServletResponse, HttpSession httpSession,
                                 @PathVariable("tid") int taskId,@PathVariable("typeId")int typeId) {
        int res = iTaskService.deleteTaskInfo(taskId,typeId);
        JSONObject jso =new JSONObject();
        if(res<0){
            TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
            jso.put("msg","删除失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","success");
            jso.put("code",0);
        }
        return jso;
    }


    /**
     * 根据任务类型查询任务
     * @param tasktype
     * @return
     */
    @GetMapping(value = "/tasktype")
    public JSONObject selectTaskByType(String tasktype) {
       // System.out.println(tasktype);
        List<Task> taskList = iTaskService.selectTaskByType(tasktype);
        JSONObject jso =new JSONObject();
        if(taskList==null){
            jso.put("msg","查询失败");
            jso.put("code",-1);
        }else{
            jso.put("msg","查询成功");
            jso.put("code",0);
            jso.put("data",taskList);
        }

        return jso;
    }


    /**
     * todo
     * 提交当前task错误
     * @param httpSession
     * @param paraId
     * @param docId
     * @param taskId
     * @param userId
     * @return
     */

    @GetMapping(value = "/commitError")
    public JSONObject commitError (HttpSession httpSession,  Integer docId, int paraId,String msg,int taskId,@RequestParam(defaultValue="0")int userId) {

        if(userId==0){
            User user =(User)httpSession.getAttribute("currentUser");
            userId = user.getId();
        }

        JSONObject rs = new JSONObject();
        rs.put("code","0");
        rs.put("msg","thanks");
        return rs;

    }





}
