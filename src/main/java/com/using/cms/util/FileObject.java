package com.using.cms.util;




import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.Serializable;

public class FileObject implements Serializable {
    protected String fileName;
    protected String filePath;
    protected String contentType;
    protected long size = 0l;
    protected byte[] bytes;

    public FileObject() {

    }

    public FileObject(String fileName, String filePath) {
        setFileName(fileName);
        setContentType(FileUtils.getContentType(fileName));
        setFilePath(filePath);
    }

    public FileObject(MultipartFile file) throws IOException {
        setFileName(file.getOriginalFilename());
        setContentType(file.getContentType());
        setBytes(file.getBytes());
    }

    public FileObject(String fileName, String contentType, byte[] bytes) {
        setFileName(fileName);
        setContentType(contentType);
        setBytes(bytes);
    }

    public FileObject(String fileName, byte[] bytes) {
        this(fileName, FileUtils.getContentType(fileName), bytes);
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public long getSize() {
        return size;
    }

    public byte[] getBytes() {
        return bytes;
    }

    public void setBytes(byte[] bytes) {
        this.bytes = bytes;
        this.size = bytes.length;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
