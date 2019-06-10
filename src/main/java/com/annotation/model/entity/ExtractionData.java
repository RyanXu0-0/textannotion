package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/18.
 */
public class ExtractionData {

    private String docName;
    private int paraIndex;
    private String  labelName;
    private String subContent;
    private int labelNum;

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

    public String getLabelName() {
        return labelName;
    }

    public void setLabelName(String labelName) {
        this.labelName = labelName;
    }

    public String getSubContent() {
        return subContent;
    }

    public void setSubContent(String subContent) {
        this.subContent = subContent;
    }

    public int getLabelNum() {
        return labelNum;
    }

    public void setLabelNum(int labelNum) {
        this.labelNum = labelNum;
    }
}
