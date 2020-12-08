package com.using.cms.service;

import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Function;
import com.using.cms.bean.extra.TreeNode;



import java.util.List;
import java.util.Map;

public interface FunctionService {

	int insertFunction(Function function);

	int updateFunction(Function function);

	List<Function> list(Map<String, Object> conditions);

	int delete(int id) throws BusinessException;

	TreeNode generate(List<Function> list) throws BusinessException;

}
