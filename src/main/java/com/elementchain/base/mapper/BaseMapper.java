package com.elementchain.base.mapper;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.ExecuteCriteria;
import com.elementchain.base.entity.ShadowCriteria;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author wenlong
 */
public interface BaseMapper<T> {
	/**
	 * 添加对象
	 * @param entity 添加的对象
	 * @return 受影响的行数
	 */
	Integer insert(T entity);
	
	/**
	 * 添加对象
	 * @param entity 添加的对象
	 * @return 受影响的行数
	 */
	Integer insertSelective(T entity);

	/**
	 * 通过id修改对象
	 * @param entity 修改的对象
	 * @return 受影响的行数
	 */
	Integer updateByPrimaryKey(T entity);

	/**
	 * 通过id选择性修改对象
	 * @param entity 修改的对象
	 * @return 受影响的行数
	 */
	Integer updateByPrimaryKeySelective(T entity);

	/**
	 * 通过条件修改对象
	 * @param executeCriteria 封装修改条件和修改成的对象
	 * @return 受影响的行数
	 */
	Integer updateByCriteria(ExecuteCriteria<T> executeCriteria);

	/**
	 * 通过条件选择性修改对象
	 * @param executeCriteria 封装修改条件和修改成的对象
	 * @return 受影响的行数
	 */
	Integer updateByCriteriaSelective(ExecuteCriteria<T> executeCriteria);

	/**
	 * 通过主键删除对象
	 * @param t 删除的对象
	 * @return 受影响的行数
	 */
	Integer deleteByPrimaryKey(T t);

	/**
	 * 通过条件删除对象
	 * @param criteria 删除条件
	 * @return 受影响的行数
	 */
	Integer deleteByCriteria(Criteria criteria);

	/**
	 * 批量删除对象
	 * @param entities 删除对象
	 * @return 受影响的行数
	 */
	Integer batchDelete(T[] entities);

	/**
	 * 通过id查询
	 * @param id id值
	 * @return 查询结果
	 */
	T selectByPrimaryKey(Serializable id);

	/**
	 * 全部查询
	 * @return 查询结果
	 */
	List<T> selectAll();

	/**
	 * 条件查询
	 * @param criteria 查询条件
	 * @return 查询结果
	 */
	List<T> selectAll(Criteria criteria);

	/**
	 * 统计查询
	 * @param criteria 统计查询条件
	 * @return 查询结果
	 */
	Integer countByCriteria(Criteria criteria);

	/**
	 * 单列投影查询
	 * @param shadowCriteria 单列投影查询条件
	 * @return 查询结果
	 */
	<E> List<E> selectSingleShadow(ShadowCriteria<E> shadowCriteria);

	/**
	 * 多列投影查询
	 * @param shadowCriteria 多列投影查询条件
	 * @return 查询结果
	 */
	List<Map<String, Object>> selectMutipleShadow(ShadowCriteria<?> shadowCriteria);
}
