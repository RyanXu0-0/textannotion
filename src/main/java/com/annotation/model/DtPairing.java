package com.annotation.model;

public class DtPairing {
    private Integer dtdId;

    private Integer taskId;
    private Integer subtaskId;
    private Integer userId;

    private Integer aLitemid;
    private Integer bLitemid;
    private Integer goodlabel;
    private Integer badlabel;

    public Integer getGoodlabel() {
        return goodlabel;
    }

    public void setGoodlabel(Integer goodlabel) {
        this.goodlabel = goodlabel;
    }

    public Integer getBadlabel() {
        return badlabel;
    }

    public void setBadlabel(Integer badlabel) {
        this.badlabel = badlabel;
    }

    public Integer getDtdId() {
        return dtdId;
    }

    public void setDtdId(Integer dtdId) {
        this.dtdId = dtdId;
    }

    public Integer getaLitemid() {
        return aLitemid;
    }

    public void setaLitemid(Integer aLitemid) {
        this.aLitemid = aLitemid;
    }

    public Integer getbLitemid() {
        return bLitemid;
    }

    public void setbLitemid(Integer bLitemid) {
        this.bLitemid = bLitemid;
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