package com.using.cms.util;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class FileUtils {
    public static String base64(File file) throws IOException {
        byte[] fileBytes = org.apache.commons.io.FileUtils.readFileToByteArray(file);
        return base64(fileBytes);
    }

    public static String base64(byte[] fileBytes) throws IOException {
        byte[] baseBytes = Base64.encodeBase64(fileBytes);
        String fileBody = new String(baseBytes, StandardCharsets.UTF_8);

        return fileBody;
    }

    /**
     * 下载文件时，针对不同浏览器，进行附件名的编码
     *
     * @param filename
     *            下载文件名
     * @param agent
     *            客户端浏览器
     * @return 编码后的下载附件名
     * @throws IOException
     */
    public static String encodeDownloadFilename(String filename, String agent) throws IOException {
        if (agent.contains("Firefox")) { // 火狐浏览器
            filename = "=?UTF-8?B?" + Base64.encodeBase64(filename.getBytes("utf-8")) + "?=";
            filename = filename.replaceAll("\r\n", "");
        } else { // IE及其他浏览器
            filename = URLEncoder.encode(filename, "utf-8");
            filename = filename.replace("+", " ");
        }
        return filename;
    }

    /**
     * 判断是否是制定的文件格式
     *
     * @param fileName
     * @return
     */
    public static boolean isNotSuffix(String fileName) {
        String Suffix = fileName.substring(fileName.lastIndexOf(".") + 1);
        if (Suffix.equals("doc")) {
            return true;
        } else if (Suffix.equals("docx")) {
            return true;
        } else if (Suffix.equals("pdf")) {
            return true;
        } else if (Suffix.equals("xls")) {
            return true;
        } else if (Suffix.equals("xlsx")) {
            return true;
        } else if (Suffix.equals("png")) {
            return true;
        } else if (Suffix.equals("jpeg")) {
            return true;
        } else if (Suffix.equals("jpg")) {
            return true;
        } else if (Suffix.equals("gif")) {
            return true;
        } else {
            return false;
        }
    }

    public static String getContentType(String fileName) {
        String extension = FilenameUtils.getExtension(fileName);
        String mimeType = MimeTypeMap.getValue(extension);
        return mimeType;
    }
}
