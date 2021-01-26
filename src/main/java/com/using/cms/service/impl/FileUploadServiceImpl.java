package com.using.cms.service.impl;

import com.using.cms.bean.FileUpload;
import com.using.cms.config.FileConfig;
import com.using.cms.dao.FileUploadDao;
import com.using.cms.service.FileUploadService;
import com.using.cms.util.FileObject;
import com.using.cms.util.UUIDUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.Date;

@Service
@Transactional
public class FileUploadServiceImpl implements FileUploadService {

    @Autowired
    private FileUploadDao fileUploadDao;

    @Autowired
    private FileConfig fileConfig;

    @Override
    public FileUpload selectById(Integer id) {
        return fileUploadDao.selectById(id);
    }

    @Override
    public int insert(FileUpload fileUpload) {
        return fileUploadDao.insert(fileUpload);
    }

    @Override
    public FileUpload upLoad(MultipartFile file) {
        FileUpload fu = null;
        try {
            FileObject fileObject = new FileObject(file);

            String filename = file.getOriginalFilename();
            String fileInfoId = UUIDUtils.randReplacedLower() + filename.substring(filename.lastIndexOf('.'));
            String date = DateFormatUtils.format(new Date(), "yyyyMMdd");
            String relativePath = "/" + fileConfig.getSysName() + "/" + date + "/" + fileInfoId;

            fu = new FileUpload();
            fu.setFileName(filename);
            fu.setFilePath(fileConfig.getServerUrl() + "/upload/"+relativePath);

            // 保存文件
            String filePath = fileConfig.getFileBasePath() + relativePath;
            filePath = FilenameUtils.normalize(filePath);
            File fileDir = new File(FilenameUtils.getFullPath(filePath));
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            File saved = new File(filePath);
            FileUtils.writeByteArrayToFile(saved, fileObject.getBytes());
            fileUploadDao.insert(fu);
        } catch (IOException e) {
            e.printStackTrace();
        }

        FileUpload fileUpload = fileUploadDao.selectById(fu.getId());
        return fileUpload;
    }
}
