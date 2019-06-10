package com.annotation.dao;

import com.annotation.model.Document;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


@Mapper
@Repository
public interface DocumentMapper {

       /**
        * 插入文件信息 --> document
        * @param record
        * @return
        */
       int insert(Document record);

       /**
        * 设置数据库自增长为1
        * @return
        */
       int alterDocumentTable();


       int deleteByPrimaryKey(Integer did);

//
//
//       /**
//        * 分页查询
//        * 参数：用户ID,页数，每页数量
//        * @param data
//        * @return
//        */
//       List<Document> selectDocumentByRelatedInfo(Map<String,Object> data);
//
//       /**
//        * 根据文档ID查询
//        * 参数：文档ID
//        * @param documentid
//        * @return
//        */
//       Document  selectDocumentById(int documentid);
//
//       /**
//        * 根据用户ID获取记录总数
//        * @param userid
//        * @return
//        */
//       Integer countDocNumByUserId(int userid);

//       /**
//        * 根据contentid更新content的完成状态
//        * @param document
//        * @return
//        */
//       int updateDocumentById(Document document);

//       /**
//        * 根据instID更新文档状态
//        * @param instId
//        * @param docStatus
//        * @return
//        */
//       int updateDocStatusByInstanceId(@Param("instId")int instId, @Param("docStatus")String docStatus);
//





}