package com.using.cms.util;

import com.using.cms.config.FileConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.io.File;
import java.io.IOException;

@Component
public class UtilsPath {

    @Autowired
    private FileConfig fileConfig;
    @Autowired
    private static FileConfig staticfileConfig;

    @PostConstruct
    public void init() {
        staticfileConfig = fileConfig;
    }

    /**
     * 获取 当前项目 路径
     * @return
     */
    public static String getPathRoot(){
        //项目根目录
//        File directory = new File(".");
        String pathName = staticfileConfig.getFileBasePath();
        File directory = new File(pathName);
        String rootpath="";
        try {
            rootpath=directory.getCanonicalPath();
            String tempFanyu=rootpath+"/tempFanyu";
            File folder = new File(tempFanyu);
            if (!folder.exists() && !folder.isDirectory()) {
                folder.mkdirs();
            }
            return tempFanyu;
        } catch (IOException e) {
            e.printStackTrace();
            return rootpath;
        }
    }


}
