package com.oa.member.service;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseService;
import com.oa.member.entity.Position;
import com.oa.member.entity.PositionExt;

public interface PositionService extends BaseService<Position> {
	PageResult<PositionExt> selectExtPage(PageCriteria<PositionExt> positionCriteria);
}