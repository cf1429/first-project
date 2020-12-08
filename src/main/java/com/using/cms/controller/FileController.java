package com.using.cms.controller;

import com.using.cms.bean.BusinessException;
import com.using.cms.bean.FileUpload;
import com.using.cms.bean.extra.ExtUser;
import com.using.cms.service.FileUploadService;
import com.using.cms.service.UserService;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.JsonResult;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

@RestController
@RequestMapping(value = { "/cms/file", "/api/cms/file" })
public class FileController {
    public static final Logger logger = LoggerFactory.getLogger(CategoryController.class);

    @Autowired
    private UserService usersService;
    @Autowired
    private FileUploadService fileUploadService;


    /**
     * 上传文件
     * @throws BusinessException
     * @throws IOException
     */
    @PostMapping(value = "upload")
    public JsonResult<FileUpload> list(
            @RequestParam(name = "file", required = true) MultipartFile file
    ) throws BusinessException, IOException {
        JsonResult<FileUpload> jsonResult = new JsonResult<>();
        ExtUser curUser = usersService.findCurrentUser();
        if (curUser == null) {
            throw new BusinessException(ErrorEnum.AUTH_NOT_LOGIN);
        }

        String extension = FilenameUtils.getExtension(file.getOriginalFilename()).toLowerCase();
        if (StringUtils.isBlank(extension)) {
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "无法识别的文件类型");
        }

        FileUpload fileUpload = fileUploadService.upLoad(file);
        jsonResult.setSuccessData(fileUpload);
        return jsonResult;
    }
}
