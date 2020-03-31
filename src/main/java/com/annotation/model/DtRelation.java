package com.annotation.model;

public class DtRelation {
    private Integer dtdId;

    private Integer taskId;
    private Integer subtaskId;
    private Integer userId;

    private String labeltype;

    private Integer labelId;

    public Integer getDtdId() {
        return dtdId;
    }

    public void setDtdId(Integer dtdId) {
        this.dtdId = dtdId;
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
}