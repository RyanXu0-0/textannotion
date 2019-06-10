package com.annotation.service;

import com.annotation.model.DTask;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by twinkleStar on 2019/2/8.
 */
public interface IDInstanceService {

     @Transactional
     int updateStatusByDocId(int userId,int docId,int taskId);

     int updateStatus(int userId,int docId,int taskId,int instanceId);
}
