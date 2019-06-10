package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDocumentService;
import com.annotation.util.FileUtil;
import com.annotation.util.ResponseUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.*;


/**
 * Created by twinkleStar on 2018/12/8.
 */

@Repository
public class DocumentServiceImpl implements IDocumentService {

    @Autowired
    DocumentMapper documentMapper;
    @Autowired
    ParagraphMapper paragraphMapper;
    @Autowired
    InstanceMapper instanceMapper;
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    ListitemMapper listitemMapper;
    @Autowired
    FileUtil fileUtil;
    @Autowired
    ResponseUtil responseUtil;

    /**
     * 检查并插入，形如doc->para
     * @param files 多文件类别
     * @param userId 用户Id
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    public ResponseEntity checkAddDocParagraph(MultipartFile[] files, int userId) throws IllegalStateException{

        ResponseEntity responseEntity = new ResponseEntity();
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(files);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        /**
         * 遍历文件列表进行检查
         */
        for (MultipartFile file : files) {
            try {
                responseEntity = fileUtil.checkFilecontent(file);
                if(responseEntity.getStatus() != 0){
                    return responseEntity;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        /**
         * 检查全部符合要求
         * doc-->para
         */
        List<Integer> docIds = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
                String docContent=fileUtil.parseDocContent(file);
                String docType=fileUtil.parseDocType(filename);

                Document document = new Document();
                document.setFilename(filename);
                document.setFiletype(docType);
                document.setFilesize((int)file.getSize());
                document.setUserId(userId);

                //todo:建文件服务器后设置路径
                document.setAbsolutepath("");
                document.setRelativepath("");

                //防止自增的ID不连续
                documentMapper.alterDocumentTable();
                int docRes=  addDocumentParagraph(document,docContent);

                if(docRes==2006 || docRes==2007){
                    responseEntity=responseUtil.judgeResult(docRes);
                    responseEntity.setMsg(filename+responseEntity.getMsg());
                    //插入数据库有错误时整体回滚
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return responseEntity;
                }else{
                    docIds.add(docRes);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        responseEntity.setStatus(0);
        responseEntity.setMsg("文件上传成功");
        Map<String, Object> data = new HashMap<>();
        data.put("docIds", docIds);//返回文件id，方便后续添加任务
        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 插入document
     * 调用addParagraph插入para
     * do:信息抽取和分类
     * @param document 文件相关信息
     * @param docContent 文件内容
     * @return
     */
    @Transactional
    public int addDocumentParagraph(Document document, String docContent){

        //段落数组
        String[] contentArr = docContent.split("#");

        int docInsertRes = documentMapper.insert(document);//插入结果
        //插入document失败
        if(docInsertRes < 0){
            return 2006;
        }else{
            int docId=document.getDid();//插入成功的文件ID
            paragraphMapper.alterParagraphTable();
            int addParagraphRes =addParagraph(docId,contentArr);
            //paragraph插入失败
            if(addParagraphRes!=0){
                return 2007;
            }else{
                return docId;
            }
        }

    }

    /**
     * 插入paragraph
     * do:信息抽取和分类
     * @param docId
     * @param contentArr
     * @return
     */
    @Transactional
    public int addParagraph(int docId,String[] contentArr){
        for(int i=0;i<contentArr.length;i++){
            Paragraph paragraph =new Paragraph();
            paragraph.setParacontent(contentArr[i]);
            paragraph.setParaindex(i+1);
            paragraph.setDocumentId(docId);
            int contentRes =paragraphMapper.insert(paragraph);
            if(contentRes < 0){
                return -1;
            }
        }
        return 0;
    }


    /**
     * 文本关系
     * @param files
     * @param userId
     * @param num0
     * @param num1
     * @param num2
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    public ResponseEntity checkAddDocInstanceItem(MultipartFile[] files, int userId, int num0, int num1, int num2) throws IllegalStateException{

        ResponseEntity responseEntity = new ResponseEntity();
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(files);
        if(responseEntity.getStatus()!=0){
            return responseEntity;
        }

        //然后检查文件内容是否符合要求
        for (MultipartFile file : files) {
            try {
                responseEntity = fileUtil.checkInstanceItem(file);
                if(responseEntity.getStatus()!=0){
                    return responseEntity;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //最后插入document和content
        List<Integer> docids = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
                String docContent=fileUtil.parseDocContent(file);
                String docType=fileUtil.parseDocType(filename);

                Document document = new Document();
                document.setFilename(filename);
                document.setFiletype(docType);
                document.setFilesize((int)file.getSize());

                //todo:建文件服务器后设置路径
                document.setAbsolutepath("");
                document.setRelativepath("");

                //设置时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                document.setDocuploadtime(df.format(new Date()));

                //添加文件
                //防止自增的ID不连续
                documentMapper.alterDocumentTable();
                int docRes = addDocumentInstanceItem(document,userId,docContent,num0,num1,num2);

                if(docRes==2006 || docRes==2011 || docRes==2012){
                    responseEntity=responseUtil.judgeResult(docRes);
                    responseEntity.setMsg(filename+responseEntity.getMsg());
                    //插入数据库有错误时整体回滚
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return responseEntity;
                }else {
                    docids.add(docRes);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        responseEntity.setStatus(0);
        responseEntity.setMsg("文件上传成功");
        Map<String, Object> data = new HashMap<>();
        data.put("docIds", docids);//返回文件id，方便后续添加任务
        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 插入document
     * 调用 插入-->instanceItem
     * @param document
     * @param userId
     * @param docContent
     * @param num0
     * @param num1
     * @param num2
     * @return
     */
    public int addDocumentInstanceItem(Document document,int userId,String docContent,int num0,int num1,int num2){

        String[] instanceArr = docContent.split("#");

        //开始插入文件相关信息
        document.setUserId(userId);
        int docInsertRes = documentMapper.insert(document);//插入结果

        //插入文件失败
        if(docInsertRes<0){
            return 2006;
        }else{
            //插入文件成功
            int docId=document.getDid();//插入成功的文件ID
            //防止自增的ID不连续
            instanceMapper.alterInstanceTable();
            //文件内容，用#分隔了
            int addContentRes =addInstanceItem(docId,instanceArr,num0,num1,num2);
            //instance插入失败
            if(addContentRes!=0){
                return addContentRes;
            }else{
                return docId;
            }
        }
    }

    /**
     * 插入instance
     * 调用 插入item
     * @param docId
     * @param instanceArr
     * @param labelnum
     * @param labelitem1
     * @param labelitem2
     * @return
     */
    public int addInstanceItem(int docId,String[] instanceArr,int labelnum,int labelitem1,int labelitem2){

        for(int i=0;i<instanceArr.length;i++){
            String[] itemArr = instanceArr[i].split("-------");
            Instance instance =new Instance();
            instance.setInstindex(i+1);
            instance.setDocumentId(docId);
            instance.setLabelnum(labelnum);
            int instanceRes =instanceMapper.insert(instance);
            //Instance插入失败
            if(instanceRes<0){
                return 2011;
            }else{
                //Instance插入成功
                int instId=instance.getInstid();//插入成功的文件ID
                //文件内容，用#分隔了
                itemMapper.alterItemTable();
                int addItemRes =addItem(instId,itemArr,labelitem1,labelitem2);
                //文件内容插入失败
                if(addItemRes!= 0){
                    return 2012;
                }
            }
        }
        return 0;
    }


    /**
     * 插入item
     * @param instId
     * @param itemArr
     * @param labelitem1
     * @param labelitem2
     * @return
     */
    public int addItem(int instId,String[] itemArr,int labelitem1,int labelitem2){

        for(int i=0;i<itemArr.length;i++){
            Item item = new Item();
            item.setItemcontent(itemArr[i]);
            item.setItemindex(i+1);
            item.setInstanceId(instId);
            if(i==0) {
                item.setLabelnum(labelitem1);
            }else {
                item.setLabelnum(labelitem2);
            }
            int itemRes = itemMapper.insert(item);
            //文件内容插入失败
            if(itemRes <0){
                return -1;
            }
        }
        return 0;
    }

    /**
     * 文本配对
     * @param files
     * @param userId
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    public ResponseEntity checkAddDocInstanceListitem(MultipartFile[] files,int userId) throws IllegalStateException{

        ResponseEntity responseEntity = new ResponseEntity();
        //遍历处理文件
        responseEntity = fileUtil.checkFilesLength(files);
        if(responseEntity.getStatus()!=0){
            return responseEntity;
        }

        //然后检查文件内容是否符合要求
        for (MultipartFile file : files) {
            try {
                responseEntity = fileUtil.checkInstanceListItem(file);
                if(responseEntity.getStatus()!=0){
                    return responseEntity;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //最后插入document和content
        List<Integer> docids = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
                String docContent=fileUtil.parseDocContent(file);
                String docType=fileUtil.parseDocType(filename);

                Document document = new Document();
                document.setFilename(filename);
                document.setFiletype(docType);
                document.setFilesize((int)file.getSize());

                //todo:建文件服务器后设置路径
                document.setAbsolutepath("");
                document.setRelativepath("");

                //设置时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                document.setDocuploadtime(df.format(new Date()));

                //添加文件
                //防止自增的ID不连续
                documentMapper.alterDocumentTable();
                int docRes = addDocInstanceListItem(document,userId,docContent);
                if(docRes==2006 || docRes==2011 || docRes==2016){
                    responseEntity=responseUtil.judgeResult(docRes);
                    responseEntity.setMsg(filename+responseEntity.getMsg());
                    //插入数据库有错误时整体回滚
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return responseEntity;
                }else {
                    docids.add(docRes);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        responseEntity.setStatus(0);
        responseEntity.setMsg("文件上传成功");
        Map<String, Object> data = new HashMap<>();
        data.put("docIds", docids);//返回文件id，方便后续添加任务
        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 文本匹配
     * @param document 文件相关信息
     * @param userId
     * @param docContent 文件内容
     * @return
     */
    public int addDocInstanceListItem(Document document,int userId,String docContent){
        String[] instanceArr = docContent.split("#");
        document.setUserId(userId);
        int docInsertRes = documentMapper.insert(document);//插入结果

        //插入失败
        if(docInsertRes <0){
            return 2006;
        }else{
            int docId=document.getDid();//插入成功的文件ID
            //防止自增ID的不连续
            instanceMapper.alterInstanceTable();
            //调用插入instance
            int addContentRes =addInstanceListItem(docId,instanceArr);
            if(addContentRes !=0){
                return addContentRes;
            }else{
                return docId;
            }
        }
    }

    /**
     * 文本匹配插入instance内容
     * @param docId
     * @param instanceArr
     * @return
     */
    public int addInstanceListItem(int docId,String[] instanceArr){

        for(int i=0;i<instanceArr.length;i++){

            String[] itemArr = instanceArr[i].split("-------");
            Instance instance =new Instance();
            instance.setInstindex(i+1);
            instance.setDocumentId(docId);
            int instanceRes =instanceMapper.insert(instance);
            //Instance插入失败则返回3
            if(instanceRes<0){
                return 2011;
            }else{
                //Instance插入成功
                int instId=instance.getInstid();//插入成功的文件ID
                //文件内容，用#分隔了
                listitemMapper.alterListitemTable();
                int addItemRes =addListItem(instId,itemArr);
                //文件内容插入失败
                if(addItemRes !=0){
                    return addItemRes;
                }
            }
        }
        return 0;
    }

    /**
     * 文本匹配插入listitem内容
     * @param instId
     * @param itemArr
     * @return
     */
    public int addListItem(int instId,String[] itemArr){

        for(int i=0;i<itemArr.length;i++){

            String[] listitemArr = itemArr[i].split("&&&&&&&");
            for(int j=0;j<listitemArr.length;j++){
                Listitem listitem = new Listitem();
                listitem.setListIndex(i+1);
                listitem.setLitemindex(j+1);
                listitem.setLitemcontent(listitemArr[j]);
                listitem.setInstanceId(instId);
                int listitemRes = listitemMapper.insert(listitem);
                //文件内容插入失败则返回3
                if(listitemRes<0){
                    return 2016;
                }
            }
        }
        return 0;
    }


    /**
     * 文本排序
     * @param files
     * @param userId
     * @param typeId
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    public ResponseEntity checkAddSortingDoc(MultipartFile[] files,int userId,int typeId) throws IllegalStateException{


        ResponseEntity responseEntity = new ResponseEntity();
        //遍历处理文件
        responseEntity = fileUtil.checkFilesLength(files);
        if(responseEntity.getStatus()!=0){
            return responseEntity;
        }

        //然后检查文件内容是否符合要求
        for (MultipartFile file : files) {
            try {
                responseEntity = fileUtil.checkSortingInstanceItem(file,typeId);
                if(responseEntity.getStatus()!=0){
                    return responseEntity;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //最后插入document和content
        List<Integer> docIds = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
                String docContent=fileUtil.parseDocContent(file);
                String docType=fileUtil.parseDocType(filename);

                Document document = new Document();
                document.setFilename(filename);
                document.setFiletype(docType);
                document.setFilesize((int)file.getSize());

                //todo:建文件服务器后设置路径
                document.setAbsolutepath("");
                document.setRelativepath("");

                //设置时间
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
                document.setDocuploadtime(df.format(new Date()));

                //添加文件
                //防止自增的ID不连续
                documentMapper.alterDocumentTable();
                document.setUserId(userId);
                int docRes = addDocOfSorting(document,docContent,typeId);

                if(docRes==2006 || docRes==2011 || docRes==2012){
                    responseEntity=responseUtil.judgeResult(docRes);
                    responseEntity.setMsg(filename+responseEntity.getMsg());
                    //插入数据库有错误时整体回滚
                    TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
                    return responseEntity;
                }else {
                    docIds.add(docRes);
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        responseEntity.setStatus(0);
        responseEntity.setMsg("文件上传成功");
        Map<String, Object> data = new HashMap<>();
        data.put("docIds", docIds);//返回文件id，方便后续添加任务
        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 文本排序
     * @param document
     * @param docContent
     * @param typeId
     * @return
     */
    public int addDocOfSorting(Document document,String docContent,int typeId){

        String[] instanceArr = docContent.split("#");

        //开始插入文件相关信息
        int docInsertRes = documentMapper.insert(document);//插入结果
        //插入文件失败
        if(docInsertRes <0){
            return 2006;
        }else{
            //插入文件成功
            int docId=document.getDid();//插入成功的文件ID
            //防止自增的ID不连续
            instanceMapper.alterInstanceTable();
            //文件内容，用#分隔了
            int addContentRes =addInstanceOfSorting(docId,instanceArr,typeId);
            //instance插入失败
            if(addContentRes!=0){
                return addContentRes;
            }else{
                return docId;
            }
        }
    }

    /**
     * 文本排序
     * @param docId
     * @param instanceArr
     * @param typeId
     * @return
     */
    public int addInstanceOfSorting(int docId,String[] instanceArr,int typeId){
        for(int i=0;i<instanceArr.length;i++){
            String[] itemArr = instanceArr[i].split("-------");
            Instance instance =new Instance();
            instance.setInstindex(i+1);
            instance.setDocumentId(docId);
            int instanceRes =instanceMapper.insert(instance);
            //Instance插入失败则返回3
            if(instanceRes<0){
                return 2011;
            }else{
                //Instance插入成功
                itemMapper.alterItemTable();
                int instId=instance.getInstid();//插入成功的文件ID
                //文件内容，用#分隔了
                int addItemRes =addItemOfSorting(instId,itemArr,typeId);
                //文件内容插入失败
                if(addItemRes!=0){
                    return addItemRes;
                }
            }
        }
        return 0;
    }

    /**
     * 文本排序
     * @param instId
     * @param itemArr
     * @param typeId
     * @return
     */
    public int addItemOfSorting(int instId,String[] itemArr,int typeId){
        for(int i=0;i<itemArr.length;i++){
            Item item = new Item();
            item.setItemcontent(itemArr[i]);
            if(typeId==5){
                item.setItemindex(i+1);
            }else if(typeId==6){
                item.setItemindex(i);
            }
            item.setInstanceId(instId);
            int itemRes = itemMapper.insert(item);
            if(itemRes<0){
                return 2012;
            }
        }
        return 0;
    }




    /**
     * 分页查询
     * @param userid
     * @param page 页数
     * @param limit 每页数量
     * @return
     */
//    public List<Document> queryDocByRelatedInfo(int userid, int page, int limit){
//        int startNum =(page-1)*limit;
//        Map<String,Object> data =new HashMap();
//        data.put("currIndex",startNum);
//        data.put("pageSize",limit);
//        data.put("userid",userid);
//        List<Document> task =documentMapper.selectDocumentByRelatedInfo(data);
//        return task;
//    }

    /**
     * 计算用户文件总数
     * @param userId
     * @return
     */
//    public int countNumByUserId(int userId){
//        Integer numInt = documentMapper.countDocNumByUserId(userId);
//        if(numInt == null){
//            return 0;
//        } else{
//            return numInt.intValue();
//        }
//    }






//    @Transactional
//    public ResponseEntity addMultiFileOneSorting(MultipartFile[] files,User user,String taskType) throws IllegalStateException{
//
//        //boolean filetype = true;
//       ResponseEntity responseEntity = new ResponseEntity();
////        //遍历处理文件
////        responseEntity = fileUtil.checkfile(files);
////        if(responseEntity.getStatus()<0){
////            return responseEntity;
////        }
////
////        //然后检查文件内容是否符合要求
////        for (MultipartFile file : files) {
////            try {
////                String filename = file.getOriginalFilename();//文件名称
////                int content = fileUtil.checktwoitem(file);
////                if(content==-2){
////                    responseEntity.setStatus(-3);
////                    responseEntity.setMsg(filename +"单个文件大小超过限制");
////                    return responseEntity;
////                }else if(content==-3){
////                    responseEntity.setStatus(-4);
////                    responseEntity.setMsg(filename +"每个instance中的item的个数不正确");
////                    return responseEntity;
////                }else if(content==-4){
////                    responseEntity.setStatus(-5);
////                    responseEntity.setMsg(filename+"文件中有的item为空");
////                    return responseEntity;
////                } else if(content==-5){
////                    responseEntity.setStatus(-5);
////                    responseEntity.setMsg(filename+"文件中有的item超过字数限制,文件分段内容长度太长，请重新用#分段");
////                    return responseEntity;
////                }
////            } catch (Exception e) {
////                e.printStackTrace();
////            }
////        }
//
//        //最后插入document和content
//        List<Integer> docIds = new ArrayList<Integer>();
//        for (MultipartFile file : files) {
//            try {
//                String filename =file.getOriginalFilename();//文件名称
//                String docContent=FileUtil.parsefilecontent(file);
//                String docType="";//文件类型
//
//                if (filename.endsWith(".doc")) {
//                    docType=".doc";
//                } else if (filename.endsWith("docx")) {
//                    docType=".docx";
//                } else if(filename.endsWith(".txt")){
//                    docType=".txt";
//                }
//
//                Document document = new Document();
//                document.setFilename(filename);
//                document.setFiletype(docType);
//                document.setFilesize((int)file.getSize());
//
//                //todo:建文件服务器后设置路径
//                document.setAbsolutepath("");
//                document.setRelativepath("");
//
//                //设置时间
//                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//                document.setDocuploadtime(df.format(new Date()));
//                document.setDoccomptime("");
//                document.setDocstatus("未完成");
//
//                //添加文件
//                //防止自增的ID不连续
//                alterDocumentTable();
//                int docRes = addTwoInstances(document,user,docContent,taskType);
//
//                switch (docRes){
//                    case -1:
//                        responseEntity.setStatus(-6);
//                        responseEntity.setMsg(filename+"添加文件失败，请检查");
//                        //插入数据库有错误时整体回滚
//                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//                        break;
//                    case -2:
//                        responseEntity.setStatus(-7);
//                        responseEntity.setMsg(filename+"instance插入失败");
//                        //插入数据库有错误时整体回滚
//                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//                        break;
//                    case -3:
//                        responseEntity.setStatus(-8);
//                        responseEntity.setMsg(filename+"item插入失败");
//                        //插入数据库有错误时整体回滚
//                        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//                        break;
//                    default:
//                        responseEntity.setStatus(0);
//                        responseEntity.setMsg("文件上传成功");
//                        Map<String, Object> data = new HashMap<>();
//                        docIds.add(docRes);
//                        data.put("docIds", docIds);//返回文件id，方便后续添加任务
//                        responseEntity.setData(data);
//                }
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return responseEntity;
//    }
//
//
//    public int addTwoInstances(Document document,User user,String docContent,String taskType){
//
//        //读取的文件内容由#分隔
//        //检查每段内容大小
//        String[] instanceArr = docContent.split("#");
//
//        //开始插入文件相关信息
//        document.setUserId(user.getId());
//        int docInsertRes = documentMapper.insertDocument(document);//插入结果
//
//        //插入文件失败
//        if(docInsertRes == -1){
//            return docInsertRes;
//        }else{
//            //插入文件成功
//            int docId=document.getDid();//插入成功的文件ID
//            //防止自增的ID不连续
//            instanceMapper.alterInstanceTable();
//            //文件内容，用#分隔了
//            int addContentRes =addTwoItems(docId,instanceArr,taskType);
//            //instance插入失败
//            if(addContentRes == -2){
//                //todo:有内容插入失败的情况，要删除已经插入的文件以及文件内容
//                return -2;
//            }else{
//                return docId;
//            }
//        }
//    }



//    public int addTwoItems(int docId,String[] instanceArr,String taskType){
//
//        for(int i=0;i<instanceArr.length;i++){
//
//            String[] itemArr = instanceArr[i].split("-------");
//            Instance instance =new Instance();
//
//
//            instance.setInsindex(String.valueOf(i+1));
//            instance.setInsstatus("未完成");
//            instance.setDocumentid(docId);
//            instance.setLabelnum(0);
//            int instanceRes =instanceMapper.insert(instance);
//            //Instance插入失败则返回3
//            if(instanceRes == -1){
//                return -2;
//            }else{
//                //Instance插入成功
//                int instId=instance.getInsid();//插入成功的文件ID
//                //文件内容，用#分隔了
//                itemMapper.alterItemTable();
//                int addItemRes =addItems(instId,itemArr,taskType);
//                //文件内容插入失败
//                if(addItemRes == -3){
//                    //todo:有内容插入失败的情况，要删除已经插入的文件以及文件内容
//                    return -3;
//                }
//            }
//        }
//        return 0;
//    }




//    public int addItems(int instId,String[] itemArr,String taskType){
//
//        for(int i=0;i<itemArr.length;i++){
//            Item item = new Item();
//            item.setItemcontent(itemArr[i]);
//            if(taskType.equals("文本排序")){
//                item.setItemindex(String.valueOf(i+1));
//            }else if(taskType.equals("文本类比排序")){
//                item.setItemindex(String.valueOf(i));
//            }
//            item.setInstanceid(instId);
//            item.setLabelnum(0);
//            int itemRes = itemMapper.insert(item);
//            //文件内容插入失败则返回3
//            if(itemRes == -1){
//                return -3;
//            }
//        }
//        return 0;
//    }


//    public  String readContent(String path) throws IOException {
//
//        InputStream is = new FileInputStream(path);
//        InputStreamReader inputFileReader =new InputStreamReader(is,"Unicode");
//        BufferedReader in = new BufferedReader(inputFileReader);
//        StringBuffer buffer = new StringBuffer();
//        String line = "";
//        while ((line = in.readLine()) != null){
//            buffer.append(line);
//        }
//        return buffer.toString();
//
//    }

//    public String getDocumentContent(String filename) throws IOException{
//        String docContent = "";
//        try {
//            if (filename.endsWith(".doc")) {
//
//                InputStream is = new FileInputStream(new java.io.File(filename));
//                WordExtractor ex = new WordExtractor(is);
//                docContent = ex.getText();
//            } else if (filename.endsWith("docx")) {
//                FileInputStream fis = new FileInputStream(filename);
//                XWPFDocument xdoc = new XWPFDocument(fis);
//                XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);
//                docContent= extractor.getText();
//                fis.close();
//            } else {
//                docContent="此文件不是word文件！";
//            }
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//        return docContent;
//
//    }
}
