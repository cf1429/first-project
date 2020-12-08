package com.using.cms.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Function;
import com.using.cms.bean.Role;
import com.using.cms.bean.Users;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.service.RoleService;
import com.using.cms.service.TokenService;
import com.using.cms.service.UserService;

import com.using.cms.util.CacheConstant;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.JsonResult;
import com.using.cms.util.MapUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping(value = { "/cms", "/api/cms" })
public class LoginController extends BaseController {

	public static final String TOKEN_COOKIE_NAME = "zhizhong_token";
	public static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private UserService usersService;
	@Autowired
	private TokenService tokenService;
	@Autowired
	private RoleService roleService;
	@Resource
	private StringRedisTemplate stringRedisTemplate;

	@Value("${using.token.cache.expir}")
	private String tokenCacheExpir;

	/**
	 * 登录
	 * @throws BusinessException
	 * @throws IOException
	 */
	@PostMapping(value = "login")
	public JsonResult<ExtUser> login(
			Users user,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(name = "verifyCode", required = false) String verifyCode
	) throws BusinessException {

		if(StringUtils.isBlank(user.getUserName()) || StringUtils.isBlank(user.getPassword())) {
			throw new BusinessException(ErrorEnum.ERROR_PARAM, "用户名或密码不能为空！");
		}
		ExtUser extUser = usersService.getUserByName(user.getUserName());
		JsonResult<ExtUser> jsonResult = new JsonResult<>();
		if(extUser == null) {
			jsonResult.setErrorMessage(ErrorEnum.AUTH_ACCOUNT_UNKNOWN, "账号不存在");
			return jsonResult;
		}
		//获取验证码
		String validateC = (String) request.getSession().getAttribute("ma_validateCode");
		//校验验证码
//		if(!validateC.equalsIgnoreCase(verifyCode)) {
//			throw new BusinessException(ErrorEnum.ERROR_PARAM, "验证码不正确！");
//		}

		String findPassword = extUser.getPassword();
		if (!new Md5Hash(user.getUserName(), user.getPassword()).toString().equals(findPassword)) {
			jsonResult.setErrorMessage(ErrorEnum.AUTH_ERROR_PASSWORD, "密码错误！");
			return jsonResult;
		}
		if(extUser.getState()==2) {
			jsonResult.setErrorMessage(ErrorEnum.AUTH_ACCOUNT_LOCKED, "用户已冻结，请联系管理员！");
			return jsonResult;
		}
		String token = tokenService.alloc(extUser.getId());
		Cookie cookie = new Cookie(TOKEN_COOKIE_NAME, token);
		response.addCookie(cookie); // 先存token到cookie
		extUser.setToken(token);
		Role role = roleService.selectRoleById(extUser.getRoleId());
		extUser.setRoleType(role.getType());
		extUser.setRoleName(role.getName());
		List<Function> funcList = roleService.queryFunctionByUserId(extUser.getId());
		if(funcList.size()<=0) {
			throw new BusinessException(ErrorEnum.AUTH_NO_AUTHORITY);
		}
		List<String> menuList = new ArrayList<>();
		for(Function func:funcList) {
			if(func.getType()==1) {
				menuList.add(func.getResourceUrl());
			}
		}
		extUser.setAccess(menuList.toArray(new String[0]));
		Map<String, Object> userData = MapUtils.instanceObject(
				CacheConstant.EXTRAUSERS, JSONObject.toJSONString(extUser),
				CacheConstant.FUNCTIONLIST, JSONArray.toJSONString(funcList));
		try {
			stringRedisTemplate.opsForHash().putAll(token, userData);
			stringRedisTemplate.expire(token, Long.valueOf(tokenCacheExpir), TimeUnit.HOURS);
		} catch (Exception e) {
			logger.warn("用户 {} 缓存认证信息失败", user.getUserName());
			logger.error(e.getMessage());
		}
		//request.getSession().setAttribute("funcList", JSONArray.toJSONString(funcList));
		jsonResult.setSuccessData(extUser);
		jsonResult.setMessage("成功");
		return jsonResult;
	}

	/**
	 * 注销
	 *
	 * @throws BusinessException
	 */
	@RequestMapping(value = "signOut")
	public JsonResult<Integer> signOut(HttpServletRequest request, HttpServletResponse response){
		JsonResult<Integer> result = new JsonResult<>();
		super.clearCookie(response,TOKEN_COOKIE_NAME, "");
		request.getSession().invalidate();
		result.setSuccessData(1);
		result.setMessage("退出成功！");
		return result;
	}


}
