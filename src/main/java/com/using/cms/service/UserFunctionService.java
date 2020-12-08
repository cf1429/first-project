package com.using.cms.service;

import com.using.cms.bean.UserFunction;

import java.util.List;

public interface UserFunctionService {
    /**
     * 批量修改权限配置
     * @param functionList
     * @return
     */
    int updateListById(List<UserFunction> functionList);
}
