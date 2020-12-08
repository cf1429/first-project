package com.using.cms.service;

import com.using.cms.bean.FileUpload;
import org.springframework.web.multipart.MultipartFile;

public interface FileUploadService {

    FileUpload selectById(Integer id);

    int insert(FileUpload fileUpload);

    FileUpload upLoad(MultipartFile file);

}
