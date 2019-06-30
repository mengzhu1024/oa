package com.oa.cache.service.impl;

import com.elementchain.base.entity.Criteria;
import com.oa.auth.entity.Right;
import com.oa.auth.mapper.RightMapper;
import com.oa.cache.CacheMap;
import com.oa.cache.service.CacheService;
import com.oa.member.entity.DepartmentExt;
import com.oa.member.entity.Position;
import com.oa.member.mapper.DepartmentMapper;
import com.oa.member.mapper.PositionMapper;
import com.oa.procedure.entity.ProcedureType;
import com.oa.procedure.mapper.ProcedureTypeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CacheServiceImpl implements CacheService {
	
	@Autowired
	private RightMapper rightMapper;
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	@Autowired
	private PositionMapper positionMapper;
	
	@Autowired
	private ProcedureTypeMapper procedureTypeMapper;

	@Override
	public void refreshRightMap() {
		CacheMap.rightMap.clear();
		List<Right> rightList = rightMapper.selectAll(new Criteria().setOrderBy("pos, code"));
		for(Right right: rightList){
			CacheMap.rightMap.put(right.getUrl(), right);
		}
	}

	@Override
	public void refreshDempartmentMap() {
		CacheMap.departmentMap.clear();
		List<DepartmentExt> departmentList = departmentMapper.selectWithGroupAndPosition();
		for(DepartmentExt department: departmentList){
			CacheMap.departmentMap.put(department.getId(), department);
		}
	}

	@Override
	public void refreshNotLinkDepartmentPositionMap() {
		CacheMap.notLinkDepartmentPositionMap.clear();
		List<Position> positionList = positionMapper.selectAll(new Criteria().concatCriterion("dep_id", "is", "null"));
		for(Position position: positionList){
			CacheMap.notLinkDepartmentPositionMap.put(position.getId(), position);
		}
	}

	@Override
	public void refreshProcedureTypeMap() {
		CacheMap.procedureTypeMap.clear();
		List<ProcedureType> procedureTypeList = procedureTypeMapper.selectAll(new Criteria().setOrderBy("`order`"));
		for(ProcedureType procedureType: procedureTypeList){
			CacheMap.procedureTypeMap.put(procedureType.getId(), procedureType);
		}
	}
}
