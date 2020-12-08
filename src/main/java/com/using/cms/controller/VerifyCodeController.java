package com.using.cms.controller;

import com.using.cms.util.UtilsVerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;

@Controller
@RequestMapping(value = { "verify", "api/verify" })
public class VerifyCodeController extends HttpServlet {

    // 验证码图片的宽度。
    private int width = 60;
    // 验证码图片的高度。
    private int height = 20;
    // 验证码字符个数
    private int codeCount = 4;
    private int x = 0;
    // 字体高度
    private int fontHeight;
    private int codeY;
    char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
    /**
     * 初始化验证图片属性
     */
    @Override
    public void init() throws ServletException {
        // 从web.xml中获取初始信息
        // 宽度
        String strWidth ="100";
        // 高度
        String strHeight ="30";
        // 字符个数
        String strCodeCount = "4";
        // 将配置的信息转换成数值
        try {
            if (strWidth != null && strWidth.length() != 0) {
                width = Integer.parseInt(strWidth);
            }
            if (strHeight != null && strHeight.length() != 0) {
                height = Integer.parseInt(strHeight);
            }
            if (strCodeCount != null && strCodeCount.length() != 0) {
                codeCount = Integer.parseInt(strCodeCount);
            }
        } catch (NumberFormatException e) {
        }
        x = width / (codeCount + 1);
        fontHeight = height - 2;
        codeY = height - 4;
    }

    @RequestMapping(value="/code",method= RequestMethod.GET)
    public void getCode(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, java.io.IOException {
        //设置页面不缓存
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", 0);
        String verifyCode = UtilsVerifyCode.generateTextCode(UtilsVerifyCode.TYPE_ALL_MIXED, 4, null);
        //将验证码放到HttpSession里面
        req.getSession().setAttribute("ma_validateCode", verifyCode);
        System.out.println("ma_validateCode:"+verifyCode);
        //设置输出的内容的类型为JPEG图像
        resp.setContentType("image/jpeg");
        BufferedImage bufferedImage = UtilsVerifyCode.generateImageCode(verifyCode, 116, 36, 5, true, new Color(249,205,173), null, null);
        //写给浏览器
        ImageIO.write(bufferedImage, "JPEG", resp.getOutputStream());
    }
}
