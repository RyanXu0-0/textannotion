package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/18.
 */
public class ExtractionData {

    private String docName;
    private int paraIndex;
    private String paraContent;
    private List<Map<String,Object>> entityList;
    private List<Map<String,Object>> relationList;

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public int getParaIndex() {
        return paraIndex;
    }

    public void setParaIndex(int paraIndex) {
        this.paraIndex = paraIndex;
    }

    public String getParaContent() {
        return paraContent;
    }

    public void setParaContent(String paraContent) {
        this.paraContent = paraContent;
    }

    public List<Map<String, Object>> getEntityList() {
        return entityList;
    }

    public void setEntityList(List<Map<String, Object>> entityList) {
        this.entityList = entityList;
    }

    public List<Map<String, Object>> getRelationList() {
        return relationList;
    }

    public void setRelationList(List<Map<String, Object>> relationList) {
        this.relationList = relationList;
    }
}
