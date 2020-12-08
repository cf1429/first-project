package com.using.cms.aspect;

import com.using.cms.bean.BusinessException;
import com.using.cms.util.ErrorEnum;
import com.using.cms.util.JsonResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * controller 增强器
 *
 */
//@ControllerAdvice
public class ControllerExceptionAdvice {
	private static final Logger LOGGER = LoggerFactory.getLogger(ControllerExceptionAdvice.class);

    /**
     * 全局异常捕捉处理
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public JsonResult<String> errorHandler(Exception ex) {
    	LOGGER.error(ex.getMessage(), ex);
		JsonResult<String> jsonResult = new JsonResult<>();
		jsonResult.setErrorMessage(ErrorEnum.ERROR_SYSTEM,"系统错误");
        return jsonResult;
    }
    
    /**
     * 拦截捕捉自定义异常 BusinessException.class
     * @param ex
     * @return
     */
    @ResponseBody
    @ExceptionHandler(value = BusinessException.class)
    public JsonResult<String> myErrorHandler(BusinessException ex) {
    	JsonResult<String> jsonResult = new JsonResult<>();
		jsonResult.setErrorMessage(ex.getErrorEnum(),ex.getMessage());
        return jsonResult;
    }
 

}
