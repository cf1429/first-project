package com.using.cms.bean;

import com.using.cms.util.ErrorEnum;

public class BusinessException extends Exception {
    private static final long serialVersionUID = 1L;
    protected ErrorEnum errorEnum;

    public BusinessException(ErrorEnum errorEnum, String message, Throwable cause) {
        super(message, cause);
        this.errorEnum = errorEnum;
    }

    public BusinessException(ErrorEnum errorEnum, String message) {
        super(message);
        this.errorEnum = errorEnum;
    }

    public BusinessException(ErrorEnum errorEnum, Throwable cause) {
        super(errorEnum.getDesc(), cause);
        this.errorEnum = errorEnum;
    }

    public BusinessException(ErrorEnum errorEnum) {
        super(errorEnum.getDesc());
        this.errorEnum = errorEnum;
    }

    @SuppressWarnings("unused")
    private BusinessException() {
    }

    public ErrorEnum getErrorEnum() {
        return errorEnum;
    }
}
