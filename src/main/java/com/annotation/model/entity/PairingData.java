package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/16.
 */
public class PairingData {
    private int userId;//不导出
    private String userName;//用户名，导出
    private String docName;//文档名，导出
    private int paraIndex;//段落索引，导出
    private List<Map<String,Object>> pairingContent;//具体内容，导出
//    private int a_litemid;
//    private int b_litemid;
//    private String a_litemcontent;
//    private String b_litemcontent;

    public int getUserId() {
        return userId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDocName() {
        return docName;
    }
    public void setDocName(String docName) {
        this.docName = docName;
    }

    public int getParaIndex() {
        return paraIndex;
    }
    public void setParaIndex(int paraIndex) {
        this.paraIndex = paraIndex;
    }

    public List<Map<String, Object>> getPairingContent() {
        return pairingContent;
    }
    public void setPairingContent(List<Map<String, Object>> pairingContent) {
        this.pairingContent = pairingContent;
    }


//    public int getA_litemid() {
//        return a_litemid;
//    }
//
//    public void setA_litemid(int a_litemid) {
//        this.a_litemid = a_litemid;
//    }
//
//    public int getB_litemid() {
//        return b_litemid;
//    }
//
//    public void setB_litemid(int b_litemid) {
//        this.b_litemid = b_litemid;
//    }
//
//    public String getA_litemcontent() {
//        return a_litemcontent;
//    }
//
//    public void setA_litemcontent(String a_litemcontent) {
//        this.a_litemcontent = a_litemcontent;
//    }
//
//    public String getB_litemcontent() {
//        return b_litemcontent;
//    }
//
//    public void setB_litemcontent(String b_litemcontent) {
//        this.b_litemcontent = b_litemcontent;
//    }
}
