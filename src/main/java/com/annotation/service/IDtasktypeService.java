package com.annotation.service;

import com.annotation.model.Dtasktype;

/**
 * Created by kongmin on 2019/2/8.
 */
public interface IDtasktypeService {

     int insert(int userId);

     int updateByUserId(int userId,int typeId);
}
