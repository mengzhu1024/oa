package com.oa.member.mapper;

import com.elementchain.base.mapper.BaseMapper;
import com.oa.member.entity.Department;
import com.oa.member.entity.DepartmentExt;

import java.util.List;

/**
 * @author huwenlong
 */
public interface DepartmentMapper extends BaseMapper<Department> {
	List<DepartmentExt> selectWithGroupAndPosition();

	List<DepartmentExt> selectWithEmployee();
}