package com.using.cms.util;

public enum ErrorEnum {
    SUCCESS("000000", "成功"),
    AUTH_ERROR_IDENTIFYING_CODE("000101", "验证码错误"),
    AUTH_ERROR_PASSWORD("000102", "密码错误"),
    AUTH_ACCOUNT_TRY_OUT_OF_NUMS("000103", "账户尝试登录次数过多"),
    AUTU_FREQUENTLY_CODE("000104","验证码发送频繁，请稍后再试！"),
    AUTH_ACCOUNT_UNKNOWN("000110", "未知账户"),
    AUTH_ACCOUNT_LOCKED("000111", "账户已被锁定"),
    AUTH_ACCOUNT_DISABLED("000112", "账户已被禁用"),
    AUTH_ACCOUNT_DELETED("000113", "账户已被删除"),
    AUTH_ACCOUNT_EXIST("000114","账户已存在"),
    AUTH_NOT_LOGIN("000121", "没有登录"),
    AUTH_NO_AUTHORITY("000122", "没有权限"),


    ERROR_PARAM("000200", "参数有误"),
    ERROR_DATA_NOT_EXISTS("000201", "数据不存在"),
    ERROR_DATA_REFUSE("000202", "无权操作此数据"),

    DB_INSERT_RESULT_0("000300","数据库操作,insert返回0"),
    DB_UPDATE_RESULT_0("000301","数据库操作,update返回0"),
    DB_SELECTONE_IS_NULL("000302","数据库操作,selectOne返回null"),
    DB_LIST_IS_NULL("000303","数据库操作,list返回null"),

    ERROR_SEND("000400", "连接服务器出错"),

    ERROR_QUEUE("000501","向队列中添加数据失败"),

    ERROR_FILE_NOT_FIND("010000", "找不到文件"),
    API_NOT_EXISTS("020000", "API不存在"),

    ERROR_MISSING_PARAMETERS("900001","缺少必要参数"),
    ERROR_PARAM_TYPE("900002","参数类型错误"),
    ERROR_SYSTEM("999999", "系统出错")
    ;

    protected String code;
    protected String desc;

    ErrorEnum(String code, String desc) {
        this.code = code;
        this.desc = desc;
    }

    public String getCode() {
        return code;
    }

    public String getDesc() {
        return desc;
    }

    public static ErrorEnum parse(String code) {
        for (ErrorEnum e : ErrorEnum.values()) {
            if (e.getCode().equals(code)) {
                return e;
            }
        }

        return null;
    }
}
