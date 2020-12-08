package com.using.cms.service;

import com.using.cms.bean.Category;
import com.using.cms.bean.extra.ExtraCategory;

import java.util.List;
import java.util.Map;

public interface CategoryService {

    List<Category> selectListByMap(Map<String,Object> conditions);

    List<ExtraCategory> selectCategoryContentInfoList(Map<String,Object> param);

    Category selectOne(Category category);

    int insert(Category category);

    int update(Category category);

    int delete(Integer id);

}
