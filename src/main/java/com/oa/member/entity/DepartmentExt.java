package com.oa.member.entity;

import java.util.List;

import com.oa.group.entity.Group;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author huwenlong
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class DepartmentExt extends Department{

	private static final long serialVersionUID = 6615373050989741833L;

	public List<Group> groupList;
	
	public List<Employee> employeeList;
	
	public List<Position> positionList;
}
