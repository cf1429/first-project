package com.using.cms.dao;

import com.using.cms.bean.Function;

import java.util.List;
import java.util.Map;

public interface FunctionDao {
	
	int insert(Function function);
	
	int update(Function function);
	
	int deleteById(int funcId);
	
	Function selectById(int id);

	List<Function> listByMap(Map<String, Object> conditions);

	List<Function> selectChildren(int id);

	List<Function> selectParent(int pid);

	List<Function> selectFunctionByRoleId(int roleId);

	List<Function> selectFunctionByUserId(int userId);

}
