package com.using.cms.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class BaseController extends AbstractBaseController {

	protected final static Logger LOGGER = LoggerFactory.getLogger(BaseController.class);
//	private final static String ACCESS_TOKEN = "access_token";
	private final static String ACCESS_TOKEN = "zhizhong_token";

	/**
	 * 获取所有表单提交数据
	 * 
	 * @return
	 */
	protected Object reqParameters() {
		return super.getRequest().getParameterMap();
	}

	/**
	 * 获取所有attribute属性
	 * 
	 * @return
	 */
	protected Map<String, Object> reqAttributes() {
		HttpServletRequest req = super.getRequest();
		Enumeration<String> names = req.getAttributeNames();
		Map<String, Object> params = new HashMap<>();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			if (name.indexOf(".") > 0) {
				continue;
			}
			Object value = super.getRequest().getAttribute(name);
			params.put(name, value);
		}
		return params;
	}

	/**
	 * 获取header中的token
	 * 
	 * @return
	 */
	protected String getAccessToken() {
		String accessToken = super.getRequest().getHeader(ACCESS_TOKEN);
		if (accessToken == null) {
			return "";
		}
		return accessToken;
	}
}