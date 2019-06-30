package com.oa.log.entity;

import java.util.Date;

import com.oa.utils.StringUtil;
import lombok.Data;

@Data
public class Log {
	private String id;

	private String operator;

	private String operate;

	private String object;

	private Date opertime;

	private boolean success = true;

	private String errormes;

	@Override
	public String toString() {
		return "Log [id=" + id + ", operator=" + operator + ", operate=" + operate + ", target=" + object
				+ ", opertime=" + StringUtil.dateToString(opertime, "yyyy-MM-dd HH:mm:ss") + ", success=" + success + "]";
	}
}