package com.annotation.service;

import com.annotation.model.Item;
import com.annotation.model.Listitem;
import com.annotation.model.Paragraph;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.InstanceListitemEntity;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/29.
 */
public interface IInstanceService {

//    /**
//     * 查询instance+item
//     * @param docId
//     * @return
//     */
//    List<InstanceItemEntity> queryInstanceItem(int docId,int userId);

    /**
     * 根据文件ID查询item内容
     * @param docId
     * @return
     */
    public List<Item> selectItemContentByDocId(int docId);

    /**
     * 根据文件ID查询listitem内容
     * @param docId
     * @return
     */
    public List<Listitem> selectListItemContentByDocId(int docId);



}
