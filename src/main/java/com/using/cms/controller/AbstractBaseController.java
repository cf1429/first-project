package com.using.cms.controller;

import com.using.cms.util.AbstractBaseCache;
import com.using.cms.util.RequestUtils;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

public class AbstractBaseController {

    private static final String WEB_URL_DEFAULT = "/";
    @Autowired
    private HttpServletRequest request;
    // @Autowired
    private AbstractBaseCache cache;

    /**
     * 获取request
     *
     * @return
     */
    public HttpServletRequest getRequest() {
        return request;
    }

    /**
     * 获取客户端IP地址
     *
     * @param request
     * @return
     */
    protected String getClientIp() {
        return RequestUtils.getIpAddr(request);
    }

    /**
     * 根据cookie键值名取cookie的值
     *
     * @param key
     *            cookie的键值
     * @return 返回cookie的值
     */
    protected String getCookies(HttpServletRequest request, String key) {
        return RequestUtils.getCookieValue(request, key);
    }

    /**
     * 取当前用户浏览器信息
     *
     * @return
     */
    protected String getUserAgent() {
        String userAgent = null;
        Enumeration<?> userAgentObj = request.getHeaders("User-Agent");
        if (userAgentObj.hasMoreElements()) {
            Object userAgentObjVal = (userAgentObj != null ? userAgentObj.nextElement() : null);
            userAgent = (userAgentObjVal != null ? userAgentObjVal.toString() : null);
        }

        return userAgent;
    }

    /**
     * 从session中取数据
     *
     * @param request
     * @param key
     * @return
     */
    protected Object getSessionAttribute(String key) {
        return request.getSession().getAttribute(key);
    }

    /**
     * 存储到session中
     *
     * @param key
     * @param value
     */
    protected void setSessionAttribute(String key, Object value) {
        request.getSession().setAttribute(key, value);
    }

    /**
     * 清除session中key值
     *
     * @param key
     */
    protected void removeSessionAttribute(String key) {
        request.getSession().removeAttribute(key);
    }

    /**
     * redirect到指定地址
     *
     * @param url
     * @return
     */
    protected String redirect(String url) {
        return "redirect:" + url;
    }

    /**
     * redirect到默认地址
     *
     * @return
     */
    protected String redirectDefault() {
        return redirect(WEB_URL_DEFAULT);
    }

    /**
     * 清除cookie
     *
     * @param reponse
     * @param key
     * @param domain
     */
    protected void clearCookie(HttpServletResponse response, String key, String domain) {
        Cookie cookie = new Cookie(key, null);
        cookie.setMaxAge(0);
        cookie.setPath("/");
        if (domain != null && !domain.equals("")) {
            cookie.setDomain(domain);
        }
        response.addCookie(cookie);
    }

    /**
     * 写cookie
     *
     * @param key
     * @param value
     * @param validateTime
     *            有效期，单位分钟
     */
    protected void writeCookies(HttpServletResponse response, String key, String value, int validateTime) {
        Cookie cookie = new Cookie(key, value);
        cookie.setMaxAge(60 * validateTime);
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    /**
     * 写cookie
     *
     * @param key
     *            cookie键值
     * @param value
     *            cookie值
     */
    protected void writeCookies(HttpServletResponse response, String key, String value) {
        Cookie cookie = new Cookie(key, value);
        // cookie.setMaxAge(60*30);//30分钟有效期
        cookie.setPath("/");
        response.addCookie(cookie);
    }

    /**
     * 求当前的URL全地址
     *
     * @param request
     * @return
     */
    protected String getLocalUrlPre(HttpServletRequest request) {
        return "http://" + request.getServerName()
                + (request.getServerPort() == 80 ? "" : ":" + request.getServerPort()) + request.getContextPath();
    }

    /**
     * 输出
     *
     * @param response
     * @param outStr
     */
    protected void print(HttpServletResponse response, String outStr) {
        PrintWriter out;
        try {
            out = response.getWriter();
            out.print(outStr);
            out.flush();
            out.close();
        } catch (IOException e) {
        } catch (Exception e) {

        }
    }

    /**
     * 取缓存
     *
     * @param key
     * @return
     */
    protected Object getCache(String key) {
        if (key == null) {
            return null;
        }

        try {
            return cache.get(key);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 清除缓存
     *
     * @param key
     */
    protected void removeCache(String key) {
        if (key == null)
            return;
        try {
            cache.remove(key);
        } catch (Exception e) {
            throw e;
        }
    }

    /**
     * 写缓存
     *
     * @param key
     * @param value
     * @param timeout
     *            -1为永久存储
     */
    protected void writeCache(String key, Object value, int timeout) {
        try {
            if (timeout == -1) {
                cache.put(key, value);
            }
            cache.put(key, value, timeout);
        } catch (Exception e) {
            throw e;
        }
    }
}
