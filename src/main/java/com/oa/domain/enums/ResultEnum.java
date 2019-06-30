package com.oa.domain.enums;

import lombok.Getter;

/**
 * @author huwenlong
 */

public enum ResultEnum {

	/**
	 * 返回状态码
	 */
	DEFAULT_SUCCESS(0, "默认无错误"),

	SYSTEM_ERROR(1, "系统异常"),
	LOGIN_PWD_ERROR(2, "用户名或密码错误"),
	ACCOUNT_HAS_EXISTS(3, "该账号已存在"),
	PHONE_HAS_EXISTS(4, "该手机号已存在"),

	PERMISSION_DENIED(200, "权限不足"),

	FORM_NAME_EXISTS(300, "表单名称已村庄"),
	;

	ResultEnum(Integer code, String desc) {
		this.code = code;
		this.desc = desc;
	}

	@Getter
	private Integer code;

	@Getter
	private String desc;

}
