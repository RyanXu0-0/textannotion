package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by Ryan on 2020/3/31.
 */
public class RelationData {

    private String docName;
    private int instanceIndex;
    private List<Map<String,Object>> relationContent;
    private List<Map<String,Object>> relationLabel;

    public String getDocName() {
        return docName;
    }

    public void setDocName(String docName) {
        this.docName = docName;
    }

    public int getInstanceIndex() {
        return instanceIndex;
    }

    public void setInstanceIndex(int instanceIndex) {
        this.instanceIndex = instanceIndex;
    }

    public List<Map<String, Object>> getRelationContent() {
        return relationContent;
    }

    public void setRelationContent(List<Map<String, Object>> relationContent) {
        this.relationContent = relationContent;
    }

    public List<Map<String, Object>> getRelationLabel() {
        return relationLabel;
    }

    public void setRelationLabel(List<Map<String, Object>> relationLabel) {
        this.relationLabel = relationLabel;
    }
}
