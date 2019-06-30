package com.oa.procedure.service.impl;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.service.BaseServiceImpl;
import com.oa.procedure.entity.ProcedureType;
import com.oa.procedure.mapper.ProcedureTypeMapper;
import com.oa.procedure.service.ProcedureTypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author huwenlong
 */
@Service
public class ProcedureTypeServiceImpl extends BaseServiceImpl<ProcedureType, ProcedureTypeMapper> implements ProcedureTypeService {

	@Override
	public Integer insert(ProcedureType procedureType) {
		procedureType.setOrder(baseMapper.selectAll(new PageCriteria<ProcedureType>()
				.setOrderBy("`order` `desc`")).get(0).getOrder() + 1);
		return baseMapper.insert(procedureType);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void updateOrder(ProcedureType procedureType, int offset) {
		int order = procedureType.getOrder();
		//查找旁边的流程类型
		ProcedureType sideType = baseMapper.selectAll(new Criteria()
				.injectCriterion("`order`", "=", order + offset + "")).get(0);
		//交换序号
		procedureType.setOrder(sideType.getOrder());
		sideType.setOrder(order);
		baseMapper.updateByPrimaryKeySelective(procedureType);
		baseMapper.updateByPrimaryKeySelective(sideType);
	}
}