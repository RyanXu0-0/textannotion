package com.annotation.model;

//和分类、文本关系共用一个实体
public class TestExtractionData {
    private Integer dataId;
    private Integer subtaskId;
    private Integer taskId;
    private String content;
    private String label;
    private Integer documentId;

    @Override
    public String toString() {
        return "TestExtractionData{" +
                "dataId=" + dataId +
                ", subtaskId=" + subtaskId +
                ", taskId=" + taskId +
                ", content='" + content + '\'' +
                ", label='" + label + '\'' +
                ", documentId=" + documentId +
                '}';
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public Integer getDataId() {
        return dataId;
    }

    public void setDataId(Integer dataId) {
        this.dataId = dataId;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }
}