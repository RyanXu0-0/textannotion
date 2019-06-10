package com.annotation.model;

public class Task {
    private Integer tid;
    private String title;
    private String description;
    private String typeName;
    private String createtime;
    private String deadline;
    private String taskcompstatus;
    private String otherinfo;
    private Integer userId;
    private Integer viewnum;
    private Integer attendnum;

    public Integer getTid() {
        return tid;
    }
    public void setTid(Integer tid) {
        this.tid = tid;
    }

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

    public String getTypeName() {
        return typeName;
    }
    public void setTypeName(String typeName) {
        this.typeName = typeName == null ? null : typeName.trim();
    }

    public String getCreatetime() {
        return createtime;
    }
    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }

    public String getDeadline() {
        return deadline;
    }
    public void setDeadline(String deadline) {
        this.deadline = deadline == null ? null : deadline.trim();
    }

    public String getTaskcompstatus() {
        return taskcompstatus;
    }
    public void setTaskcompstatus(String taskcompstatus) {
        this.taskcompstatus = taskcompstatus == null ? null : taskcompstatus.trim();
    }

    public String getOtherinfo() {
        return otherinfo;
    }
    public void setOtherinfo(String otherinfo) {
        this.otherinfo = otherinfo == null ? null : otherinfo.trim();
    }

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
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


    private String pubUserName;
    public String getPubUserName(){return pubUserName;}
    public void setPubUserName(String pubUserName){
        this.pubUserName=pubUserName;
    }
}