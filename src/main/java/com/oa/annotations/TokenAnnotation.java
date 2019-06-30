package com.oa.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(value={ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
public @interface TokenAnnotation {
	String targetUrl() default "/WEB-INF/base/error.jsp";
	
	String errorInfo() default "您已提交，请关闭该页面";
}
