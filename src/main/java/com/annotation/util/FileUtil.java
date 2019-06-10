package com.annotation.util;

import com.annotation.model.entity.ResponseEntity;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.xwpf.extractor.XWPFWordExtractor;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

/**
 * Created by twinkleStar on 2019/1/13.
 */
@Component
public class FileUtil {

    @Autowired
    ResponseUtil responseUtil;

    /**
     * 获取文件内容字符串
     * @param multipartFile
     * @return content(String)
     * @throws IOException
     */
    public  String parseDocContent(MultipartFile multipartFile)throws IOException {
        String filename =multipartFile.getOriginalFilename();//文件名称
        InputStream inputStream = multipartFile.getInputStream();
        String docContent="";//文件内容
        try {
            if (filename.endsWith(".doc")) {
                WordExtractor ex = new WordExtractor(inputStream);
                docContent = ex.getText();
            } else if (filename.endsWith("docx")) {
                XWPFDocument xdoc = new XWPFDocument(inputStream);
                XWPFWordExtractor extractor = new XWPFWordExtractor(xdoc);
                docContent= extractor.getText();
                inputStream.close();
            } else if(filename.endsWith(".txt")) {
                InputStreamReader reader = new InputStreamReader(inputStream, "GBK");
                BufferedReader br = new BufferedReader(reader);
                String line;
                StringBuilder sb = new StringBuilder();
                while ((line = br.readLine()) != null) {
                    sb.append(line);
                }
                docContent = sb.toString();
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return docContent;
    }

    /**
     * 获取文件类型
     * @param filename
     * @return docType
     */
    public  String parseDocType(String filename){
        String docType="";
        if (filename.endsWith(".doc")) {
            docType=".doc";
        } else if (filename.endsWith("docx")) {
            docType=".docx";
        } else if(filename.endsWith(".txt")){
            docType=".txt";
        }
        return docType;
    }

    /**
     * 检查是否上传文件
     * 错误码：2001
     * @param files 多文件列表
     */
    public  ResponseEntity checkFilesLength(MultipartFile[] files){
        if(files.length==0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2001);
            return responseEntity;
        }else{
            ResponseEntity responseEntity = new ResponseEntity();
            responseEntity.setStatus(0);
            return responseEntity;
        }
    }


    /**
     * 检查文件格式
     * 错误码：2002
     * @param multipartFile
     * @return
     */
    public int checkFiletype(MultipartFile multipartFile){

        String filename=multipartFile.getOriginalFilename();
        if (filename.endsWith(".doc") ||filename.endsWith(".docx") ||filename.endsWith(".txt")) {
            return 0;
        }else{
            return -1;
        }

    }


    /**
     * 检查文件大小
     * 错误码：2003
     * @param multipartFile
     * @return
     */
    public int checkFileSize(MultipartFile multipartFile){
        long filesize = multipartFile.getSize();
        if(filesize>=1048576){
            return -1;
        }else {
            return 0;
        }
    }

    /**
     * 检查文件内容
     * 错误码：2004、2005
     * @param file
     * @return
     * @throws IOException
     */
    public  ResponseEntity checkFilecontent(MultipartFile file)throws IOException {
        String filename=file.getOriginalFilename();

        /**
         * 检查文件类型
         */
        int typeRes=checkFiletype(file);
        if(typeRes<0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2002);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        /**
         * 检查文件大小
         */
        int sizeRes=checkFileSize(file);
        if(sizeRes<0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2003);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        //获取文件内容：paragraph
        String docContent = parseDocContent(file);
        if(!docContent.contains("#")){
            ResponseEntity responseEntity=responseUtil.judgeResult(2020);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        /**
         * 检查每段内容大小
         * 读取的document->paragraph 使用 # 分隔
         */
        String[] contentArr = docContent.split("#");
        for (int i = 0; i < contentArr.length; i++) {
            if (contentArr[i].length() <= 0) {
                ResponseEntity responseEntity=responseUtil.judgeResult(2004);
                responseEntity.setMsg(filename+responseEntity.getMsg());
                return responseEntity;
            }
            if (contentArr[i].length() > 20000) {
                ResponseEntity responseEntity=responseUtil.judgeResult(2005);
                responseEntity.setMsg(filename+responseEntity.getMsg());
                return responseEntity;
            }
        }

        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setStatus(0);
        return responseEntity;
    }

    /**
     * 检查instance+item格式文件内容
     * 错误码：2008，2009，2010
     * @param file
     * @return
     * @throws IOException
     */
    public ResponseEntity checkInstanceItem(MultipartFile file)throws IOException {
        String filename=file.getOriginalFilename();
        /**
         * 检查文件类型
         */
        int typeRes=checkFiletype(file);
        if(typeRes!=0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2002);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        /**
         * 检查文件大小
         */
        int sizeRes=checkFileSize(file);
        if(sizeRes!=0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2003);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        //读取的文件内容由#分隔
        //检查每段内容大小
        String docContent = parseDocContent(file);
        String[] contentArr = docContent.split("#");
        for (int i = 0; i < contentArr.length; i++) {
            String[] itemArr = contentArr[i].split("-------");
            if(itemArr.length!=2){
                ResponseEntity responseEntity=responseUtil.judgeResult(2008);
                responseEntity.setMsg(filename+responseEntity.getMsg());
                return responseEntity;
            }else{
                for(int j=0;j<itemArr.length;j++){
                    if (itemArr[j].length() <= 0) {
                        ResponseEntity responseEntity=responseUtil.judgeResult(2009);
                        responseEntity.setMsg(filename+responseEntity.getMsg());
                        return responseEntity;

                    }
                    if (itemArr[j].length() > 20000) {
                        ResponseEntity responseEntity=responseUtil.judgeResult(2010);
                        responseEntity.setMsg(filename+responseEntity.getMsg());

                    }
                }
            }
        }
        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setStatus(0);
        return responseEntity;
    }


    /**
     * 文本配对
     * @param file
     * @return
     * @throws IOException
     */
    public ResponseEntity checkInstanceListItem(MultipartFile file)throws IOException {
        String filename=file.getOriginalFilename();

        /**
         * 检查文件类型
         */
        int typeRes=checkFiletype(file);
        if(typeRes!=0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2002);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        /**
         * 检查文件大小
         */
        int sizeRes=checkFileSize(file);
        if(sizeRes!=0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2003);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        //检查每段内容大小
        String docContent = parseDocContent(file);
        String[] contentArr = docContent.split("#");
        for (int i = 0; i < contentArr.length; i++) {
            String[] listArr = contentArr[i].split("-------");
            //-3每个instance中的list的个数不正确
            //-4文件中有的item为空
            //-5文件中有的文本超过字数限制
            if(listArr.length!=2){
                ResponseEntity responseEntity=responseUtil.judgeResult(2013);
                responseEntity.setMsg(filename+responseEntity.getMsg());
                return responseEntity;
            }else{
                for(int j=0;j<listArr.length;j++){
                    String[] itemArr = listArr[i].split("&&&&&&&");
                    for(int k=0;k<itemArr.length;k++) {
                        if (itemArr[k].length() <= 0) {
                            ResponseEntity responseEntity=responseUtil.judgeResult(2014);
                            responseEntity.setMsg(filename+responseEntity.getMsg());
                            return responseEntity;

                        }
                        if (itemArr[k].length() > 20000) {
                            ResponseEntity responseEntity=responseUtil.judgeResult(2015);
                            responseEntity.setMsg(filename+responseEntity.getMsg());
                            return responseEntity;
                        }
                    }
                }
            }
        }
        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setStatus(0);
        return responseEntity;
    }

    /**
     * 文本排序
     * @param file
     * @param typeId
     * @return
     * @throws IOException
     */
    public  ResponseEntity checkSortingInstanceItem(MultipartFile file,int typeId)throws IOException {
        String filename=file.getOriginalFilename();

        /**
         * 检查文件类型
         */
        int typeRes=checkFiletype(file);
        if(typeRes!=0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2002);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        /**
         * 检查文件大小
         */
        int sizeRes=checkFileSize(file);
        if(sizeRes!=0){
            ResponseEntity responseEntity=responseUtil.judgeResult(2003);
            responseEntity.setMsg(filename+responseEntity.getMsg());
            return responseEntity;
        }

        //检查每段内容大小
        String docContent = parseDocContent(file);
        String[] contentArr = docContent.split("#");
        for (int i = 0; i < contentArr.length; i++) {
            String[] itemArr = contentArr[i].split("-------");
            //-3每个instance中的item的个数不正确
            //-4文件中有的item为空
            //-5文件中有的文本超过字数限制

            if(itemArr.length<2 && typeId==5){
                ResponseEntity responseEntity=responseUtil.judgeResult(2017);
                responseEntity.setMsg(filename+responseEntity.getMsg());
                return responseEntity;
            }else if(itemArr.length<3 && typeId==6){
                ResponseEntity responseEntity=responseUtil.judgeResult(2017);
                responseEntity.setMsg(filename+responseEntity.getMsg());
                return responseEntity;
            } else{
                for(int j=0;j<itemArr.length;j++){
                    if (itemArr[j].length() <= 0) {
                        ResponseEntity responseEntity=responseUtil.judgeResult(2018);
                        responseEntity.setMsg(filename+responseEntity.getMsg());
                        return responseEntity;
                    }
                    if (itemArr[j].length() > 20000) {
                        ResponseEntity responseEntity=responseUtil.judgeResult(2019);
                        responseEntity.setMsg(filename+responseEntity.getMsg());
                        return responseEntity;
                    }
                }
            }
        }
        ResponseEntity responseEntity=new ResponseEntity();
        responseEntity.setStatus(0);
        return responseEntity;
    }


}
