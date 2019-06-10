package com.annotation.model;

public class Listitem {
    private Integer ltid;

    private String litemcontent;

    private Integer listIndex;

    private Integer litemindex;

    private Integer instanceId;

    public Integer getLtid() {
        return ltid;
    }

    public void setLtid(Integer ltid) {
        this.ltid = ltid;
    }

    public String getLitemcontent() {
        return litemcontent;
    }

    public void setLitemcontent(String litemcontent) {
        this.litemcontent = litemcontent == null ? null : litemcontent.trim();
    }

    public Integer getListIndex() {
        return listIndex;
    }

    public void setListIndex(Integer listIndex) {
        this.listIndex = listIndex;
    }

    public Integer getLitemindex() {
        return litemindex;
    }

    public void setLitemindex(Integer litemindex) {
        this.litemindex = litemindex;
    }

    public Integer getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(Integer instanceId) {
        this.instanceId = instanceId;
    }
}