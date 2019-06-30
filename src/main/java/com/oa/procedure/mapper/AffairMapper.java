package com.oa.procedure.mapper;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.mapper.BaseMapper;
import com.oa.procedure.entity.Affair;
import com.oa.procedure.entity.AffairExt;

import java.util.List;

public interface AffairMapper extends BaseMapper<Affair> {
	List<AffairExt> selectExtPage(PageCriteria<AffairExt> procedureInstanceCriteria);

	AffairExt selectWithControl(String id);

	AffairExt selectWithProcess(String id);
}