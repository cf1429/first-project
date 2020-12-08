package com.using.cms.service.impl;

import com.using.cms.bean.Function;
import com.using.cms.bean.UserFunction;
import com.using.cms.dao.UserFunctionDao;
import com.using.cms.service.UserFunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class UserFunctionServiceImpl implements UserFunctionService {

    @Autowired
    private UserFunctionDao userFunctionDao;


    @Override
    public int updateListById(List<UserFunction> functionList) {
        return userFunctionDao.updateListById(functionList);
    }
}
