package com.annotation.model.entity;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/20.
 */
public class SortingData {
    private int docId;
    private String docName;
    private int instanceIndex;
    private String itemContent;
    private int itemId;

    private int preIndex;
    private List<Map<String,Object>> sortingContent;//具体内容，导出

    public List<Map<String, Object>> getSortingContent() {
        return sortingContent;
    }

    public void setSortingContent(List<Map<String, Object>> sortingContent) {
        this.sortingContent = sortingContent;
    }

    //    private int newIndex;
//    private int newNum;

    public int getPreIndex() {
        return preIndex;
    }

    public void setPreIndex(int preIndex) {
        this.preIndex = preIndex;
    }

//    public int getNewNum() {
//        return newNum;
//    }
//
//    public void setNewNum(int newNum) {
//        this.newNum = newNum;
//    }

    public int getDocId() {
        return docId;
    }

    public void setDocId(int docId) {
        this.docId = docId;
    }

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

    public String getItemContent() {
        return itemContent;
    }

    public void setItemContent(String itemContent) {
        this.itemContent = itemContent;
    }

    public int getItemId() {
        return itemId;
    }

    public void setItemId(int itemId) {
        this.itemId = itemId;
    }

//    public int getNewIndex() {
//        return newIndex;
//    }
//
//    public void setNewIndex(int newIndex) {
//        this.newIndex = newIndex;
//    }
}
