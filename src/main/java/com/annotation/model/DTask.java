package com.annotation.model;

public class DTask {
    private Integer tkid;
    private Integer userId;
    private Integer taskId;
    private String dotime;
    private String dcomptime;
    private String dstatus;
    private String dpercent;
    private Integer alreadypart;
    private Integer totalpart;

    public Integer getTkid() {
        return tkid;
    }
    public void setTkid(Integer tkid) {
        this.tkid = tkid;
    }

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTaskId() {
        return taskId;
    }
    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getDotime() {
        return dotime;
    }
    public void setDotime(String dotime) {
        this.dotime = dotime == null ? null : dotime.trim();
    }

    public String getDcomptime() {
        return dcomptime;
    }
    public void setDcomptime(String dcomptime) {
        this.dcomptime = dcomptime == null ? null : dcomptime.trim();
    }

    public String getDstatus() {
        return dstatus;
    }
    public void setDstatus(String dstatus) {
        this.dstatus = dstatus == null ? null : dstatus.trim();
    }

    public String getDpercent() {
        return dpercent;
    }
    public void setDpercent(String dpercent) {
        this.dpercent = dpercent == null ? null : dpercent.trim();
    }

    private String doUserName;
    public String getDoUserName(){return doUserName;}
    public void setDoUserName(String doUserName){
        this.doUserName=doUserName;
    }

    private String typeName;
    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public Integer getAlreadypart() {
        return alreadypart;
    }
    public void setAlreadypart(Integer alreadypart) {
        this.alreadypart = alreadypart;
    }

    public Integer getTotalpart() {
        return totalpart;
    }
    public void setTotalpart(Integer totalpart) {
        this.totalpart = totalpart;
    }



    private String title;
    private String description;
    private String deadline;
    private String otherinfo;
    private Integer viewnum;
    private Integer attendnum;

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getDeadline() {
        return deadline;
    }
    public void setDeadline(String deadline) {
        this.deadline = deadline == null ? null : deadline.trim();
    }

    public String getOtherinfo() {
        return otherinfo;
    }
    public void setOtherinfo(String otherinfo) {
        this.otherinfo = otherinfo == null ? null : otherinfo.trim();
    }

    public Integer getViewnum() {
        return viewnum;
    }
    public void setViewnum(Integer viewnum) {
        this.viewnum = viewnum;
    }

    public Integer getAttendnum() {
        return attendnum;
    }
    public void setAttendnum(Integer attendnum) {
        this.attendnum = attendnum;
    }



}