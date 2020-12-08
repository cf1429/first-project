package com.using.cms.util;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

public class RequestUtils {
    private static final String AJAX_HEADER = "X-Requested-With";
    private static final String AJAX_HEADER_VALUE = "XMLHttpRequest";

    /**
     * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址,
     *
     * 可是，如果通过了多级反向代理的话，X-Forwarded-For的值并不止一个，而是一串IP值，究竟哪个才是真正的用户端的真实IP呢？
     * 答案是取X-Forwarded-For中第一个非unknown的有效IP字符串。
     *
     * 如：X-Forwarded-For：192.168.1.110, 192.168.1.120, 192.168.1.130, 192.168.1.100
     *
     * 用户真实IP为： 192.168.1.110
     *
     * @param request
     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {

        String ip = request.getHeader("x-forwarded-for");
        if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
            // 多次反向代理后会有多个ip值，第一个ip才是真实ip
            if (ip.indexOf(",") != -1) {
                ip = ip.split(",")[0];
            }
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("X-Real-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        if (ip.equals("0:0:0:0:0:0:0:1")) {
            ip = "127.0.0.1";
        }
        return ip;

    }

    /**
     * 获取request attribute map
     *
     * @param request
     * @return
     */
    public static Map<String, Object> getAttributeMap(HttpServletRequest request) {
        Enumeration<String> names = request.getAttributeNames();
        Map<String, Object> params = new HashMap<>();
        while (names.hasMoreElements()) {
            String name = names.nextElement();
            if (name.indexOf(".") > 0) {
                continue;
            }

            Object value = request.getAttribute(name);
            params.put(name, value);
        }

        return params;
    }

    /**
     * 验证请求是否为Ajax请求
     *
     * @param request
     * @return
     */
    public static boolean isAjax(HttpServletRequest request) {
        String ajaxHeader = request.getHeader(AJAX_HEADER);
        boolean isAjax = StringUtils.isNotBlank(ajaxHeader) && ajaxHeader.equalsIgnoreCase(AJAX_HEADER_VALUE);
        return isAjax;
    }

    /**
     * 验证请求是否为JSON请求
     *
     * @param request
     * @return
     */
    public static boolean isJSON(HttpServletRequest request) {
        return StringUtils.containsIgnoreCase(request.getContentType(), "application/json");
    }

    /**
     * 按照cookie名称获取cookie
     *
     * @param request
     * @param cookieName
     * @return
     */
    public static Cookie getCookie(HttpServletRequest request, String cookieName) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null && cookies.length > 0) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(cookieName)) {
                    return cookie;
                }
            }
        }

        return null;
    }

    /**
     * 按照cookie名称获取cookie中的值
     *
     * @param request
     * @param cookieName
     * @return
     */
    public static String getCookieValue(HttpServletRequest request, String cookieName) {
        Cookie cookie = getCookie(request, cookieName);
        if (cookie != null) {
            return cookie.getValue();
        }

        return null;
    }

    /**
     * 写入返回报文体
     *
     * @param response
     * @param contentType
     * @param body
     * @throws IOException
     */
    public static void writeBody(HttpServletResponse response, String contentType, String body) throws IOException {
        response.setContentType(contentType);

        PrintWriter writer = response.getWriter();
        writer.write(body);
        writer.flush();
        writer.close();
        response.flushBuffer();
    }

    /**
     * 获取request的body
     *
     * @param request
     * @return
     * @throws IOException
     */
    public static String getBody(HttpServletRequest request) throws IOException {

        StringBuilder sb = new StringBuilder();
        BufferedReader reader = null;

        try {

            InputStream inputStream = request.getInputStream();
            if (inputStream != null) {
                reader = new BufferedReader(new InputStreamReader(inputStream));
                char[] charBuffer = new char[128];
                int bytesRead = -1;
                while ((bytesRead = reader.read(charBuffer)) > 0) {
                    sb.append(charBuffer, 0, bytesRead);
                }
            } else {
                sb.append("");
            }

        } catch (Exception e) {
            // TODO: handle exception
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException ex) {
                    throw ex;
                }
            }
        }
        return sb.toString();
    }
}
