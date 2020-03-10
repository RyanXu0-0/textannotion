package com.annotation.model;

public class DtExtraction {
    private Integer dteId;
    private Integer taskId;
    private Integer subtaskId;
    private Integer userId;
    private String entityId;
    private String entityName;
    private Integer startIndex;
    private Integer endIndex;
    private String entity;


    @Override
    public String toString() {
        return "DtExtraction{" +
                "dteId=" + dteId +
                ", taskId=" + taskId +
                ", subtaskId=" + subtaskId +
                ", userId=" + userId +
                ", entityId=" + entityId +
                ", entityName='" + entityName + '\'' +
                ", startIndex=" + startIndex +
                ", endIndex=" + endIndex +
                ", entity='" + entity + '\'' +
                '}';
    }

    public Integer getDteId() {
        return dteId;
    }

    public void setDteId(Integer dteId) {
        this.dteId = dteId;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getSubtaskId() {
        return subtaskId;
    }

    public void setSubtaskId(Integer subtaskId) {
        this.subtaskId = subtaskId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public Integer getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex;
    }

    public Integer getEndIndex() {
        return endIndex;
    }

    public void setEndIndex(Integer endIndex) {
        this.endIndex = endIndex;
    }

    public String getEntity() {
        return entity;
    }

    public void setEntity(String entity) {
        this.entity = entity;
    }
}