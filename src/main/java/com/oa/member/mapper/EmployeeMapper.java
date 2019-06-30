package com.oa.member.mapper;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.mapper.BaseMapper;
import com.oa.member.entity.Employee;
import com.oa.member.entity.EmployeeExt;

import java.util.List;
import java.util.Map;

public interface EmployeeMapper extends BaseMapper<Employee> {

	EmployeeExt validLoginer(Map<String, String> map);

	//查询扩展类
	List<EmployeeExt> selectExtPage(PageCriteria<EmployeeExt> employeeCriteria);

	void clearRole(String id);

	void linkRole(Map<String, String> map);

	EmployeeExt selectWithGroup(String id);
}