package com.oa.auth.mapper;

import com.elementchain.base.mapper.BaseMapper;
import com.oa.auth.entity.Right;

public interface RightMapper extends BaseMapper<Right> {
	/**
	 * 查询当前权限位、权限码最大的权限
	 * @return 权限对象
	 */
	Right selectMaxRight();
}