package com.using.cms.dao;

import com.using.cms.bean.Category;
import com.using.cms.bean.extra.ExtraCategory;
import com.using.cms.bean.extra.ExtraContentInfo;

import java.util.List;
import java.util.Map;

public interface CategoryDao {
    List<Category> selectListByMap(Map<String,Object> conditions);

    List<ExtraCategory> selectCategoryContentInfoList(Map<String,Object> param);

    Category selectOne(Category category);

    int insert(Category category);

    int update(Category category);

    int delete(Integer id);
}
