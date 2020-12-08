package com.using.cms.filter;

import com.using.cms.config.AuthConfig;
import com.using.cms.controller.LoginController;
import com.using.cms.util.RequestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginFilter implements Filter {
	private AntPathMatcher matcher = new AntPathMatcher();
	private AuthConfig authConfig;

	private StringRedisTemplate stringRedisTemplate;
	
	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		String token = RequestUtils.getCookieValue(request, LoginController.TOKEN_COOKIE_NAME);
		String requestUri = request.getRequestURI();
		String method = request.getMethod();
		for (String excludeUrl : this.authConfig.getExcludeUrl()) {
			if (matcher.match(excludeUrl, requestUri)) {
				chain.doFilter(request, response);
				return;
			}
		}
		if(requestUri.contains("login") && StringUtils.isBlank(token) && method.equals("GET")) {
			response.sendRedirect(this.authConfig.getLoginUrl());
		}
		if (matcher.match("/index403.html", requestUri)) {
			chain.doFilter(request, response);
			return;
		}

//		if (matcher.match(this.authConfig.getLoginUrl(), requestUri)) {
//			if (StringUtils.isNotBlank(token)) {
//				response.sendRedirect("/");
//				return;
//			} else {
//				chain.doFilter(request, response);
//				return;
//			}
//		}
		/*if(StringUtils.isNotBlank(token)) {
			String userId = redisTemplate.opsForValue().get(token);
			if(userId == null) {
				String responseBody = null;
				responseBody = JSONObject.toJSONString(JsonResult.error(ErrorEnum.AUTH_NOT_LOGIN,"token失效，请重新登录"));
				response.setStatus(HttpStatus.OK.value());
				response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
				response.setCharacterEncoding(StandardCharsets.UTF_8.name());
				PrintWriter writer = response.getWriter();
				writer.write(responseBody);
				writer.flush();
				return;
			}
		}*/

		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		
	}

	@Override
	public void destroy() {

	}

	public void setAuthConfig(AuthConfig authConfig) {
		this.authConfig = authConfig;
	}

	public StringRedisTemplate getStringRedisTemplate() {
		return stringRedisTemplate;
	}

	public void setStringRedisTemplate(StringRedisTemplate stringRedisTemplate) {
		this.stringRedisTemplate = stringRedisTemplate;
	}
}
