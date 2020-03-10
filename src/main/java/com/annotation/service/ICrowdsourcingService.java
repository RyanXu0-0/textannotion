package com.annotation.service;

import com.annotation.model.Task;
import com.annotation.model.entity.ParagraphLabelEntity;

public interface ICrowdsourcingService {
    ParagraphLabelEntity extractionCrowdsourcing(int userId,int taskId);
    ParagraphLabelEntity extractionFirsttask(Task task, int userId);
}
