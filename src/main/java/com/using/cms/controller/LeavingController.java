package com.using.cms.controller;

import com.github.pagehelper.PageInfo;
import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Leaving;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.service.LeavingService;
import com.using.cms.service.UserService;
import com.using.cms.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping(value = { "/cms/leaving", "/api/cms/leaving" })
public class LeavingController {
    public static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

    @Autowired
    private UserService usersService;

    @Autowired
    private LeavingService leavingService;

    /**
     * 新增
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "list")
    public JsonResult<PageResult<List<Leaving>>> list(
            @RequestParam(name = "pageNum")Integer pageNum,
            @RequestParam(name = "pageSize")Integer pageSize
    ) throws BusinessException {
        JsonResult<PageResult<List<Leaving>>> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }
        Map<String,Object> param = new HashMap<>();
        param.put("pageNum",pageNum);
        param.put("pageSize",pageSize);
        List<Leaving> leavings = leavingService.selectAll(param);
        PageInfo<List<Leaving>> pageInfo = new PageInfo(leavings);
        jsonResult.setSuccessData(PageInfoUtils.convert(pageInfo));
        return jsonResult;
    }

    /**
     * 新增
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "add")
    public JsonResult<Object> add(Leaving leaving) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
//        ExtUser curUser = usersService.findCurrentUser();
//        if (curUser == null) {
//            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
//        }

        if(StringUtils.isEmpty(leaving.getName())){
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"姓名不可为空");
        }
        if(StringUtils.isEmpty(leaving.getPhone())){
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"手机号不可为空");
        }
        if(!UtilsRegex.isPhone(leaving.getPhone())){
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"手机号格式有误");
        }
        if(StringUtils.isEmpty(leaving.getContent())){
            throw new BusinessException(ErrorEnum.ERROR_PARAM,"留言内容不可为空");
        }

        try {
            int insert = leavingService.insert(leaving);
            jsonResult.setSuccessData(insert);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return jsonResult;
    }

    /**
     * 导出
     * @throws BusinessException
     * @throws IOException
     */
    @GetMapping(value = "export")
    public JsonResult<Object> export(HttpServletResponse response,HttpServletRequest request) throws BusinessException {
        JsonResult<Object> jsonResult = new JsonResult<>();
//        ExtUser curUser = usersService.findCurrentUser();
//        if (curUser == null) {
//            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
//        }
        try {
            OutputStream out = null;
            byte[] bytes = leavingService.exportLeaving(response);
            String finalFileName = "留言" + new SimpleDateFormat("yyyy-MM-dd").format(new Date())+".xls";
//            response.addHeader("content-disposition", "attachment;filename="
//                    + java.net.URLEncoder.encode(filename, "utf-8"));
//            out = response.getOutputStream();
//            out.write(bytes);
//            out.close();

            //下载
            if(bytes != null && finalFileName != null){
                dowloadFile(finalFileName,bytes,request,response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonResult.setErrorMessage(ErrorEnum.ERROR_SYSTEM, "导出留言信息出错");
        }

        return jsonResult;
    }


    /**
     * 下载附件
     * @param filename
     * @param bs
     * @param request
     * @param response
     * @throws BusinessException
     */
    public void dowloadFile(String filename, byte[] bs,
                            HttpServletRequest request, HttpServletResponse response) throws BusinessException{
        try {
            String mimeType = request.getServletContext().getMimeType(filename);
            response.setContentType(mimeType);
            BufferedOutputStream output = null;
            BufferedInputStream input = null;
            try {
                // 中文文件名必须转码为 ISO8859-1,否则为乱码
                String fileNameDown = new String(filename.getBytes(StandardCharsets.UTF_8), StandardCharsets.ISO_8859_1);
                // 作为附件下载
                response.setHeader("Accept-Ranges", "bytes");
                response.setHeader("Content-Disposition", "attachment;filename=" + fileNameDown);
                response.setHeader("Cache-Control", "no-store");
                output = new BufferedOutputStream(response.getOutputStream());
                output.write(bs);
                response.flushBuffer();
            } catch (Exception e) {
                logger.error("Download log file error", e);
            } // 用户可能取消了下载
            finally {
                if (input != null)
                    try {
                        input.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                if (output != null)
                    try {
                        output.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
            }
        } catch (Exception e) {
            // TODO: handle exception
            throw new BusinessException(ErrorEnum.ERROR_SYSTEM,"下载异常："+e.getMessage());
        }
    }
}
