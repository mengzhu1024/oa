package com.oa.log.entity;

import com.elementchain.base.entity.PageCriteria;

import java.util.List;

public class LogCriteria extends PageCriteria<Log> {

	//封装需要查询的表名，切合分页插件
	private List<String> tableList;

	//封装查询的月份
	private Integer monthNum;

	public List<String> getTableList() {
		return tableList;
	}

	public void setTableList(List<String> tableList) {
		this.tableList = tableList;
	}

	public Integer getMonthNum() {
		return monthNum;
	}

	public void setMonthNum(Integer monthNum) {
		this.monthNum = monthNum;
	}
}
