package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/1/7.
 */
public class ParagraphLabelEntity {
    private Integer pid;
    private String paracontent;
    private Integer paraindex;
    private Integer documentId;

    private String dotime;
    private String comptime;
    private String dtstatus;

    //已经做了的标签
    private List<Map<String,Object>> alreadyDone;

    public Integer getPid() {
        return pid;
    }
    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getParacontent() {
        return paracontent;
    }
    public void setParacontent(String paracontent) {
        this.paracontent = paracontent == null ? null : paracontent.trim();
    }

    public Integer getParaindex() {
        return paraindex;
    }
    public void setParaindex(Integer paraindex) {
        this.paraindex = paraindex;
    }

    public Integer getDocumentId() {
        return documentId;
    }
    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public String getDotime() {
        return dotime;
    }
    public void setDotime(String dotime) {
        this.dotime = dotime == null ? null : dotime.trim();
    }

    public String getComptime() {
        return comptime;
    }
    public void setComptime(String comptime) {
        this.comptime = comptime == null ? null : comptime.trim();
    }

    public String getDtstatus() {
        return dtstatus;
    }
    public void setDtstatus(String dtstatus) {
        this.dtstatus = dtstatus == null ? null : dtstatus.trim();
    }

    public List<Map<String,Object>> getAlreadyDone(){
        return alreadyDone;
    }
    public void setAlreadyDone(List<Map<String,Object>> alreadyDone){
        this.alreadyDone = alreadyDone;
    }

}
