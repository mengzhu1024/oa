package com.elementchain.base.entity;

/**
 * @author wenlong
 */
public class ShadowCriteria<E> extends Criteria {

	/**
	 * 投影查询需要的表名
	 */
	private String table;

	/**
	 * 投影查询需要的列名
	 */
	private String columns;

	public ShadowCriteria(String table, String columns) {
		this.table = table;
		this.columns = columns;
	}

	public String getTable() {
		return table;
	}

	public String getColumns() {
		return columns;
	}

	/**
	 * 通过criterion对象添加条件
	 * @param criterion 条件
	 * @return 自身
	 */
	@Override
	public ShadowCriteria<E> addCriterion(Criterion criterion) {
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
	public ShadowCriteria<E> injectCriterion(String param, String relation, String value) {
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
	public ShadowCriteria<E> concatCriterion(String param, String relation, String value) {
		super.concatCriterion(param, relation, value);
		return this;
	}

}
