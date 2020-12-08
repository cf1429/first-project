package com.using.cms.dao;

import com.using.cms.bean.Role;

public interface RoleDao {

	Role selectById(int id);

	int insert(Role role);

	int update(Role role);

}
