package com.using.cms.util;

import java.io.Serializable;
import java.util.List;

public class PageResult<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    /** 当前页数 */
    protected Integer pageIndex;
    /** 数据开始索引, 从0开始 */
    protected Long startIndex;
    /** 每页显示条数 */
    protected Integer pageSize;
    /** 数据总条数 */
    protected Long totalCount;
    /** 数据列表 */
    protected List<T> dataList;

    public PageResult() {

    }

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Long getStartIndex() {
        return startIndex;
    }

    public void setStartIndex(Long startIndex) {
        this.startIndex = startIndex;
    }

    public void setStartIndex(Integer startIndex) {
        this.startIndex = startIndex.longValue();
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Long getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Long totalCount) {
        this.totalCount = totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount.longValue();
    }

    public List<T> getDataList() {
        return dataList;
    }

    public void setDataList(List<T> dataList) {
        this.dataList = dataList;
    }
}
