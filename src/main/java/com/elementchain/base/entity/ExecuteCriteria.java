package com.elementchain.base.entity;

/**
 * @author wenlong
 */
public class ExecuteCriteria<T> extends Criteria {

	private static final long serialVersionUID = 1L;
	/**
	 * 需要修改成的对象
	 */
	private T t;

	public ExecuteCriteria() {

	}

	public ExecuteCriteria(T t) {
		this.t = t;
	}

	public T getT() {
		return t;
	}

	/**
	 * 通过criterion对象添加条件
	 * @param criterion 条件
	 * @return 自身
	 */
	@Override
	public ExecuteCriteria<T> addCriterion(Criterion criterion) {
		super.addCriterion(criterion);
		return this;
	}

	/**
	 * 注入条件
	 * @param param 列名
	 * @param relation 判断条件
	 * @param value 判断值
	 * @return
	 */
	@Override
	public ExecuteCriteria<T> injectCriterion(String param, String relation, String value) {
		//考虑到执行修改操作的时候修改的字段也是参数，计算参数注入位置不方便，这里做虚假的参数注入，底层仍然通过字符串拼接。
		super.concatCriterion(param, relation, "'" + value + "'");
		return this;
	}

	/**
	 * 拼接条件
	 * @param param 列名
	 * @param relation 判断条件
	 * @param value 判断值
	 * @return
	 */
	@Override
	public ExecuteCriteria<T> concatCriterion(String param, String relation, String value) {
		super.concatCriterion(param, relation, value);
		return this;
	}
}
