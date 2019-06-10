package com.annotation.service;

import com.annotation.model.Point;
import com.annotation.model.PointUnit;

/**
 * Created by kongmin on 2019/2/8.
 */
public interface IPointUnitService {

     int insert(int pointunit,int taskId);

     PointUnit selectBytaskId(Integer taskId);
}
