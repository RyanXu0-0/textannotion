package com.annotation.service;

import com.annotation.model.Document;
import com.annotation.model.User;
import com.annotation.model.entity.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/8.
 */
public interface IDocumentService {

    /**
     * 检查并插入，形如 doc->para
     * @param files
     * @param userId
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    ResponseEntity checkAddDocParagraph(MultipartFile[] files, int userId) throws IllegalStateException;


    /**
     * 插入document
     * 调用addParagraph插入para
     * do:信息抽取和分类
     * @param document 文件相关信息
     * @param docContent 文件内容
     * @return
     */
    @Transactional
    int addDocumentParagraph(Document document, String docContent);

    /**
     * 插入paragraph
     * do:信息抽取和分类
     * @param docId
     * @param contentArr
     * @return
     */
    int addParagraph(int docId,String[] contentArr);

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
    ResponseEntity checkAddDocInstanceItem(MultipartFile[] files, int userId, int num0, int num1, int num2) throws IllegalStateException;


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
    int addDocumentInstanceItem(Document document,int userId,String docContent,int num0,int num1,int num2);

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
    int addInstanceItem(int docId,String[] instanceArr,int labelnum,int labelitem1,int labelitem2);

    /**
     * 插入item
     * @param instId
     * @param itemArr
     * @param labelitem1
     * @param labelitem2
     * @return
     */
    int addItem(int instId,String[] itemArr,int labelitem1,int labelitem2);

    /**
     * 文本配对
     * @param files
     * @param userId
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    ResponseEntity checkAddDocInstanceListitem(MultipartFile[] files,int userId) throws IllegalStateException;

    /**
     * 文本匹配插入文件
     * @param document 文件相关信息
     * @param docContent 文件内容
     * @return
     */
    int addDocInstanceListItem(Document document,int userId,String docContent);

    /**
     * 文本匹配插入instance内容
     * @param docId
     * @param instanceArr
     * @return
     */
    int addInstanceListItem(int docId,String[] instanceArr);

    /**
     * 文本匹配插入listitem内容
     * @param instId
     * @param itemArr
     * @return
     */
    int addListItem(int instId,String[] itemArr);


    /**
     * 文本排序
     * @param files
     * @param userId
     * @param typeId
     * @return
     * @throws IllegalStateException
     */
    @Transactional
    ResponseEntity checkAddSortingDoc(MultipartFile[] files,int userId,int typeId) throws IllegalStateException;

    /**
     * 文本排序
     * @param document
     * @param docContent
     * @param typeId
     * @return
     */
    int addDocOfSorting(Document document,String docContent,int typeId);

    /**
     * 文本排序
     * @param docId
     * @param instanceArr
     * @param typeId
     * @return
     */
    int addInstanceOfSorting(int docId,String[] instanceArr,int typeId);

    /**
     * 文本排序
     * @param instId
     * @param itemArr
     * @param typeId
     * @return
     */
    int addItemOfSorting(int instId,String[] itemArr,int typeId);


    /**
     * 文件分页查询
     * @param userId
     * @param page 页数
     * @param limit 每页数量
     * @return
     */
//     List<Document> queryDocByRelatedInfo(int userId, int page, int limit);

    /**
     * 根据用户ID查询文件总数
     * @param userId
     * @return
     */
//     int countNumByUserId(int userId);

//    /**
//     * 插入文件内容
//     * @param docId
//     * @param contentArr
//     * @return
//     */
//     int addContent(int docId,String[] contentArr);
//



//
//    /**
//     * 文本排序
//     * @param files
//     * @param user
//     * @return
//     */
//    ResponseEntity addMultiFileOneSorting(MultipartFile[] files,User user,String taskType);

    /**
     * 文本类比排序

     * @param user
     * @return
     */
    //ResponseEntity addMultiFileTwoSorting(MultipartFile[] files,User user);

//    int addTwoInstances(Document document, User user, String docContent, String taskType);
//
//    int addTwoItems(int docId,String[] instanceArr,String taskType);
//
//    int addItems(int instId,String[] itemArr,String taskType);

}
