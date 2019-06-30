package com.oa;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.oa.member.entity.Department;
import com.oa.member.entity.Employee;
import com.oa.member.service.DepartmentService;
import com.oa.member.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class TestMember {

	@Autowired
	private EmployeeService employeeService;

	@Test
	public void selectPage() {
		PageResult<Employee> pageResult = employeeService.selectPage(new PageCriteria<Employee>().injectCriterion("name", "like", "张%"));
		System.out.println(pageResult);
	}

}
