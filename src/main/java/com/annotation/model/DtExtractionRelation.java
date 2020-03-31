package com.annotation.model;

import com.annotation.model.entity.Relation;

public class DtExtractionRelation {
    private int dterId;
    private int taskId;
    private int subtaskId;
    private int userId;
    private String relationId;
    private String relation;
    private String headEntity;
    private String tailEntity;

    @Override
    public String toString() {
        return "DtExtractionRelation{" +
                "dterId=" + dterId +
                ", taskId=" + taskId +
                ", subtaskId=" + subtaskId +
                ", userId=" + userId +
                ", relationId='" + relationId + '\'' +
                ", relation='" + relation + '\'' +
                ", headEntity='" + headEntity + '\'' +
                ", tailEntity='" + tailEntity + '\'' +
                '}';
    }

    public int getDterId() {
        return dterId;
    }

    public void setDterId(int dterId) {
        this.dterId = dterId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
    }

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

    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getHeadEntity() {
        return headEntity;
    }

    public void setHeadEntity(String headEntity) {
        this.headEntity = headEntity;
    }

    public String getTailEntity() {
        return tailEntity;
    }

    public void setTailEntity(String tailEntity) {
        this.tailEntity = tailEntity;
    }

    public DtExtractionRelation(int taskId, int subtaskId, int userId, Relation relation) {
        this.taskId = taskId;
        this.subtaskId = subtaskId;
        this.userId = userId;
        this.relationId = relation.getRelationId();
        this.relation = relation.getRelation();
        this.headEntity = relation.getHeadEntity();
        this.tailEntity = relation.getTailEntity();
    }

    public DtExtractionRelation() {
    }
}
