package com.using.cms.controller;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageInfo;
import com.using.cms.bean.BusinessException;
import com.using.cms.bean.UserFunction;
import com.using.cms.bean.Users;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.service.UserFunctionService;
import com.using.cms.service.UserService;
import com.using.cms.util.BusinessTypeConstant;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.JsonResult;
import com.using.cms.util.PageResult;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = { "/cms/user", "/api/cms/user" })
public class UserController {

    @Autowired
    private UserService usersService;
    @Autowired
    private UserFunctionService userFunctionService;

//    @AuthPassport(value="USER_AUTH")
    @RequestMapping(value = "list")
    public Object queryUser(String name,String orgId,@RequestParam(required = true)String pageNum,
                            @RequestParam(required = false,defaultValue= BusinessTypeConstant.DEAFULT_PAGE_SIZE)String pageSize) throws BusinessException {
        JsonResult<PageResult<ExtUser>> jsonResult = new JsonResult<>();
        PageResult<ExtUser> result = new PageResult<>();
        Map<String, Object> conditions = new HashMap<>();
        ExtUser curUser = usersService.findCurrentUser();
        if(!curUser.getRoleType().equals("1")) {
            orgId = curUser.getCompanyId()+"";
        }
        conditions.put("qname",name);
        conditions.put("orgId", orgId);
        conditions.put("pageNum",pageNum);
        conditions.put("pageSize",pageSize);
        PageInfo<ExtUser> pageInfo =usersService.list(conditions);
        result.setTotalCount(pageInfo.getTotal());
        result.setPageIndex(pageInfo.getPageNum());
        result.setPageSize(pageInfo.getPageSize());
        result.setDataList(pageInfo.getList());
        jsonResult.setSuccessData(result);
        return jsonResult;
    }

    /**
     * 添加用户
     * @param users
     * @param type 1.添加  2.修改
     * @param request
     * @param response
     * @return
     * @throws BusinessException
     */
//    @AuthPassport(value="USER_AUTH_EDIT")
    @PostMapping(value = "add/{type}")
    public JsonResult<Integer> add(
            Users users,
            @PathVariable(name = "type") Integer type
    ) throws BusinessException{
        JsonResult<Integer> result = new JsonResult<>();

        ExtUser curUser =usersService.findCurrentUser();
        if(curUser==null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        int userId = curUser.getId();
        switch (type) {
            case 1://添加
                if(StringUtils.isBlank(users.getUserName())) {
                    throw new BusinessException(ErrorEnum.ERROR_PARAM, "账号不能为空！");
                }
                if(StringUtils.isBlank(users.getPassword())) {
                    throw new BusinessException(ErrorEnum.ERROR_PARAM, "密码不能为空！");
                }
                //判断该账号是否已存在
                ExtUser userList = usersService.getUserByName(users.getUserName());
                if(userList != null) {
                    result.setErrorMessage(ErrorEnum.ERROR_PARAM, "该账号已存在");
                    return result;
                }
                //添加新用户
                users.setCreateUser(userId);
                int res = usersService.insertUser(users);
                result.setSuccessData(res);
                break;
            case 2://修改密码
                ExtUser user =usersService.selectById(users.getId());
                if(user == null) {
                    result.setErrorMessage(ErrorEnum.ERROR_PARAM, "该账号不存在");
                    return result;
                }
                if(!StringUtils.isBlank(users.getPassword())){
                    users.setPassword(new Md5Hash(user.getUserName(), users.getPassword()).toString());
                }
                int i =usersService.updateUser(users);
                result.setSuccessData(i);
                break;

            default:
                throw new BusinessException(ErrorEnum.ERROR_PARAM, "type值有误");
        }
        result.setMessage("成功");
        return result;
    }

    /**
     * 用户权限列表
     * @param userId
     * @return
     * @throws BusinessException
     */
    @PostMapping(value = "function")
    public JsonResult<Object> function(Integer userId) throws BusinessException{
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser =usersService.findCurrentUser();
        if(curUser==null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        if(null == userId){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "{userId}不可为空");
        }
        List<Map<String, Object>> functionByUserId = usersService.findFunctionByUserId(userId);
        jsonResult.setSuccessData(functionByUserId);
        return jsonResult;
    }


    /**
     * 修改用户权限
     * @param jsonStr
     * @return
     * @throws BusinessException
     */
    @PostMapping(value = "editUserFunction")
    public JsonResult<Object> editUserFunction(String jsonStr) throws BusinessException{
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser =usersService.findCurrentUser();
        if(curUser==null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        if(null == jsonStr){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "{jsonStr}不可为空");
        }

        int i = 0;
        try {
            List<UserFunction> functionList = JSONArray.parseArray(jsonStr, UserFunction.class);
            i = userFunctionService.updateListById(functionList);
            jsonResult.setSuccessData(i);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonResult;
    }

    /**
     * 重置密码
     * @param userId
     * @return
     * @throws BusinessException
     */
    @PostMapping(value = "resetPassword")
    public JsonResult<Object> resetPassword(Integer userId) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        if(null == userId){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "{userId}不可为空");
        }
        ExtUser user =usersService.selectById(userId);
        if(user == null) {
            jsonResult.setErrorMessage(ErrorEnum.ERROR_PARAM, "该账号不存在");
            return jsonResult;
        }
        String randomPassword = "123456";
        System.out.println();
        user.setPassword(new Md5Hash(user.getUserName(), randomPassword).toString());
        try {
            int i = usersService.updateUser(user);
            jsonResult.setSuccessData(randomPassword);
        } catch (BusinessException e) {
            e.printStackTrace();
        }
        return jsonResult;
    }

    /**
     * 批量删除用户
     * @param userIds
     * @return
     * @throws BusinessException
     */
    @PostMapping(value = "deleteMoreUser")
    public JsonResult<Object> deleteMoreUser(String userIds) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        if(StringUtils.isBlank(userIds)){
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "{userIds}不可为空");
        }

        List<String> userIdStr = Arrays.asList(userIds.split(","));
        try {
            for (String str : userIdStr) {
                int uId = Integer.parseInt(str);
                usersService.deleteById(uId);
            }
            jsonResult.setSuccessData("");
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return jsonResult;
    }
}
