package com.elementchain.base.entity;

import java.io.Serializable;

/**
 * @author wenlong
 */
public class PageCriteria<T> extends Criteria implements Serializable{

	private static final long serialVersionUID = 1L;
	/**
	 * 查询页码
	 */
	private Integer pageNum = 1;

	/**
	 * 每页大小
	 */
	private Integer pageSize = 10;

	@Override
	public PageCriteria<T> setOrderBy(String orderBy) {
		super.setOrderBy(orderBy);
		return this;
	}


	public Integer getPageNum() {
		return pageNum;
	}

	public PageCriteria<T> setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
		return this;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public PageCriteria<T> setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
		return this;
	}

	/**
	 * 通过criterion对象添加条件
	 * @param criterion 条件
	 * @return 自身
	 */
	@Override
	public PageCriteria<T> addCriterion(Criterion criterion) {
		super.addCriterion(criterion);
		return this;
	}

	/**
	 * 注入条件
	 * @param param 列名
	 * @param relation 判断关系
	 * @param value 判断值
	 * @return
	 */
	@Override
	public PageCriteria<T> injectCriterion(String param, String relation, String value) {
		super.injectCriterion(param, relation, value);
		return this;
	}

	/**
	 * 拼接条件
	 * @param param 列名
	 * @param relation 判断关系
	 * @param value 判断值
	 * @return
	 */
	@Override
	public PageCriteria<T> concatCriterion(String param, String relation, String value) {
		super.concatCriterion(param, relation, value);
		return this;
	}
}
