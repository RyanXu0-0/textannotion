package com.annotation.model.entity.resHandle;

import java.util.List;
import java.util.Map;

/**
 * Created by twinkleStar on 2019/4/20.
 */
public class ResSortingData {
//    private int docId;
//    private String docName;
//    private int instanceIndex;
    private String itemContent;
//    private int itemId;
    private int preIndex;

    private List<Map<String,Object>> newSorting;//具体内容，导出

    public List<Map<String, Object>> getNewSorting() {
        return newSorting;
    }

    public void setNewSorting(List<Map<String, Object>> newSorting) {
        this.newSorting = newSorting;
    }

    public int getPreIndex() {
        return preIndex;
    }

    public void setPreIndex(int preIndex) {
        this.preIndex = preIndex;
    }



//    public int getDocId() {
//        return docId;
//    }
//
//    public void setDocId(int docId) {
//        this.docId = docId;
//    }
//
//    public String getDocName() {
//        return docName;
//    }
//
//    public void setDocName(String docName) {
//        this.docName = docName;
//    }
//
//    public int getInstanceIndex() {
//        return instanceIndex;
//    }
//
//    public void setInstanceIndex(int instanceIndex) {
//        this.instanceIndex = instanceIndex;
//    }

    public String getItemContent() {
        return itemContent;
    }

    public void setItemContent(String itemContent) {
        this.itemContent = itemContent;
    }

//    public int getItemId() {
//        return itemId;
//    }
//
//    public void setItemId(int itemId) {
//        this.itemId = itemId;
//    }


}
