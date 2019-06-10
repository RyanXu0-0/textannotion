package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/3/26.
 */
public class LabelCountEntity {
//    private int label_id;
//    private int labelNum;
    private int paragraph_id;
    private List<Map<String,Object>> labelCl;

//    public int getLabel_id() {
//        return label_id;
//    }
//
//    public void setLabel_id(int label_id) {
//        this.label_id = label_id;
//    }
//
//    public int getLabelNum() {
//        return labelNum;
//    }
//
//    public void setLabelNum(int labelNum) {
//        this.labelNum = labelNum;
//    }

    public int getParagraph_id() {
        return paragraph_id;
    }

    public void setParagraph_id(int paragraph_id) {
        this.paragraph_id = paragraph_id;
    }

    public List<Map<String, Object>> getLabelCl() {
        return labelCl;
    }

    public void setLabelCl(List<Map<String, Object>> labelCl) {
        this.labelCl = labelCl;
    }
}
