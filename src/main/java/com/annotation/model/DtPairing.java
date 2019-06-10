package com.annotation.model;

public class DtPairing {
    private Integer dtdId;

    private Integer dtId;

    private Integer aLitemid;

    private Integer bLitemid;
    private Integer goodlabel;
    private Integer badlabel;

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

    public Integer getaLitemid() {
        return aLitemid;
    }

    public void setaLitemid(Integer aLitemid) {
        this.aLitemid = aLitemid;
    }

    public Integer getbLitemid() {
        return bLitemid;
    }

    public void setbLitemid(Integer bLitemid) {
        this.bLitemid = bLitemid;
    }
}