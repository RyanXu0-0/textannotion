package com.annotation.service.impl;

import com.annotation.dao.*;
import com.annotation.model.*;
import com.annotation.model.entity.ResponseEntity;
import com.annotation.service.IDocumentService;
import com.annotation.util.FileUtil;
import com.annotation.util.ResponseUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
    @Autowired
    TestDocumentMapper testDocumentMapper;
    @Autowired
    TestExtractionDataMapper testExtractionDataMapper;
    @Autowired
    TestExtractionEntityMapper testExtractionEntityMapper;
    @Autowired
    TestExtractionRelMapper testExtractionRelMapper;
    @Autowired
    TestRelationMapper testRelationMapper;
    @Autowired
    TestPairingMapper testPairingMapper;
    @Autowired
    TestSortMapper testSortMapper;
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
//                responseEntity = fileUtil.checkFilecontent(file);
//                if(responseEntity.getStatus() != 0){
//                    return responseEntity;
//                }
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

                int docRes;
                if(docType.equals(".doc") || docType.equals(".docx")){
                    String docContent=fileUtil.parseDocContent(file);
                    docRes=  addDocumentParagraph(document,docContent);
                }else{
                    docRes=  addXlsParagraph(document,file);
                }

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
     * @param file 文件
     * @return
     */
    @Transactional
    public int addXlsParagraph(Document document, MultipartFile file){


        int docInsertRes = documentMapper.insert(document);//插入结果
        //插入document失败
        if(docInsertRes < 0){
            return 2006;
        }else{
            int docId=document.getDid();//插入成功的文件ID
            paragraphMapper.alterParagraphTable();
            int addParagraphRes ;
            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    int instid;
                    Paragraph paragraph =new Paragraph();
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    paragraph.setParaindex(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    paragraph.setParacontent(row.getCell(1).getStringCellValue());
                    paragraph.setDocumentId(docId);
                    paragraphMapper.insert(paragraph);
                }

            }catch (IOException e){
                e.printStackTrace();
            }

            return docId;
        }

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
//                responseEntity = fileUtil.checkInstanceItem(file);
//                if(responseEntity.getStatus()!=0){
//                    return responseEntity;
//                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //最后插入document和content
        List<Integer> docids = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
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
                int docRes;
                if(docType.equals(".doc") || docType.equals(".docx")){
                    String docContent=fileUtil.parseDocContent(file);
                    docRes = addDocumentInstanceItem(document,userId,docContent,num0,num1,num2);
                }else{
                    docRes = addDocumentAndItem(document,userId,file,num0,num1,num2);
                }

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
     * 文本关系
     * 插入document
     * 调用 插入-->instanceItem
     * @param document
     * @param userId
     * @param file
     * @param labelnum
     * @param labelitem1
     * @param labelitem2
     * @return
     */
    public int addDocumentAndItem(Document document,int userId,MultipartFile file,int labelnum,int labelitem1,int labelitem2){

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
            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }

                    Instance instance =new Instance();
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);

                    instance.setInstindex(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    instance.setDocumentId(docId);
                    instance.setLabelnum(labelnum);
                    int instanceRes =instanceMapper.insert(instance);
                    if(instanceRes <0){
                        return -1;
                    }

                    Item itema = new Item();
                    itema.setItemcontent(row.getCell(1).getStringCellValue());
                    itema.setItemindex(1);
                    itema.setInstanceId(instance.getInstid());
                    itema.setLabelnum(labelitem1);

                    Item itemb = new Item();
                    itemb.setItemcontent(row.getCell(2).getStringCellValue());
                    itemb.setItemindex(2);
                    itemb.setInstanceId(instance.getInstid());
                    itemb.setLabelnum(labelitem2);

                    int itemRes = itemMapper.insert(itema);
                    itemMapper.insert(itemb);
                    //文件内容插入失败
                    if(itemRes <0){
                        return -1;
                    }

                }
            }catch (IOException e){
                e.printStackTrace();
            }
            return docId;

        }
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
//                responseEntity = fileUtil.checkInstanceListItem(file);
//                if(responseEntity.getStatus()!=0){
//                    return responseEntity;
//                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //最后插入document和content
        List<Integer> docids = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
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
                int docRes;
                if(docType.equals(".doc") || docType.equals(".docx")){
                    String docContent=fileUtil.parseDocContent(file);
                    docRes = addDocInstanceListItem(document,userId,docContent);
                }else{
                    docRes = addXlsInstanceListItem(document,userId,file);
                }

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
        for (int i: docids) {
            System.out.println("docids"+i);
        }
        responseEntity.setData(data);
        return responseEntity;
    }


    /**
     * 文本匹配
     * @param document 文件相关信息
     * @param userId
     * @param file 文件
     * @return
     */
    public int addXlsInstanceListItem(Document document,int userId,MultipartFile file){

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

            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    int instid;
                    Instance instance =new Instance();
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    instance.setInstindex(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    instance.setDocumentId(docId);
                    Instance instindex = instanceMapper.selectInstance(instance);
                    if(instindex == null){
                        instanceMapper.insert(instance);
                        instid=instance.getInstid();
                    }else{
                        instid = instindex.getInstid();
                    }

                    Listitem listitema = new Listitem();
                    listitema.setListIndex(1);
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    listitema.setLitemindex(Integer.valueOf(row.getCell(1).getStringCellValue()));
                    listitema.setLitemcontent(row.getCell(2).getStringCellValue());
                    listitema.setInstanceId(instid);
                    listitemMapper.insert(listitema);

                    Listitem listitemb = new Listitem();
                    listitemb.setListIndex(2);
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    listitemb.setLitemindex(Integer.valueOf(row.getCell(1).getStringCellValue()));
                    listitemb.setLitemcontent(row.getCell(3).getStringCellValue());
                    listitemb.setInstanceId(instid);
                    listitemMapper.insert(listitemb);
                }

            }catch (IOException e){
                e.printStackTrace();
            }
            System.out.println(docId);
            return docId;

        }
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
//                responseEntity = fileUtil.checkSortingInstanceItem(file,typeId);
//                if(responseEntity.getStatus()!=0){
//                    return responseEntity;
//                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //最后插入document和content
        List<Integer> docIds = new ArrayList<Integer>();
        for (MultipartFile file : files) {
            try {
                String filename =file.getOriginalFilename();//文件名称
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

                int docRes;
                if(docType.equals(".doc") || docType.equals(".docx")){
                    String docContent=fileUtil.parseDocContent(file);
                    docRes = addDocOfSorting(document,docContent,typeId);
                }else{
                    docRes = addXlsOfSorting( document,file);
                }

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
     * @param document
     * @param file

     * @return
     */
    public int addXlsOfSorting(Document document,MultipartFile file){

        //String[] instanceArr = docContent.split("#");

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
            int addContentRes=0;

            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    int instid;
                    Instance instance =new Instance();
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    instance.setInstindex(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    instance.setDocumentId(docId);
                    Instance instindex = instanceMapper.selectInstance(instance);
                    if(instindex == null){
                        instanceMapper.insert(instance);
                        instindex = instanceMapper.selectInstance(instance);
                    }
                    instid = instindex.getInstid();

                    Item item = new Item();
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    item.setItemindex(Integer.valueOf(row.getCell(1).getStringCellValue()));
                    item.setItemcontent(row.getCell(2).getStringCellValue());
                    item.setInstanceId(instid);
                    int itemRes = itemMapper.insert(item);
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                }

            }catch (IOException e){
                e.printStackTrace();
            }
            //instance插入失败
            if(addContentRes!=0){
                return addContentRes;
            }else{
                return docId;
            }
        }
    }


    /**
     * 文本排序和类比排序
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
     * 类比排序插入为01234
     * 文本排序插入为1234
     *
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
     * 检查测试文件并插入，形如doc->para
     * @param files 多文件类别
     * @param userId 用户Id
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    public ResponseEntity checkTestDocument (MultipartFile[] files, int userId) throws IllegalStateException{

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
 * 检查文件名
 */
        responseEntity = fileUtil.splitDataAndAnswer(files);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }
        Map<String,List<MultipartFile>> map = (Map) responseEntity.getData();
        List<MultipartFile> dataFiles = map.get("dataFiles");
        List<MultipartFile> anwserFiles = map.get("anwserFiles");
        /**
         * 检查全部符合要求
         * doc-->para
         */
        List<Integer> docIds = new ArrayList<Integer>();
        for (MultipartFile file : dataFiles) {
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

/*
* 插入测试文件信息到document和test_document
* */
    @Transactional
    public int insertTestDocInfo(MultipartFile file,int taskId,int userId){
        ResponseEntity responseEntity = new ResponseEntity();
        String filename =file.getOriginalFilename();//文件名称
        String docType = filename.substring(filename.lastIndexOf("."));
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
        documentMapper.insert(document);

        TestDocument testDocument = new TestDocument();
        testDocumentMapper.alterTable();
        testDocument.setDocumentId(document.getDid());
        testDocument.setTaskId(taskId);
        testDocumentMapper.insert(testDocument);
        return testDocument.getDocumentId();
    }


    /**
     * 检查并插入，形如
     * Transactional抛错数据回滚
     * @param testfiles 多文件类别
     * @param userId 用户Id
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    public ResponseEntity extractionParseTest(MultipartFile[] testfiles,int taskId, int userId) throws IllegalStateException{
        ResponseEntity responseEntity = new ResponseEntity();
        List<MultipartFile> dataList = new ArrayList();//存放测试用例
        List<MultipartFile> answerList = new ArrayList();//存放测试答案
        Map<String,List<MultipartFile>> filemap = new HashMap();
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        responseEntity = fileUtil.splitDataAndAnswer(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }
        filemap = (Map<String, List<MultipartFile>>) responseEntity.getData();
        dataList = filemap.get("dataFiles");
        answerList = filemap.get("anwserFiles");

        for (MultipartFile f: dataList) {
            int tempdocId = insertTestDocInfo(f,taskId,userId);
            parseExtractionTestData(f,taskId,tempdocId);
        }
        for (MultipartFile f: answerList) {
            insertTestDocInfo(f,taskId,userId);
            parseExtractionTestAnswer(f,taskId);
        }
        return responseEntity;
    }

    public void parseExtractionTestData(MultipartFile file,int taskId,int docmentId){
        List<TestExtractionData> dataList = new ArrayList<>();
        try {
            //1、获取文件输入流
            InputStream inputStream = file.getInputStream();
            //2、获取Excel工作簿对象
            HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
            //3、得到Excel工作表对象
            HSSFSheet sheetAt = workbook.getSheetAt(0);
            //4、循环读取表格数据
            for (Row row : sheetAt) {
                //首行（即表头）不读取
                if (row.getRowNum() == 0) {
                    continue;
                }
                TestExtractionData tempData = new TestExtractionData();
                //读取当前行中单元格数据，索引从0开始
                tempData.setDocumentId(docmentId);
                tempData.setTaskId(taskId);
                row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                tempData.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                tempData.setContent(row.getCell(1).getStringCellValue());
                dataList.add(tempData);
            }
            testExtractionDataMapper.insertAll(dataList);
        }catch (IOException e){
            e.printStackTrace();
        }

    }

    public void parseExtractionTestAnswer(MultipartFile file,int taskId){
        List<TestExtractionRel> relList = new ArrayList<>();
        List<TestExtractionEntity> entityList = new ArrayList<>();
        try {
            //1、获取文件输入流
            InputStream inputStream = file.getInputStream();
            //2、获取Excel工作簿对象
            HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
            //3、得到Excel工作表对象
            HSSFSheet sheetAt = workbook.getSheetAt(0);
            //4、循环读取表格数据
            for (Row row : sheetAt) {
                //首行（即表头）不读取
                if (row.getRowNum() == 0) {
                    continue;
                }
                row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                int subtaskId = Integer.valueOf(row.getCell(0).getStringCellValue());
                //designation标记是关系还是实体,T是实体，R是关系
                String designation = row.getCell(1).getStringCellValue();
                if ("T".equals(String.valueOf(designation.charAt(0)))) {
                    String entityname = row.getCell(2).getStringCellValue();
                    row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
                    int startindex = Integer.valueOf(row.getCell(3).getStringCellValue());
                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                    int endindex = Integer.valueOf(row.getCell(4).getStringCellValue());
                    row.getCell(5).setCellType(Cell.CELL_TYPE_STRING);
                    String entity = row.getCell(5).getStringCellValue();
                    TestExtractionEntity tempEntity = new TestExtractionEntity(taskId,subtaskId,designation,entityname,startindex,endindex,entity);
                    entityList.add(tempEntity);
                }else{
                    String relname = row.getCell(2).getStringCellValue();
                    String headentity = row.getCell(3).getStringCellValue();
                    String tailentity = row.getCell(4).getStringCellValue();
                    TestExtractionRel tempRel = new TestExtractionRel(taskId,subtaskId,designation,relname,headentity,tailentity);
                    relList.add(tempRel);
                }
            }
            testExtractionEntityMapper.insertAll(entityList);
            testExtractionRelMapper.insertAll(relList);
        }catch (IOException e){
            e.printStackTrace();
        }
    }


    @Transactional
    public ResponseEntity classifyParseTest(MultipartFile[] testfiles,int taskId, int userId) throws IllegalStateException{
        ResponseEntity responseEntity = new ResponseEntity();
        List<MultipartFile> dataList = new ArrayList();//存放文件
        List<TestExtractionData>  classifyList = new ArrayList<>();
        for(MultipartFile f:testfiles){
            dataList.add(f);
        }
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        for (MultipartFile file: dataList) {
            int tempdocId = insertTestDocInfo(file, taskId, userId);
            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    TestExtractionData tempdata = new TestExtractionData();
                    tempdata.setTaskId(taskId);
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    tempdata.setContent(row.getCell(1).getStringCellValue());
                    tempdata.setLabel(row.getCell(2).getStringCellValue());
                    tempdata.setDocumentId(tempdocId);
                    classifyList.add(tempdata);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        testExtractionDataMapper.insertAllClassify(classifyList);
        return responseEntity;
    }

    @Transactional
    public ResponseEntity relationParseTest(MultipartFile[] testfiles,int taskId, int userId) throws IllegalStateException {
        ResponseEntity responseEntity = new ResponseEntity();
        List<MultipartFile> dataList = new ArrayList();//存放测试用例
        List<MultipartFile> answerList = new ArrayList();//存放测试答案
        Map<String,List<MultipartFile>> filemap = new HashMap();
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        responseEntity = fileUtil.splitDataAndAnswer(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }
        filemap = (Map<String, List<MultipartFile>>) responseEntity.getData();
        dataList = filemap.get("dataFiles");
        answerList = filemap.get("anwserFiles");

        for (MultipartFile f: dataList) {
            System.out.println(f.getOriginalFilename());
            int tempdocId = insertTestDocInfo(f,taskId,userId);
            parseRelationTestData(f,taskId,tempdocId);
        }
        for (MultipartFile f: answerList) {
            System.out.println(f.getOriginalFilename());
            insertTestDocInfo(f,taskId,userId);
            parseRelationTestAnswer(f,taskId);
        }
        return responseEntity;
    }

    public void parseRelationTestData(MultipartFile file,int taskId,int docId){
        List<TestExtractionData> dataList = new ArrayList<>();
        try {
            //1、获取文件输入流
            InputStream inputStream = file.getInputStream();
            //2、获取Excel工作簿对象
            HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
            //3、得到Excel工作表对象
            HSSFSheet sheetAt = workbook.getSheetAt(0);
            //4、循环读取表格数据
            for (Row row : sheetAt) {
                //首行（即表头）不读取
                if (row.getRowNum() == 0) {
                    continue;
                }
                TestExtractionData tempdata = new TestExtractionData();
                tempdata.setTaskId(taskId);
                row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                tempdata.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                tempdata.setContent(row.getCell(1).getStringCellValue());
                tempdata.setLabel(row.getCell(2).getStringCellValue());
                tempdata.setDocumentId(docId);
                dataList.add(tempdata);
            }
            testRelationMapper.insertAllRelationData(dataList);
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public void parseRelationTestAnswer(MultipartFile file,int taskId){
        List<TestRelation> dataList = new ArrayList<>();
        try {
            //1、获取文件输入流
            InputStream inputStream = file.getInputStream();
            //2、获取Excel工作簿对象
            HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
            //3、得到Excel工作表对象
            HSSFSheet sheetAt = workbook.getSheetAt(0);
            //4、循环读取表格数据
            for (Row row : sheetAt) {
                //首行（即表头）不读取
                if (row.getRowNum() == 0) {
                    continue;
                }
                System.out.println(row.getRowNum()+row.toString());
                TestRelation tempdata = new TestRelation();
                tempdata.setTaskId(taskId);
                row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                tempdata.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                tempdata.setLabeltype(row.getCell(1).getStringCellValue());
                tempdata.setLabel(row.getCell(2).getStringCellValue());
                dataList.add(tempdata);
            }
            testRelationMapper.insertAllRelationAnswer(dataList);
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @Transactional
    public ResponseEntity pairParseTest(MultipartFile[] testfiles,int taskId, int userId) throws IllegalStateException {
        ResponseEntity responseEntity = new ResponseEntity();
        List<MultipartFile> dataList = new ArrayList();//存放文件
        List<TestPairing>  pairingList = new ArrayList<>();
        for(MultipartFile f:testfiles){
            dataList.add(f);
        }
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        for (MultipartFile file: dataList) {
            int tempdocId = insertTestDocInfo(file, taskId, userId);
            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    System.out.println(row.getRowNum());
                    TestPairing tempdata = new TestPairing();
                    tempdata.setTaskId(taskId);
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setItemId(Integer.valueOf(row.getCell(1).getStringCellValue()));
                    tempdata.setItemType(row.getCell(2).getStringCellValue());
                    tempdata.setItemContent(row.getCell(3).getStringCellValue());
                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setCorItemId(Integer.valueOf(row.getCell(4).getStringCellValue()));
                    pairingList.add(tempdata);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        testPairingMapper.insertAll(pairingList);
        return responseEntity;
    }


    @Transactional
    public ResponseEntity sortParseTest(MultipartFile[] testfiles,int taskId, int userId) throws IllegalStateException {
        ResponseEntity responseEntity = new ResponseEntity();
        List<MultipartFile> dataList = new ArrayList();//存放文件
        List<TestSort>  sortList = new ArrayList<>();
        for(MultipartFile f:testfiles){
            dataList.add(f);
        }
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        for (MultipartFile file: dataList) {
            int tempdocId = insertTestDocInfo(file, taskId, userId);
            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    TestSort tempdata = new TestSort();
                    tempdata.setTaskId(taskId);
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setItemId(Integer.valueOf(row.getCell(1).getStringCellValue()));
                    tempdata.setContent(row.getCell(2).getStringCellValue());
                    row.getCell(3).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setSortId(Integer.valueOf(row.getCell(3).getStringCellValue()));
                    sortList.add(tempdata);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        testSortMapper.insertAllSort(sortList);
        return responseEntity;
    }


    @Transactional
    public ResponseEntity contrastSortParseTest(MultipartFile[] testfiles,int taskId, int userId) throws IllegalStateException {
        ResponseEntity responseEntity = new ResponseEntity();
        List<MultipartFile> dataList = new ArrayList();//存放文件
        List<TestSort>  sortList = new ArrayList<>();
        for(MultipartFile f:testfiles){
            dataList.add(f);
        }
        /**
         * 检查是否上传文件
         */
        responseEntity = fileUtil.checkFilesLength(testfiles);
        if(responseEntity.getStatus() != 0){
            return responseEntity;
        }

        for (MultipartFile file: dataList) {
            int tempdocId = insertTestDocInfo(file, taskId, userId);
            try {
                //1、获取文件输入流
                InputStream inputStream = file.getInputStream();
                //2、获取Excel工作簿对象
                HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
                //3、得到Excel工作表对象
                HSSFSheet sheetAt = workbook.getSheetAt(0);
                //4、循环读取表格数据
                for (Row row : sheetAt) {
                    //首行（即表头）不读取
                    if (row.getRowNum() == 0) {
                        continue;
                    }
                    TestSort tempdata = new TestSort();
                    tempdata.setTaskId(taskId);
                    row.getCell(0).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setSubtaskId(Integer.valueOf(row.getCell(0).getStringCellValue()));
                    row.getCell(1).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setItemId(Integer.valueOf(row.getCell(1).getStringCellValue()));
                    tempdata.setContrastContent(row.getCell(2).getStringCellValue());
                    tempdata.setContent(row.getCell(3).getStringCellValue());
                    row.getCell(4).setCellType(Cell.CELL_TYPE_STRING);
                    tempdata.setSortId(Integer.valueOf(row.getCell(4).getStringCellValue()));
                    sortList.add(tempdata);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        testSortMapper.insertAllSort(sortList);
        return responseEntity;
    }
}
