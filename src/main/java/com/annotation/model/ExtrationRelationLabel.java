package com.annotation.model;

public class ExtrationRelationLabel {
    private int relaId;
    private int taskId;
    private String relation;
    private String headEntity;
    private String tailEntity;

    public int getRelaId() {
        return relaId;
    }

    public void setRelaId(int relaId) {
        this.relaId = relaId;
    }

    public int getTaskId() {
        return taskId;
    }

    public void setTaskId(int taskId) {
        this.taskId = taskId;
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
}
