package com.using.cms.dao;

import com.using.cms.bean.UserFunction;

import java.util.List;
import java.util.Map;

public interface UserFunctionDao {
    int insert(UserFunction role);

    int deleteByRoleId(int roleId);

    int insertBatch(List<UserFunction> list);

    List<Map<String, Object>> findFunctionByUserId(Integer userId);

    int updateListById(List<UserFunction> functionList);

    List<UserFunction> findUserFunctionByUserId(Integer userId);
}
