package com.using.cms.dao;

import com.using.cms.bean.ContentInfo;
import com.using.cms.bean.extra.ExtraContentInfo;

import java.util.List;
import java.util.Map;

public interface ContentInfoDao {

    List<ExtraContentInfo> selectByMap(Map<String,Object> param);

    int insert(ContentInfo contentInfo);

    int update(ContentInfo contentInfo);

    int delete(String ids);

    List<Map<String,Object>> selectContentInfo(Map<String,Object> map);

    /**
     * 此接口用于取消置顶，更新置顶时间为空
     * @param contentInfo
     * @return
     */
    int update2(ContentInfo contentInfo);

    List<ExtraContentInfo> findContentInfoDetail(Map<String,Object> param);

    List<ExtraContentInfo> selectContentByMap(Map<String,Object> params);




}
