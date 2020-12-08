package com.using.cms.dao;

import com.using.cms.bean.FileUpload;

public interface FileUploadDao {

    FileUpload selectById(Integer id);

    int insert(FileUpload fileUpload);
}
