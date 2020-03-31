package com.annotation.model.entity;

public class Relation {
    String relationId;
    String relation;
    String headEntity;
    String tailEntity;

    @Override
    public String toString() {
        return "Relation{" +
                "relationId=" + relationId +
                ", relation='" + relation + '\'' +
                ", headEntity='" + headEntity + '\'' +
                ", tailEntity='" + tailEntity + '\'' +
                '}';
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

    public String getHeadEntity() {
        return headEntity;
    }

    public void setHeadEntity(String headEntity) {
        this.headEntity = headEntity;
    }

    public String getTailEntity() {
        return tailEntity;
    }

    public void setTailEntity(String tailEntity) {
        this.tailEntity = tailEntity;
    }
}
