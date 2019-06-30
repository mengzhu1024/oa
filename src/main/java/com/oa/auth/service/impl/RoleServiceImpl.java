package com.oa.auth.service.impl;

import com.elementchain.base.service.BaseServiceImpl;
import com.oa.auth.entity.Role;
import com.oa.auth.mapper.RoleMapper;
import com.oa.auth.service.RoleService;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role, RoleMapper> implements RoleService {

	@Override
	public void batchLinkRight(String id, String[] rightIds) {
		baseMapper.clearRight(id);
		for (String rightId : rightIds) {
			Map<String, String> map = new HashMap<>(2);
			map.put("id", id);
			map.put("rightId", rightId);
			baseMapper.linkRight(map);
		}
	}
}