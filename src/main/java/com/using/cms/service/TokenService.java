package com.using.cms.service;

public interface TokenService {
	
	 /**
	  * 校验token
	 * @param token
	 * @return
	 */
	boolean isValid(String token);
	
	/**
	 * 生成token
	 * @param userId
	 * @return
	 */
	String alloc(int userId);
	
}
