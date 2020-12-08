package com.using.cms.controller;

import com.using.cms.auth.AuthPassport;
import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Function;
import com.using.cms.bean.Role;
import com.using.cms.bean.extra.ExtRole;
import com.using.cms.bean.extra.TreeNode;
import com.using.cms.service.FunctionService;
import com.using.cms.service.RoleService;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping(value = { "/cms/role", "/api/cms/role" })
public class RoleController {

    @Autowired
    private RoleService roleService;
    @Autowired
    private FunctionService functionService;


    /**
     * 添加
     * @param type 1.添加  2.修改
     * @param request
     * @param response
     * @return
     * @throws BusinessException
     */
//    @AuthPassport(value="ROLE_AUTH_EDIT")
    @PostMapping(value = "add/{optType}")
    public JsonResult<Integer> add(Role role, @PathVariable(name = "optType") Integer type, String functionIds,
                                   HttpServletRequest request, HttpServletResponse response) throws BusinessException {
        JsonResult<Integer> result = new JsonResult<>();
        switch (type) {
            case 1://添加
                int res = roleService.insertRole(role,functionIds);
                result.setSuccessData(res);
                break;
            case 2://修改
                int i = roleService.updateRole(role,functionIds);
                result.setSuccessData(i);
                break;

            default:
                throw new BusinessException(ErrorEnum.ERROR_PARAM, "type值有误");
        }
        result.setMessage("成功");
        return result;
    }

    /**
     * 查询角色信息以及角色对应权限信息
     * @param roleId
     * @return
     * @throws BusinessException
     */
    @PostMapping(value = "queryRoleFunc")
    public JsonResult<ExtRole> queryRoleFunc(@RequestParam(required = true)int roleId) throws Exception{
        JsonResult<ExtRole> result = new JsonResult<>();
        ExtRole ext = new ExtRole();
        Role role = roleService.selectRoleById(roleId);
        ext.setCode(role.getCode());
        ext.setContent(role.getContent());
        ext.setCreateTime(role.getCreateTime());
        ext.setCreateUser(role.getCreateUser());
        ext.setId(role.getId());
        ext.setName(role.getName());
        ext.setState(role.getState());
        ext.setType(role.getType());
        List<Function> list = roleService.selectFunctionByRoleId(roleId);
        TreeNode node = functionService.generate(list);
        ext.setTreeNode(node);
        //ext.setFuncList(list);
        result.setSuccessData(ext);
        result.setMessage("成功");
        return result;
    }
}
