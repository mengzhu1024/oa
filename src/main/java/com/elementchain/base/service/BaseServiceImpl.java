package com.elementchain.base.service;

import com.elementchain.base.entity.*;
import com.elementchain.base.mapper.BaseMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * @author wenlong
 */
@Slf4j
public abstract class BaseServiceImpl<T, E extends BaseMapper<T>> implements BaseService<T> {

	@Autowired
	protected E baseMapper;

//	protected E batchMapper;
//
//	@Resource(name = "batchSqlSession")
//	private SqlSession batchSqlSession;
//
//	@PostConstruct
//	protected void initMapper() {
//		this.batchMapper = batchSqlSession.getMapper(getMapperClass());
//	}

	@Override
	public Integer insert(T entity){
		try {
			return baseMapper.insert(entity);
		}catch (Exception e) {
			log.error("insert method error, entity:{}, e:", entity, e);
			return -1;
		}
	}

	@Override
	public Integer insertSelective(T entity) {
		try {
			return baseMapper.insertSelective(entity);
		}catch (Exception e) {
			log.error("insertSelective method error, entity:{}, e:", entity, e);
			return -1;
		}
	}

	@Override
	public Integer update(T entity) {
		try {
			return baseMapper.updateByPrimaryKey(entity);
		}catch (Exception e) {
			log.error("update method error, entity:{}, e:", entity, e);
			return -1;
		}
	}

	@Override
	public Integer updateSelective(T entity) {
		try {
			return baseMapper.updateByPrimaryKeySelective(entity);
		}catch (Exception e) {
			log.error("updateSelective method error, entity:{}, e:", entity, e);
			return -1;
		}
	}

	@Override
	public Integer delete(T t) {
		try {
			return baseMapper.deleteByPrimaryKey(t);
		}catch (Exception e) {
			log.error("delete method error, entity:{}, e:", t, e);
			return -1;
		}
	}

	@Override
	public Integer updateByCriteria(ExecuteCriteria<T> executeCriteria) {
		try {
			return baseMapper.updateByCriteria(executeCriteria);
		}catch (Exception e) {
			log.error("updateByCriteria method error, executeCriteria:{}, e:", executeCriteria, e);
			return -1;
		}
	}

	@Override
	public Integer updateByCriteriaSelective(ExecuteCriteria<T> executeCriteria) {
		try {
			return baseMapper.updateByCriteriaSelective(executeCriteria);
		}catch (Exception e) {
			log.error("updateByCriteriaSelective method error, executeCriteria:{}, e:", executeCriteria, e);
			return -1;
		}
	}

	@Override
	public Integer deleteByCriteria(Criteria criteria) {
		try {
			return baseMapper.deleteByCriteria(criteria);
		}catch (Exception e) {
			log.error("deleteByCriteria method error, criteria:{}, e:", criteria, e);
			return -1;
		}
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void batchInsert(T[] entities) {
		for (T entity : entities) {
			baseMapper.insert(entity);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void batchInsertSelective(T[] entities) {
		for (T entity : entities) {
			baseMapper.insertSelective(entity);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void batchUpdate(T[] entities) {
		for (T entity : entities) {
			baseMapper.updateByPrimaryKey(entity);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void batchUpdateSelective(T[] entities) {
		for (T entity : entities) {
			baseMapper.updateByPrimaryKeySelective(entity);
		}
	}

	@Override
	public Integer batchDelete(T[] entities) {
		return baseMapper.batchDelete(entities);
	}

	@Override
	public T selectByPrimaryKey(Serializable id) {
		try {
			return baseMapper.selectByPrimaryKey(id);
		}catch (Exception e) {
			log.error("selectByPrimaryKey method error, id:{}, e:", id, e);
			return null;
		}
	}

	@Override
	public List<T> selectAll() {
		try {
			return baseMapper.selectAll();
		}catch (Exception e) {
			log.error("selectAll method error, e:", e);
			return null;
		}
	}

	@Override
	public List<T> selectCondition(Criteria criteria) {
		try {
			return baseMapper.selectAll(criteria);
		}catch (Exception e) {
			log.error("selectCondition method error, criteria:{}, e:", criteria, e);
			return null;
		}
	}

	@Override
	public PageResult<T> selectPage(PageCriteria<T> entityCriteria) {
		try {
			return PageResult.getCurrentPageResult(baseMapper.selectAll(entityCriteria));
		}catch (Exception e) {
			log.error("selectPage method error, entityCriteria:{}, e:", entityCriteria, e);
			return null;
		}
	}

	@Override
	public Integer countByCriteria(Criteria criteria) {
		try {
			return baseMapper.countByCriteria(criteria);
		}catch (Exception e) {
			log.error("countByCriteria method error, criteria:{}, e:", criteria, e);
			return -1;
		}
	}

	@Override
	public <F> List<F> selectSingleShadow(ShadowCriteria<F> shadowCriteria) {
		try {
			return baseMapper.selectSingleShadow(shadowCriteria);
		}catch (Exception e) {
			log.error("selectSingleShadow method error, shadowCriteria:{}, e:", shadowCriteria, e);
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> selectMutipleShadow(ShadowCriteria shadowCriteria) {
		try {
			return baseMapper.selectMutipleShadow(shadowCriteria);
		}catch (Exception e) {
			log.error("selectMutipleShadow method error, shadowCriteria:{}, e:", shadowCriteria, e);
			return null;
		}
	}

//	private Class<E> getMapperClass() {
//		return (Class<E>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1];
//	}
}
