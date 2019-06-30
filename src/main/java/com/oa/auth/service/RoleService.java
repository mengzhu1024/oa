package com.oa.auth.service;

import com.elementchain.base.service.BaseService;
import com.oa.auth.entity.Role;

public interface RoleService extends BaseService<Role> {

	public void batchLinkRight(String id, String[] rightIds);
}
