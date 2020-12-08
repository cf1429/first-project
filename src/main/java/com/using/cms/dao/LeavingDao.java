package com.using.cms.dao;

import com.using.cms.bean.Leaving;

import java.util.List;

public interface LeavingDao {

    List<Leaving> selectAll();

    int insert(Leaving leaving);


}
