package com.oa.member.mapper;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.mapper.BaseMapper;
import com.oa.member.entity.Position;
import com.oa.member.entity.PositionExt;

import java.util.List;

public interface PositionMapper extends BaseMapper<Position> {
	//查询扩展类
	List<PositionExt> selectExtPage(PageCriteria<PositionExt> positionCriteria);
}