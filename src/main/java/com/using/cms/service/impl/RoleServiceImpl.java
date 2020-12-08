package com.using.cms.service.impl;

import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Function;
import com.using.cms.bean.Role;
import com.using.cms.bean.UserFunction;
import com.using.cms.dao.FunctionDao;
import com.using.cms.dao.RoleDao;
import com.using.cms.dao.UserFunctionDao;
import com.using.cms.service.RoleService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@Transactional
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;
    @Autowired
    private FunctionDao functionDao;
    @Autowired
    private UserFunctionDao roleFunctionDao;


    @Override
    public Role selectRoleById(int roleId) throws BusinessException {
        return roleDao.selectById(roleId);
    }

    /**
     * 查询角色对应权限（只返回角色拥有的权限）
     * @param roleId
     *
     */
    @Override
    public List<Function> queryFunctionByRoleId(int roleId) throws BusinessException {
        List<Function> funcList = functionDao.selectFunctionByRoleId(roleId);
        return funcList;
    }

    /**
     * 查询用户对应权限（只返回用户拥有的权限）
     * @param userId
     *
     */
    @Override
    public List<Function> queryFunctionByUserId(int userId) throws BusinessException {
        List<Function> funcList = functionDao.selectFunctionByUserId(userId);
        return funcList;
    }

    @Override
    public int insertRole(Role role, String functionIds) throws BusinessException{
        role.setState(1);
        int res = roleDao.insert(role);
        int res2=0;
        if(!StringUtils.isBlank(functionIds)) {
            List<UserFunction> list = new ArrayList<>();
            String[] funcArry=functionIds.split(",");
            for(int i=0;i<funcArry.length;i++) {
                UserFunction roleFunc = new UserFunction();
                roleFunc.setFunctionId(Integer.parseInt(funcArry[i]));
//                roleFunc.setRoleId(role.getId());
                list.add(roleFunc);
            }
            res2 = roleFunctionDao.insertBatch(list);
        }
        return res+res2;
    }

    @Override
    public int updateRole(Role role, String functionIds) throws BusinessException{
        int res =0;
        //权限配置
        if(!StringUtils.isBlank(functionIds)) {
            roleFunctionDao.deleteByRoleId(role.getId());
            List<UserFunction> list = new ArrayList<>();
            String[] funcArry=functionIds.split(",");
            for(int i=0;i<funcArry.length;i++) {
                UserFunction roleFunc = new UserFunction();
                roleFunc.setFunctionId(Integer.parseInt(funcArry[i]));
//                roleFunc.setRoleId(role.getId());
                list.add(roleFunc);
            }
            res = roleFunctionDao.insertBatch(list);
        }else {
            //角色修改
            res = roleDao.update(role);
        }
        return res;
    }

    /**
     * 查询角色对应权限（返回系统所有权限，该角色拥有的权限flag为1，修改角色信息时反选功能使用）
     * @param roleId
     *
     */
    @Override
    public List<Function> selectFunctionByRoleId(int roleId) throws BusinessException {
        List<Function> funcList = functionDao.selectFunctionByRoleId(roleId);
        Map<String, Object> conditions  = new HashMap<>();
        conditions.put("state", 1);
        List<Function> funcListAll = functionDao.listByMap(conditions);
        //标识已有资源
        for(Function func:funcListAll) {
            for(Function funcRole:funcList) {
                if(func.getId()==funcRole.getId()) {
                    func.setFlag("1");
                }
            }
        }
        return funcListAll;
    }

}
