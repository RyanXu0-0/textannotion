package com.annotation.service;

import com.annotation.model.Dtasktype;
import com.annotation.model.Point;

/**
 * Created by kongmin on 2019/2/8.
 */
public interface IPointService {

     int insert(int userId);

     Point selectByUserId(Integer userId);

     int updateByUserId(Integer ownuserId,Integer obtainuserId,Integer taskId);
}
