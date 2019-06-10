package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/18.
 */
public class UserTaskEmail {
    private int userId;
    private String userEmail;
    private String userName;
    private List<Map<String,Object>> taskInfo;//具体内容，导出

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public List<Map<String, Object>> getTaskInfo() {
        return taskInfo;
    }

    public void setTaskInfo(List<Map<String, Object>> taskInfo) {
        this.taskInfo = taskInfo;
    }
}
