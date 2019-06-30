package com.elementchain.handler;

import com.oa.domain.Result;
import com.oa.domain.enums.ResultEnum;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 全集异常处理
 * @author jiguang.qi
 * @date 2018/7/20
 */

@Slf4j
@ControllerAdvice
public class RestExceptionHandler {

	@ExceptionHandler(Exception.class)
	@ResponseBody
	public Result controllerException(Exception e) {
		log.error("system error:", e);
		//设置响应状态码
		return Result.result(ResultEnum.SYSTEM_ERROR);
	}
}