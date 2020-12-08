package com.using.cms.controller;

import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Category;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.bean.extra.ExtraCategory;
import com.using.cms.service.CategoryService;
import com.using.cms.service.UserService;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = { "/cms/category", "/api/cms/category" })
public class CategoryController {

    public static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

    @Autowired
    private UserService usersService;
    @Autowired
    private CategoryService categoryService;

    /**
     * 类别列表
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "list")
    public JsonResult<List<Category>> list(
            @RequestParam(required = true) Integer type,
            @RequestParam(required = true) Integer pageNum,
            @RequestParam(required = true) Integer pageSize
    ) throws BusinessException {
        JsonResult<List<Category>> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        Map<String,Object> conditions = new HashMap<>();
        conditions.put("type", type);
        conditions.put("pageNum",pageNum);
        conditions.put("pageSize",pageSize);
        List<Category> categories = categoryService.selectListByMap(conditions);
        jsonResult.setSuccessData(categories);
        return jsonResult;
    }

    /**
     * 类别列表
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "cateGoryContentInfolist")
    public JsonResult<List<ExtraCategory>> list(
            @RequestParam("type") Integer type
    ) throws BusinessException {
        JsonResult<List<ExtraCategory>> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
//        if (curUser == null) {
//            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
//        }
        Map<String,Object> param = new HashMap<>();
        param.put("type",type);
        List<ExtraCategory> extraCategories = categoryService.selectCategoryContentInfoList(param);
        jsonResult.setSuccessData(extraCategories);
        return jsonResult;
    }


    /**
     * 新增类别
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "add/{operationType}")
    public JsonResult<Object> add(Category category, @PathVariable(name = "operationType")  Integer operationType) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }

        if(StringUtils.isEmpty(category.getName())){
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"类别名称不可为空");
        }

        Category seletOne = categoryService.selectOne(category);
        if(null != seletOne){
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"已存在该类别");
        }

        switch (operationType){
            case 1:
                if(null == category.getType()){
                    throw new BusinessException(ErrorEnum.ERROR_PARAM,"类别类型不可为空");
                }
                categoryService.insert(category);
                break;
            case 2:
                categoryService.update(category);
                break;
            default:
                throw new BusinessException(ErrorEnum.ERROR_SYSTEM,"操作类型{operationType}有误");
        }
        jsonResult.setSuccessData("");
        return jsonResult;
    }


    /**
     * 类别列表
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "delete")
    public JsonResult<Object> delete(
            @RequestParam(required = true) Integer id
    ) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        try {
            //删除前需确定子集下是否有数据

            int delete = categoryService.delete(id);
            jsonResult.setSuccessData(delete);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonResult;
    }
}
