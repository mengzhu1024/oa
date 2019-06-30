package com.oa.interceptor;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.oa.annotations.NoLoginAnnotation;
import com.oa.domain.Result;
import com.oa.domain.enums.ResultEnum;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.oa.annotations.TokenAnnotation;
import com.oa.auth.entity.Right;
import com.oa.cache.CacheMap;
import com.oa.member.entity.EmployeeExt;
import com.oa.utils.TokenProcessor;

@Slf4j
public class RightInterceptor implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest request,
								HttpServletResponse response, Object obj, Exception exception)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response,
						   Object obj, ModelAndView model) throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
							 Object handler) throws Exception {
		//校验Token
		if (handler instanceof HandlerMethod) {
			Method method = ((HandlerMethod) handler).getMethod();
			TokenAnnotation tokenAnnotation = method.getAnnotation(TokenAnnotation.class);
			if(tokenAnnotation != null){
				if(TokenProcessor.getInstance().isTokenValid(request)){
					TokenProcessor.getInstance().resetToken(request);
				}else{
					request.setAttribute("errorInfo", tokenAnnotation.errorInfo());
					request.getRequestDispatcher(tokenAnnotation.targetUrl()).forward(request, response);
					return false;
				}
			}
			String url = request.getRequestURI();
			// 判断是否有NoLogin注解
			NoLoginAnnotation noLoginAnnotation = method.getAnnotation(NoLoginAnnotation.class);
			EmployeeExt loginer = (EmployeeExt) request.getSession().getAttribute("loginer");
			if(noLoginAnnotation == null) {
				if(loginer == null){
					request.setAttribute("loginInfo", "***请先登录再进行操作***");
					request.getRequestDispatcher("/").forward(request, response);
					return false;
				}
			}

			Right right = CacheMap.rightMap.get(url);
			if(right == null || right.getCommon()){
				return true;
			}else{
				//判断是否是超级管理员
				if(loginer.isSupper()){
					return true;
				}else{
					if(loginer.hasRight(right)){
						return true;
					}else{
						sendAuthError(response);
						return false;
					}
				}
			}
		}
		// 如果不是方法直接返回
		return true;
	}

	private void sendAuthError(HttpServletResponse response) {
		try {
			response.getWriter().write(JSON.toJSONString(Result.result(ResultEnum.PERMISSION_DENIED)));
		} catch (IOException e) {
			log.error("sendAuthError method error, e:", e);
		}
	}
}
