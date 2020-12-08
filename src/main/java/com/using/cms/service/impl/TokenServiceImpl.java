package com.using.cms.service.impl;


import com.using.cms.service.TokenService;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class TokenServiceImpl implements TokenService {
	private static final Logger logger = LoggerFactory.getLogger(TokenServiceImpl.class);
	final static String RandomTable = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    /**
     * key: 用户id
     * value: token
     */
    private static ConcurrentHashMap<Integer, String> loginCache = new ConcurrentHashMap<>();
    @Value("${using.token.cache.expir}")
	private String tokenCacheExpir;
	@Resource
	private StringRedisTemplate stringRedisTemplate;
	
	@Override
	public boolean isValid(String token) {
		if ((token == null) || (token.length() <= 0)) {
            return false;
        }
		Boolean hasKey = stringRedisTemplate.hasKey(token);
		return hasKey;
	}
	/**
     * 生成token
     */
    String generate(int userId) {
        StringBuffer sb = new StringBuffer();
        sb.append(userId);
        sb.append('|');
        sb.append(System.currentTimeMillis());
        while ((sb.length() % 3) != 0) {
            sb.insert(0, '0');
        }
        String raw = sb.toString();
        sb.setLength(0);
        sb.append(Base64.encodeBase64String(raw.getBytes()));
        Random random = new Random();
        for (int i = 0; i < 17; i++) {
            sb.append(RandomTable.charAt(random.nextInt(RandomTable.length())));
        }
        return sb.toString();
    }
    
    @Override
    public synchronized String alloc(int userId) {
    	String newToken = null;
    	try {
    		newToken = generate(userId);
    		String oldToken = loginCache.get(userId);
    		if(oldToken != null) {//删除旧token
//    			redisTemplate.delete(oldToken);
    		}
    		//将newToken放入map中
    		loginCache.put(userId, newToken);
		} catch (Exception e) {
			logger.warn("用户 {} 缓存认证信息失败", userId);
			logger.error(e.getMessage());
		}
        return newToken;
    }
}
