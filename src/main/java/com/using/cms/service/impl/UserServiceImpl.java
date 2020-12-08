package com.using.cms.service.impl;


import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Role;
import com.using.cms.bean.UserFunction;
import com.using.cms.bean.Users;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.controller.LoginController;
import com.using.cms.dao.RoleDao;
import com.using.cms.dao.UserDao;
import com.using.cms.dao.UserFunctionDao;
import com.using.cms.service.UserService;

import com.using.cms.util.CacheConstant;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.RequestUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;
    @Resource
    private StringRedisTemplate stringRedisTemplate;
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private UserFunctionDao userFunctionDao;

    @Override
    public ExtUser getUserByName(String userName) {
        return userDao.selectByUserName(userName);
    }

    //查询当前登录人
    @Override
    public ExtUser findCurrentUser() {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        String token = RequestUtils.getCookieValue(request, LoginController.TOKEN_COOKIE_NAME);
        if(StringUtils.isEmpty(token)) {
            return null;
        }
        Boolean hasKey = stringRedisTemplate.hasKey(token);
        ExtUser extraUsers = null;
        if(hasKey) {
            Object data = stringRedisTemplate.opsForHash().get(token, CacheConstant.EXTRAUSERS);
            extraUsers = JSONObject.parseObject(data.toString(), ExtUser.class);
        }
        return extraUsers;
    }

    @Override
    public PageInfo<ExtUser> list(Map<String, Object> conditions) {
        PageHelper.startPage(Integer.parseInt(conditions.get("pageNum").toString()), Integer.parseInt(conditions.get("pageSize").toString()));
        List<ExtUser> list = userDao.listByMap(conditions);
        PageInfo<ExtUser> pageInfo = new PageInfo<>(list);
        return pageInfo;
    }

    @Override
    public int insertUser(Users user) throws BusinessException {
        user.setPassword(new Md5Hash(user.getUserName(), user.getPassword()).toString());
        Role role = roleDao.selectById(user.getRoleId());
        if(role==null) {
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"角色不能为空");
        }
        if(0 == user.getState()) {
            user.setState(1);
        }
        if(role.getType().equals("1")) {
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"管理员已存在！");
        }
        user.setIsmaster(2);
        userDao.insert(user);

        List<UserFunction> userFunctionList = new ArrayList<>();
        //配置权限
        for (int i = 1; i < 5; i++){
            UserFunction uf = new UserFunction();
            uf.setUserId(user.getId());
            uf.setFunctionId(i+1);
            uf.setState(0);
            userFunctionList.add(uf);
        }

        return userFunctionDao.insertBatch(userFunctionList);
    }

    @Override
    public ExtUser selectById(int id) throws BusinessException {
        ExtUser user = userDao.selectByUserId(id);
        return user;
    }

    @Override
    public int updateUser(Users user) throws BusinessException {
        ExtUser ext = userDao.selectByUserId(user.getId());
        int roleId = user.getRoleId();
        if(roleId==0){
            roleId = ext.getRoleId();
        }

        Role role = roleDao.selectById(roleId);
        if(role!=null) {
//            if(role.getType().equals("1")) {
//                throw new BusinessException(ErrorEnum.ERROR_PARAM,"每个公司只能启用一个管理员，该公司管理员已存在！");
//            }else {
//                user.setIsmaster(2);
//            }

            if(role.getType().equals("2")) {
                user.setIsmaster(2);
            }
        }
        return userDao.update(user);
    }


    @Override
    public List<Map<String, Object>> findFunctionByUserId(Integer userId) {
        return userFunctionDao.findFunctionByUserId(userId);
    }

    @Override
    public int deleteById(Integer userId) {

        List<UserFunction> userFunctionByUserId = userFunctionDao.findUserFunctionByUserId(userId);
        if(userFunctionByUserId != null && userFunctionByUserId.size()>0){
            return  userDao.deleteById(userId);
        }else{
            return userDao.deleteByKey(userId);
        }
    }
}
