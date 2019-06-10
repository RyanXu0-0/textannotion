package com.annotation.service.impl;

import com.annotation.dao.InstanceLabelMapper;
import com.annotation.model.Label;
import com.annotation.service.IInstanceLabelService;
import com.annotation.service.IInstanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/2.
 */
@Repository
public class InstanceLabelServiceImpl implements IInstanceLabelService {

    @Autowired
    InstanceLabelMapper instanceLabelMapper;


    /**
     * 根据文件ID查询instance对应的label
     * @param docId
     * @return
     */
    public List<Label> queryInstanceLabelByDocId(int docId){
        List<Label> labelList =instanceLabelMapper.selectInstanceLabelByDocId(docId);
        return labelList;
    }

    /**
     * 根据文件ID查询item1对应的label
     * @param docId
     * @return
     */
    public List<Label> queryItem1LabelByDocId(int docId){
        List<Label> labelList =instanceLabelMapper.selectItem1LabelByDocId(docId);
        return labelList;
    }

    /**
     * 根据文件ID查询item2对应的label
     * @param docId
     * @return
     */
    public List<Label> queryItem2LabelByDocId(int docId){
        List<Label> labelList =instanceLabelMapper.selectItem2LabelByDocId(docId);
        return labelList;
    }

}
