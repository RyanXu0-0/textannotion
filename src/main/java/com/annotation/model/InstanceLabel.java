package com.annotation.model;

public class InstanceLabel {
    private Integer taskId;

    private String labeltype;

    private Integer labelId;

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getLabeltype() {
        return labeltype;
    }

    public void setLabeltype(String labeltype) {
        this.labeltype = labeltype == null ? null : labeltype.trim();
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }
}