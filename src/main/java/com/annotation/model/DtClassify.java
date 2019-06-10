package com.annotation.model;

public class DtClassify {
    private Integer dtdId;

    private Integer dtId;

    private Integer labelId;
    private Integer goodlabel;
    private Integer badlabel;

    public Integer getDtdId() {
        return dtdId;
    }

    public void setDtdId(Integer dtdId) {
        this.dtdId = dtdId;
    }

    public Integer getDtId() {
        return dtId;
    }

    public void setDtId(Integer dtId) {
        this.dtId = dtId;
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }

    public Integer getGoodlabel() {
        return goodlabel;
    }

    public void setGoodlabel(Integer goodlabel) {
        this.goodlabel = goodlabel;
    }

    public Integer getBadlabel() {
        return badlabel;
    }

    public void setBadlabel(Integer badlabel) {
        this.badlabel = badlabel;
    }
}