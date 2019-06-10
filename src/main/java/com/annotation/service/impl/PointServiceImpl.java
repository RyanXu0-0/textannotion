package com.annotation.service.impl;

import com.annotation.dao.PointMapper;
import com.annotation.dao.PointUnitMapper;
import com.annotation.model.PointUnit;
import com.annotation.model.Point;
import com.annotation.service.IPointService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by kongmin on 2019/2/8.
 */
@Repository
public class PointServiceImpl implements IPointService {

    @Autowired
    PointMapper pointMapper;
    @Autowired
    PointUnitMapper pointUnitMapper;

    public int insert(int userId){
        pointMapper.alterPointTable();
        Point point = new Point();
        point.setDeficitvalue(0);
        point.setObtainvalue(0);
        point.setuId(userId);
        int res = pointMapper.insert(point);
        return res;
    }

    public Point selectByUserId(Integer userId){
        Point point = pointMapper.selectByUserId(userId);
        return point;
    }

    public int updateByUserId(Integer ownuserId,Integer obtainuserId,Integer taskId){
        Point ownpoint = pointMapper.selectByUserId(ownuserId);
        PointUnit pointUnit = pointUnitMapper.selectBytaskId(taskId);
        int ownvalue = pointUnit.getPointunit();
        int laterownvalue = ownpoint.getDeficitvalue() + ownvalue;
        ownpoint.setDeficitvalue(laterownvalue);
        int res = pointMapper.updateownByPrimaryKey(ownpoint);
        if(res<0){
            return res;
        }
        Point obtainpoint = pointMapper.selectByUserId(obtainuserId);
        int laterobtainvalue = obtainpoint.getObtainvalue() + ownvalue;
        obtainpoint.setObtainvalue(laterobtainvalue);
        int res2 = pointMapper.updateobtainByPrimaryKey(obtainpoint);
        return res2;
    }
}
