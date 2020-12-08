package com.using.cms.service;

import com.github.pagehelper.PageInfo;
import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Users;
import com.using.cms.bean.extra.ExtUser;

import java.util.List;
import java.util.Map;

public interface UserService {

	ExtUser getUserByName(String userName);

	ExtUser findCurrentUser();

	PageInfo<ExtUser> list(Map<String, Object> conditions);

	int insertUser(Users users) throws BusinessException;

	ExtUser selectById(int id) throws BusinessException;

	int updateUser(Users users_old) throws BusinessException;

	List<Map<String, Object>> findFunctionByUserId(Integer userId);

	int deleteById(Integer userId);
}
