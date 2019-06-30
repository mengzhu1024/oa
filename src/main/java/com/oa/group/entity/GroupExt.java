package com.oa.group.entity;

import lombok.Data;

import java.util.List;

@Data
public class GroupExt extends Group{
	public List<String> employeeIds;
}
