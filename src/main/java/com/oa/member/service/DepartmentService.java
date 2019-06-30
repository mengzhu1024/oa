package com.oa.member.service;

import com.elementchain.base.service.BaseService;
import com.oa.member.entity.Department;
import com.oa.member.entity.DepartmentExt;

import java.util.List;

public interface DepartmentService extends BaseService<Department> {
	List<DepartmentExt> selectWithEmployee();
}