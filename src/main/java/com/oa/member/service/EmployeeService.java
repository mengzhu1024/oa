package com.oa.member.service;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseService;
import com.oa.member.entity.Employee;
import com.oa.member.entity.EmployeeExt;

public interface EmployeeService extends BaseService<Employee> {
	EmployeeExt validLoginer(String account, String password);

	PageResult<EmployeeExt> selectExtPage(PageCriteria<EmployeeExt> pageCriteria);

	void authorize(String id, String[] roleIds);

	EmployeeExt selectWithGroup(String id);
}