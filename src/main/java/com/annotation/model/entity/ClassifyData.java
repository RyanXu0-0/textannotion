package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/18.
 */
public class ClassifyData {

    private String docName;
    private int paraIndex;
    private String paraContent;
    private List<Map<String,Object>> classifyContent;

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

    public List<Map<String, Object>> getClassifyContent() {
        return classifyContent;
    }

    public void setClassifyContent(List<Map<String, Object>> classifyContent) {
        this.classifyContent = classifyContent;
    }
}
