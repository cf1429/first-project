package com.using.cms.bean;

import java.util.Date;

public class ContentInfo {
    private Integer id;
    private Integer categoryId;
    private String title;
    private Integer coverFileId;
    private String editorCharge;
    private Integer browseNumber;
    private Integer sort;
    private String sumInfo;
    private String dataSource;
    private byte contentSource;
    private byte state;
    private byte type;
    private Date releaseTime;
    private Date createTime;
    private Date updateTime;
    private String content;
    private String bannerLink;
    private Integer fileId;
    private Date topTime;
    private Integer topFlag;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getCoverFileId() {
        return coverFileId;
    }

    public void setCoverFileId(Integer coverFileId) {
        this.coverFileId = coverFileId;
    }

    public String getEditorCharge() {
        return editorCharge;
    }

    public void setEditorCharge(String editorCharge) {
        this.editorCharge = editorCharge;
    }

    public Integer getBrowseNumber() {
        return browseNumber;
    }

    public void setBrowseNumber(Integer browseNumber) {
        this.browseNumber = browseNumber;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getSumInfo() {
        return sumInfo;
    }

    public void setSumInfo(String sumInfo) {
        this.sumInfo = sumInfo;
    }

    public String getDataSource() {
        return dataSource;
    }

    public void setDataSource(String dataSource) {
        this.dataSource = dataSource;
    }

    public byte getContentSource() {
        return contentSource;
    }

    public void setContentSource(byte contentSource) {
        this.contentSource = contentSource;
    }

    public byte getState() {
        return state;
    }

    public void setState(byte state) {
        this.state = state;
    }

    public byte getType() {
        return type;
    }

    public void setType(byte type) {
        this.type = type;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBannerLink() {
        return bannerLink;
    }

    public void setBannerLink(String bannerLink) {
        this.bannerLink = bannerLink;
    }

    public Integer getFileId() {
        return fileId;
    }

    public void setFileId(Integer fileId) {
        this.fileId = fileId;
    }

    public Date getTopTime() {
        return topTime;
    }

    public void setTopTime(Date topTime) {
        this.topTime = topTime;
    }

    public Integer getTopFlag() {
        return topFlag;
    }

    public void setTopFlag(Integer topFlag) {
        this.topFlag = topFlag;
    }
}
