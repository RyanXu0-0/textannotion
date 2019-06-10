package com.annotation.model;

public class DtRelation {
    private Integer dtdId;

    private Integer dtId;

    private String labeltype;

    private Integer labelId;

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

    public String getLabeltype() {
        return labeltype;
    }

    public void setLabeltype(String labeltype) {
        this.labeltype = labeltype == null ? null : labeltype.trim();
    }

    public Integer getLabelId() {
        return labelId;
    }

    public void setLabelId(Integer labelId) {
        this.labelId = labelId;
    }
}