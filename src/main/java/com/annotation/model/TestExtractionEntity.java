package com.annotation.model;

public class TestExtractionEntity {
    private Integer subtaskId;
    private Integer taskId;
    private String entityId;
    private String entityName;
    private Integer startIndex;
    private Integer endIndex;
    private String entity;

    public TestExtractionEntity(Integer subtaskId, Integer taskId, String entityId, String entityName, Integer startIndex, Integer endIndex, String entity) {
        this.subtaskId = subtaskId;
        this.taskId = taskId;
        this.entityId = entityId;
        this.entityName = entityName;
        this.startIndex = startIndex;
        this.endIndex = endIndex;
        this.entity = entity;
    }

    @Override
    public String toString() {
        return "TestExtractionEntity{" +
                "subtaskId=" + subtaskId +
                ", taskId=" + taskId +
                ", entityId='" + entityId + '\'' +
                ", entityName='" + entityName + '\'' +
                ", startIndex=" + startIndex +
                ", endIndex=" + endIndex +
                ", entity='" + entity + '\'' +
                '}';
    }

    public TestExtractionEntity() {
    }

    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public Integer getSubtaskId() {
        return subtaskId;
    }

    public void setSubtaskId(Integer subtaskId) {
        this.subtaskId = subtaskId;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getEntityId() {
        return entityId;
    }

    public void setEntityId(String entityId) {
        this.entityId = entityId;
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