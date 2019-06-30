package com.oa.auth.mapper;

import com.elementchain.base.mapper.BaseMapper;
import com.oa.auth.entity.Role;

import java.util.Map;

public interface RoleMapper extends BaseMapper<Role> {
	void clearRight(String id);

	void linkRight(Map<String, String> map);
}