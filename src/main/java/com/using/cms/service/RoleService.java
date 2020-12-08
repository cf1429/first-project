package com.using.cms.service;

import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Function;
import com.using.cms.bean.Role;

import java.util.List;

public interface RoleService {

	Role selectRoleById(int roleId) throws BusinessException;

	List<Function> queryFunctionByRoleId(int roleId) throws BusinessException;

	List<Function> queryFunctionByUserId(int userId) throws BusinessException;

	int insertRole(Role role, String functionIds) throws BusinessException;

	int updateRole(Role role, String functionIds) throws BusinessException;

	List<Function> selectFunctionByRoleId(int roleId) throws BusinessException;

}
