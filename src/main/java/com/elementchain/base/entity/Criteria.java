package com.elementchain.base.entity;

import com.alibaba.fastjson.JSON;
import org.springframework.util.StringUtils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * @author wenlong
 */
public class Criteria implements Serializable{

	private static final long serialVersionUID = 1L;
	
	/**
	 * 查询条件
	 */
	private List<Criterion> criteria = new ArrayList<>();
	
	/**
	 * 排序方式
	 */
	private String orderBy;

	/**
	 * 数量限制
	 */
	private Integer limit;

	/**
	 * 通过criterion对象添加条件
	 * @param criterion 条件
	 * @return 自身
	 */
	public Criteria addCriterion(Criterion criterion) {
		criteria.add(criterion);
		return this;
	}

	/**
	 * 注入条件
	 * @param param 列名
	 * @param relation 判断关系
	 * @param value 判断值
	 * @return
	 */
	public Criteria injectCriterion(String param, String relation, String value) {
		criteria.add(new Criterion(param, relation, value));
		return this;
	}

	/**
	 * 拼接条件
	 * @param param 列名
	 * @param relation 判断关系
	 * @param value 判断值
	 * @return 自身
	 */
	public Criteria concatCriterion(String param, String relation, String value) {
		criteria.add(new Criterion(param, relation, value, false));
		return this;
	}
	
	public List<Criterion> getCriteria() {
		return criteria;
	}

	public void setCriteria(List<Criterion> criteria) {
		this.criteria = criteria;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public Criteria setOrderBy(String orderBy) {
		this.orderBy = orderBy;
		return this;
	}

	public Integer getLimit() {
		return limit;
	}

	public Criteria setLimit(Integer limit) {
		this.limit = limit;
		return this;
	}

	@Override
	public String toString() {
		return JSON.toJSONString(this);
	}
}
