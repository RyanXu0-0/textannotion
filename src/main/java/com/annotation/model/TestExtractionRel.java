package com.annotation.model;

public class TestExtractionRel {
    private Integer subtaskId;
    private Integer taskId;
    private String relationId;
    private String  relation;
    private String headentity;
    private String tailentity;

    public TestExtractionRel(Integer taskId, Integer subtaskId, String relationId, String relation, String headentity, String tailentity) {
        this.subtaskId = subtaskId;
        this.taskId = taskId;
        this.relationId = relationId;
        this.relation = relation;
        this.headentity = headentity;
        this.tailentity = tailentity;
    }

    @Override
    public String toString() {
        return "TestExtractionRel{" +
                "subtaskId=" + subtaskId +
                ", taskId=" + taskId +
                ", relationId='" + relationId + '\'' +
                ", relation='" + relation + '\'' +
                ", headentity='" + headentity + '\'' +
                ", tailentity='" + tailentity + '\'' +
                '}';
    }

    public  TestExtractionRel(){}
    public Integer getSubtaskId() {
        return subtaskId;
    }

    public void setSubtaskId(Integer subtaskId) {
        this.subtaskId = subtaskId;
    }

    public Integer getTaskId() {
        return taskId;
    }

    public void setTaskId(Integer taskId) {
        this.taskId = taskId;
    }

    public String getRelationId() {
        return relationId;
    }

    public void setRelationId(String relationId) {
        this.relationId = relationId;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getHeadentity() {
        return headentity;
    }

    public void setHeadentity(String headentity) {
        this.headentity = headentity;
    }

    public String getTailentity() {
        return tailentity;
    }

    public void setTailentity(String tailentity) {
        this.tailentity = tailentity;
    }
}