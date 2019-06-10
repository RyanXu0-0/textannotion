package com.annotation.model.entity;

import com.annotation.model.Item;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2018/12/29.
 */
public class InstanceItemEntity {


    private Integer instid;
    private Integer instindex;
    private Integer documentId;
    private Integer labelnum;

    private String dotime;
    private String comptime;
    private String dtstatus;

    private List<Item> itemList;
    private List<Map<String,Object>> alreadyDone;
//    private List<Map<String,Object>> alreadyItem1;
//    private List<Map<String,Object>> alreadyItem2;

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

    public Integer getLabelnum() {
        return labelnum;
    }
    public void setLabelnum(Integer labelnum) {
        this.labelnum = labelnum;
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

    public List<Item> getItemList(){
        return itemList;
    }
    public void setItemList(List<Item> itemList){
        this.itemList = itemList;
    }

    public List<Map<String,Object>> getAlreadyDone(){
        return alreadyDone;
    }
    public void setAlreadyDone(List<Map<String,Object>> alreadyDone){
        this.alreadyDone = alreadyDone;
    }


}
