package com.using.cms.util;

import java.io.Serializable;

public class JsonResult<T> implements Serializable {
    private static final long serialVersionUID = 1L;
    protected Boolean flag;
    protected T data;
    protected String code;
    protected String message;

    public JsonResult() {

    }

    public static <T> JsonResult<T> success(T data, String message) {
        JsonResult<T> jsonResult = new JsonResult<>();
        jsonResult.setFlag(true);
        jsonResult.setData(data);
        jsonResult.setCode(ErrorEnum.SUCCESS);
        jsonResult.setMessage(message);

        return jsonResult;
    }

    public static <T> JsonResult<T> error(T data, ErrorEnum code) {
        JsonResult<T> jsonResult = new JsonResult<>();
        jsonResult.setFlag(false);
        jsonResult.setData(data);
        jsonResult.setCode(code);
        jsonResult.setMessage(code.getDesc());

        return jsonResult;
    }

    public static <T> JsonResult<T> error(T data, ErrorEnum code, String message) {
        JsonResult<T> jsonResult = new JsonResult<>();
        jsonResult.setFlag(false);
        jsonResult.setData(data);
        jsonResult.setCode(code);
        jsonResult.setMessage(message);

        return jsonResult;
    }

    public static <T> JsonResult<T> error(ErrorEnum code) {
        JsonResult<T> jsonResult = new JsonResult<>();
        jsonResult.setFlag(false);
        jsonResult.setCode(code);
        jsonResult.setMessage(code.getDesc());

        return jsonResult;
    }

    public static <T> JsonResult<T> error(ErrorEnum code, String message) {
        JsonResult<T> jsonResult = new JsonResult<>();
        jsonResult.setFlag(false);
        jsonResult.setCode(code);
        jsonResult.setMessage(message);

        return jsonResult;
    }

    public void setSuccessData(T data) {
        this.flag = true;
        this.setCode(ErrorEnum.SUCCESS);
        this.data = data;
    }

    public void setErrorMessage(ErrorEnum code) {
        this.flag = false;
        this.setCode(code);
        this.message = code.getDesc();
    }

    public void setErrorMessage(ErrorEnum code, String message) {
        this.flag = false;
        this.setCode(code);
        this.message = message;
    }

    public Boolean getFlag() {
        return flag;
    }

    public void setFlag(Boolean flag) {
        this.flag = flag;
    }

    public T getData() {
        return data;
    }

    public void setData(T data) {
        this.data = data;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setCode(ErrorEnum code) {
        this.code = code.getCode();
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
