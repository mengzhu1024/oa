package com.oa.member.service.impl;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseServiceImpl;
import com.elementchain.cache.annotations.EnableCache;
import com.oa.member.entity.Position;
import com.oa.member.entity.PositionExt;
import com.oa.member.mapper.PositionMapper;
import com.oa.member.service.PositionService;
import org.springframework.stereotype.Service;

@EnableCache(key = "position", expire = 120000)
@Service
public class PositionServiceImpl extends BaseServiceImpl<Position, PositionMapper> implements PositionService {

	@Override
	public PageResult<PositionExt> selectExtPage(PageCriteria<PositionExt> positionCriteria) {
		return PageResult.getCurrentPageResult(baseMapper.selectExtPage(positionCriteria));
	}
}