package com.using.cms.util;

import org.apache.commons.io.FileUtils;

import java.io.*;
import java.net.URL;

public class UtilsFile {
    /**
     * 将文件转换成byte数组
     * @param tradeFile
     * @return
     */
    public static byte[] getFileByte(File tradeFile){
        byte[] buffer = null;
        try
        {
            FileInputStream fis = new FileInputStream(tradeFile);
            ByteArrayOutputStream bos = new ByteArrayOutputStream();
            byte[] b = new byte[1024];
            int n;
            while ((n = fis.read(b)) != -1)
            {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        }catch (FileNotFoundException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
        return buffer;
    }

    public static String  getUrl(){
        return UtilsPath.getPathRoot();
    }


    public static String downloadFromUrl(String url,String dir) {

        try {
            URL httpurl = new URL(url);
            String fileName = getFileNameFromUrl(url);
            // System.out.println(fileName);
            String path=dir +"/"+ fileName;
            File f = new File(path);
            FileUtils.copyURLToFile(httpurl, f);
            return path;
        } catch (Exception e) {
            e.printStackTrace();
            return "Fault!";
        }
    }

    public static String getFileNameFromUrl(String url){
        String name = new Long(System.currentTimeMillis()).toString() + ".X";
        int index = url.lastIndexOf("/");
        if(index > 0){
            name = url.substring(index + 1);
            if(name.trim().length()>0){
                return name;
            }
        }
        return name;
    }

}
