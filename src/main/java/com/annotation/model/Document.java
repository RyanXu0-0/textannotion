package com.annotation.model;

public class Document {
    private Integer did;
    private String filename;
    private String filetype;
    private Integer filesize;
    private String relativepath;
    private String absolutepath;
    private String docuploadtime;
    private Integer userId;

    public Integer getDid() {
        return did;
    }
    public void setDid(Integer did) {
        this.did = did;
    }

    public String getFilename() {
        return filename;
    }
    public void setFilename(String filename) {
        this.filename = filename == null ? null : filename.trim();
    }

    public String getFiletype() {
        return filetype;
    }
    public void setFiletype(String filetype) {
        this.filetype = filetype == null ? null : filetype.trim();
    }

    public Integer getFilesize() {
        return filesize;
    }
    public void setFilesize(Integer filesize) {
        this.filesize = filesize;
    }

    public String getRelativepath() {
        return relativepath;
    }
    public void setRelativepath(String relativepath) {
        this.relativepath = relativepath == null ? null : relativepath.trim();
    }

    public String getAbsolutepath() {
        return absolutepath;
    }
    public void setAbsolutepath(String absolutepath) {
        this.absolutepath = absolutepath == null ? null : absolutepath.trim();
    }

    public String getDocuploadtime() {
        return docuploadtime;
    }
    public void setDocuploadtime(String docuploadtime) {
        this.docuploadtime = docuploadtime == null ? null : docuploadtime.trim();
    }

    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

//    private String docstatus;
//    public String getDocstatus(){return docstatus;}
//    public void setDocstatus(String docstatus){this.docstatus=docstatus;}
}