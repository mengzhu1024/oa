package com.elementchain.base.entity;

import com.alibaba.fastjson.JSON;

import java.io.Serializable;

/**
 * @author wenlong
 */
public class Criterion implements Serializable{
	private static final long serialVersionUID = 1L;
	/**
	 * 查询列名
	 */
	private String param;

	/**
	 * 查询方式
	 */
	private String relation;

	/**
	 * 查询的值
	 */
	private String value;

	/**
	 * 是否注入，默认为true
	 */
	private boolean injection = true; 

	public Criterion() {
	}

	public Criterion(String param, String relation, String value) {
		this.param = param;
		this.relation = relation;
		this.value = value;
	}

	public Criterion(String param, String relation, String value, boolean injection) {
		this.param = param;
		this.relation = relation;
		this.value = value;
		this.injection = injection;
	}

	public String getParam() {
		return param;
	}

	public Criterion setParam(String param) {
		this.param = param;
		return this;
	}

	public String getRelation() {
		return relation;
	}

	public Criterion setRelation(String relation) {
		this.relation = relation;
		return this;
	}

	public String getValue() {
		return value;
	}

	public Criterion setValue(String value) {
		if(relation.equals("like")) {
			value += "%";
		}
		//如果不是注入
		if(!injection){
			value = "'" + value + "'";
		}

		this.value = value;
		return this;
	}

	public boolean isInjection() {
		return injection;
	}

	public void setInjection(boolean injection) {
		this.injection = injection;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
}
