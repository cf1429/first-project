package com.using.cms.service.impl;

import com.github.pagehelper.PageHelper;
import com.using.cms.bean.Category;
import com.using.cms.bean.extra.ExtraCategory;
import com.using.cms.dao.CategoryDao;
import com.using.cms.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> selectListByMap(Map<String,Object> conditions) {
        PageHelper.startPage(Integer.parseInt(conditions.get("pageNum").toString()), Integer.parseInt(conditions.get("pageSize").toString()));
        return categoryDao.selectListByMap(conditions);
    }

    @Override
    public int insert(Category category) {
        return categoryDao.insert(category);
    }

    @Override
    public int update(Category category) {
        return categoryDao.update(category);
    }

    @Override
    public Category selectOne(Category category) {
        return categoryDao.selectOne(category);
    }

    @Override
    public int delete(Integer id) {
        return categoryDao.delete(id);
    }

    @Override
    public List<ExtraCategory> selectCategoryContentInfoList(Map<String,Object> param) {
        return categoryDao.selectCategoryContentInfoList(param);
    }
}
