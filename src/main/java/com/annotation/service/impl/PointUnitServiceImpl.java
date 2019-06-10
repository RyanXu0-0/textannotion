package com.annotation.service.impl;

import com.annotation.dao.PointMapper;
import com.annotation.dao.PointUnitMapper;
import com.annotation.model.Point;
import com.annotation.model.PointUnit;
import com.annotation.service.IPointUnitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by kongmin on 2019/2/8.
 */
@Repository
public class PointUnitServiceImpl implements IPointUnitService {

    @Autowired
    PointUnitMapper pointUnitMapper;

    public int insert(int pointunit,int taskId){
        pointUnitMapper.alterPointUnitTable();
        PointUnit pointUnit = new PointUnit();
        pointUnit.setPointunit(pointunit);
        pointUnit.setTaskId(taskId);
        int res = pointUnitMapper.insert(pointUnit);
        return res;
    }

    public PointUnit selectBytaskId(Integer taskId){
        PointUnit pointUnit = pointUnitMapper.selectBytaskId(taskId);
        return pointUnit;
    }
}
