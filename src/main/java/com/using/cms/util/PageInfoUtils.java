package com.using.cms.util;

import com.github.pagehelper.PageInfo;

public class PageInfoUtils {

    public static <T> PageResult<T> convert(PageInfo<T> pageInfo){

        PageResult<T> pageResult = new PageResult<>();
        pageResult.setDataList(pageInfo.getList());
        pageResult.setTotalCount(pageInfo.getTotal());
        pageResult.setPageSize(pageInfo.getSize());
        pageResult.setPageIndex(pageInfo.getPages());
        return pageResult;
    }
}
