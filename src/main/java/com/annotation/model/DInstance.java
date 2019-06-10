package com.annotation.model;

public class DInstance {
    private Integer dtid;

    private Integer documentId;

    private Integer instanceId;

    private String dotime;

    private String comptime;

    private String dtstatus;

    private Integer dtaskId;

    public Integer getDtid() {
        return dtid;
    }

    public void setDtid(Integer dtid) {
        this.dtid = dtid;
    }

    public Integer getDocumentId() {
        return documentId;
    }

    public void setDocumentId(Integer documentId) {
        this.documentId = documentId;
    }

    public Integer getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(Integer instanceId) {
        this.instanceId = instanceId;
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

    public Integer getDtaskId() {
        return dtaskId;
    }

    public void setDtaskId(Integer dtaskId) {
        this.dtaskId = dtaskId;
    }
}