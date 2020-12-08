package com.using.cms.service;

import com.using.cms.bean.Leaving;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface LeavingService {

    List<Leaving> selectAll(Map<String,Object> param);

    int insert(Leaving leaving);

    byte[] exportLeaving(HttpServletResponse response) throws IOException;
}
