package com.annotation.model;

public class Item {
    private Integer itid;

    private String itemcontent;

    private Integer itemindex;

    private Integer instanceId;

    private Integer labelnum;

    public Integer getItid() {
        return itid;
    }

    public void setItid(Integer itid) {
        this.itid = itid;
    }

    public String getItemcontent() {
        return itemcontent;
    }

    public void setItemcontent(String itemcontent) {
        this.itemcontent = itemcontent == null ? null : itemcontent.trim();
    }

    public Integer getItemindex() {
        return itemindex;
    }

    public void setItemindex(Integer itemindex) {
        this.itemindex = itemindex;
    }

    public Integer getInstanceId() {
        return instanceId;
    }

    public void setInstanceId(Integer instanceId) {
        this.instanceId = instanceId;
    }

    public Integer getLabelnum() {
        return labelnum;
    }

    public void setLabelnum(Integer labelnum) {
        this.labelnum = labelnum;
    }
}