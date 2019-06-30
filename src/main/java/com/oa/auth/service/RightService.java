package com.oa.auth.service;

import com.elementchain.base.service.BaseService;
import com.oa.auth.entity.Right;

import java.util.List;

public interface RightService extends BaseService<Right> {
	
	@Deprecated
	@Override
	void batchInsert(Right[] entities);

	Integer batchInsert(List<Right> rightList);
}
