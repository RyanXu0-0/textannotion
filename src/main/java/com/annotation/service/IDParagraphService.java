package com.annotation.service;

import org.springframework.transaction.annotation.Transactional;

/**
 * Created by twinkleStar on 2019/2/6.
 */
public interface IDParagraphService {

    int addDParagraph(int dTaskId,int docId,int paraId);

    @Transactional
    int updateStatusByDocId(int userId,int docId,int taskId);

    int updateStatus(int userId,int docId,int taskId,int paraId);
}
