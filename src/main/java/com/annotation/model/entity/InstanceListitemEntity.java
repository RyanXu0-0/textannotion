package com.annotation.model.entity;

import com.annotation.model.Listitem;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2018/12/29.
 */
public class InstanceListitemEntity {

    private Integer instid;
    private Integer instindex;
    private Integer documentId;

    private String dotime;
    private String comptime;
    private String dtstatus;

    private List<Listitem> listitems;
    private List<Map<String,Object>> alreadyDone;

    public Integer getInstid() {
        return instid;
    }
    public void setInstid(Integer instid) {
        this.instid = instid;
    }

    public Integer getInstindex() {
        return instindex;
    }
    public void setInstindex(Integer instindex) {
        this.instindex = instindex;
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

    public List<Listitem> getListitems(){
        return listitems;
    }
    public void setListitems(List<Listitem> listitems){
        this.listitems = listitems;
    }

    public List<Map<String,Object>> getAlreadyDone(){
        return alreadyDone;
    }
    public void setAlreadyDone(List<Map<String,Object>> alreadyDone){
        this.alreadyDone = alreadyDone;
    }

}
