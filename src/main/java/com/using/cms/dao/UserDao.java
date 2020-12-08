package com.using.cms.dao;

import com.using.cms.bean.Users;
import com.using.cms.bean.extra.ExtUser;

import java.util.List;
import java.util.Map;
public interface UserDao {

	ExtUser selectByUserName(String userName);

	List<ExtUser> listByMap(Map<String, Object> conditions);

	List<Users> queryMasterByOrgId(int orgId);

	int insert(Users user);

	ExtUser selectByUserId(int id);

	int update(Users user);

	int deleteById(Integer userId);

	int deleteByKey(Integer userId);
}
