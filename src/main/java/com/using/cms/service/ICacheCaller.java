package com.using.cms.service;

public interface ICacheCaller {
    /**
     * 结合当时取值场景进行查库或者其它赋值操作
     * @return
     */
    public Object Call();
}
