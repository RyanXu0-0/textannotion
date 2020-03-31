package com.annotation.model;

public class UserSubtask {
    Integer utsId;
    Integer userId;
    Integer taskId;
    Integer subtaskId;
    String done;
    String dotime;

    public Integer getUtsId() {
        return utsId;
    }

    public void setUtsId(Integer utsId) {
        this.utsId = utsId;
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

    public Integer getSubtaskId() {
        return subtaskId;
    }

    public void setSubtaskId(Integer subtaskId) {
        this.subtaskId = subtaskId;
    }

    public String getDone() {
        return done;
    }

    public void setDone(String done) {
        this.done = done;
    }

    public String getDotime() {
        return dotime;
    }

    public void setDotime(String dotime) {
        this.dotime = dotime;
    }

    public UserSubtask(Integer userId, Integer taskId, Integer subtaskId, String done) {
        this.userId = userId;
        this.taskId = taskId;
        this.subtaskId = subtaskId;
        this.done = done;
    }

    public UserSubtask() {
    }
}
