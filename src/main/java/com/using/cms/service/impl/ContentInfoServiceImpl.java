package com.using.cms.service.impl;

import com.github.pagehelper.PageHelper;
import com.using.cms.bean.ContentInfo;
import com.using.cms.bean.extra.ExtraContentInfo;
import com.using.cms.dao.ContentInfoDao;
import com.using.cms.service.ContentInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.thymeleaf.util.StringUtils;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class ContentInfoServiceImpl implements ContentInfoService {

    @Autowired
    private ContentInfoDao contentInfoDao;

    @Override
    public List<ExtraContentInfo> selectByMap(Map<String,Object> param) {
        if(null != param.get("pageNum") && !StringUtils.isEmpty(param.get("pageNum").toString()) &&
           null!=param.get("pageSize") && !StringUtils.isEmpty(param.get("pageSize").toString())){
            PageHelper.startPage(Integer.parseInt(param.get("pageNum").toString()), Integer.parseInt(param.get("pageSize").toString()));
        }
        return contentInfoDao.selectByMap(param);
    }

    @Override
    public int insert(ContentInfo contentInfo) {
        return contentInfoDao.insert(contentInfo);
    }

    @Override
    public synchronized int update(ContentInfo contentInfo) {
        return contentInfoDao.update(contentInfo);
    }

    @Override
    public int delete(String ids) {
        return contentInfoDao.delete(ids);
    }

    @Override
    public List<Map<String, Object>> selectContentInfo(Map<String, Object> map) {
        return contentInfoDao.selectContentInfo(map);
    }

    @Override
    public int update2(ContentInfo contentInfo) {
        return contentInfoDao.update2(contentInfo);
    }
}
