package com.annotation.model;

public class TestDocument {
    private Integer testId;
    private Integer taskId;
    private Integer documentId;

    public Integer gettestId() { return testId; }
    public void settestId(Integer testId) { this.testId = testId; }

    public Integer getTaskId() {
        return taskId;
    }
    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public Integer getDocumentId() {
        return documentId;
    }
    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }
}