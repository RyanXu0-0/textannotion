package com.annotation.service.impl;

import com.annotation.dao.InstanceMapper;
import com.annotation.dao.ItemMapper;
import com.annotation.dao.ListitemMapper;
import com.annotation.model.Item;
import com.annotation.model.Listitem;
import com.annotation.model.entity.InstanceItemEntity;
import com.annotation.model.entity.InstanceListitemEntity;
import com.annotation.service.IInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by twinkleStar on 2018/12/29.
 */


@Repository
public class InstanceServiceImpl implements IInstanceService {

    @Autowired
    InstanceMapper instanceMapper;

    @Autowired
    ItemMapper itemMapper;

    @Autowired
    ListitemMapper listitemMapper;

    /**
     *
     * @param docId
     * @return
     */
    public List<Item> selectItemContentByDocId(int docId){
        List<Item> itemlist = itemMapper.selectItemContentByDocId(docId);
        return itemlist;
    }

    /**
     *
     * @param docId
     * @return
     */
    public List<Listitem> selectListItemContentByDocId(int docId){
        List<Listitem> listitemlist = listitemMapper.selectListItemContentByDocId(docId);
        return listitemlist;
    }

}
