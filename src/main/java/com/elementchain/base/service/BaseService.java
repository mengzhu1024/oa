package com.elementchain.base.service;

import com.elementchain.base.entity.*;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author wenlong
 */
public interface BaseService<T> {
	/**
	 * 添加对象
	 * @param entity 添加的对象
	 * @return 受影响的行数
	 */
	Integer insert(T entity);

	/**
	 * 选择性添加对象
	 * @param entity 添加的对象
	 * @return 受影响的行数
	 */
	Integer insertSelective(T entity);

	/**
	 * 通过id修改对象
	 * @param entity 修改的对象
	 * @return 受影响的行数
	 */
	Integer update(T entity);

	/**
	 * 通过id选择性修改对象
	 * @param entity 修改的对象
	 * @return 受影响的行数
	 */
	Integer updateSelective(T entity);

	/**
	 * 通过主键删除对象
	 * @param t 删除的对象
	 * @return 受影响的行数
	 */
	Integer delete(T t);

	/**
	 * 通过条件选择性修改对象
	 * @param executeCriteria 封装修改条件和修改成的对象
	 * @return 受影响的行数
	 * 
	 */
	Integer updateByCriteria(ExecuteCriteria<T> executeCriteria);

	/**
	 * 通过条件选择性修改对象
	 * @param executeCriteria 封装修改条件和修改成的对象
	 * @return 受影响的行数
	 * 
	 */
	Integer updateByCriteriaSelective(ExecuteCriteria<T> executeCriteria);

	/**
	 * 通过条件删除对象
	 * @param criteria 删除条件
	 * @return 受影响的行数
	 * 
	 */
	Integer deleteByCriteria(Criteria criteria);

	/**
	 * 批量添加
	 * @param entities 批量添加的对象
	 * @return 受影响的行数
	 * 
	 */
	void batchInsert(T[] entities);

	/**
	 * 选择性批量添加
	 * @param entities 批量添加的对象
	 * @return 受影响的行数
	 * 
	 */
	void batchInsertSelective(T[] entities);

	/**
	 * 批量修改
	 * @param entities 批量修改的对象
	 * @return 受影响的行数
	 * 
	 */
	void batchUpdate(T[] entities);

	/**
	 * 选择性批量修改
	 * @param entities 批量修改的对象
	 * @return 受影响的行数
	 * 
	 */
	void batchUpdateSelective(T[] entities);

	/**
	 * 批量删除
	 * @param entities 批量删除的的对象
	 * 
	 */
	Integer batchDelete(T[] entities);

	/**
	 * id查询
	 * @param id 查询对象的id
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
	List<T> selectCondition(Criteria criteria);

	/**
	 * 分页查询
	 * @param pageCriteria 查询条件
	 * @return 查询结果
	 */
	PageResult<T> selectPage(PageCriteria<T> pageCriteria);

	/**
	 * 统计查询
	 * @param criteria 统计查询条件
	 * @return 查询结果
	 */
	Integer countByCriteria(Criteria criteria) ;

	/**
	 * 单列投影查询
	 * @param shadowCriteria 单列投影查询条件
	 * @return 查询结果
	 */
	<E> List<E> selectSingleShadow(ShadowCriteria<E> shadowCriteria);

	/**
	 * 多列投影查询
	 * @param shadowCriteria 查询条件
	 * @return 查询结果
	 */
	List<Map<String, Object>> selectMutipleShadow(ShadowCriteria shadowCriteria);
}
