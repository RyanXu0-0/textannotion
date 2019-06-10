package com.annotation.model;

public class Paragraph {
    private Integer pid;

    private String paracontent;

    private Integer paraindex;

    private Integer documentId;

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
}