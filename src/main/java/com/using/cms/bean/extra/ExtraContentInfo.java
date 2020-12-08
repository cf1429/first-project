package com.using.cms.bean.extra;

import com.using.cms.bean.ContentInfo;
import com.using.cms.bean.FileUpload;

public class ExtraContentInfo extends ContentInfo {

    private FileUpload coverFile;

    private FileUpload file;

    private String categoryName;

    public FileUpload getCoverFile() {
        return coverFile;
    }

    public void setCoverFile(FileUpload coverFile) {
        this.coverFile = coverFile;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public FileUpload getFile() {
        return file;
    }

    public void setFile(FileUpload file) {
        this.file = file;
    }
}
