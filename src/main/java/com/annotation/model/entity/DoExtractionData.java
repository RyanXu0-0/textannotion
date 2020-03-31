package com.annotation.model.entity;

import com.annotation.model.entity.Entity;
import com.annotation.model.entity.Relation;

import java.util.List;

public class DoExtractionData {
    int userId;
    int taskId;
    int subtaskId;
    List<Entity> entities;
    List<Relation> relations;


    public int getSubtaskId() {
        return subtaskId;
    }

    public void setSubtaskId(int subtaskId) {
        this.subtaskId = subtaskId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

    public List<Entity> getEntities() {
        return entities;
    }

    public void setEntities(List<Entity> entities) {
        this.entities = entities;
    }

    public List<Relation> getRelations() {
        return relations;
    }

    public void setRelations(List<Relation> relations) {
        this.relations = relations;
    }

    @Override
    public String toString() {
        return "ExtractionData{" +
                "userId=" + userId +
                ", taskId=" + taskId +
                ", entities=" + entities +
                ", relations=" + relations +
                '}';
    }
}
