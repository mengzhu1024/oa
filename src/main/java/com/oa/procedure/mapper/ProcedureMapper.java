package com.oa.procedure.mapper;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.mapper.BaseMapper;
import com.oa.procedure.entity.Procedure;
import com.oa.procedure.entity.ProcedureExt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProcedureMapper extends BaseMapper<Procedure> {
	List<ProcedureExt> selectExtPage(PageCriteria<ProcedureExt> procedureCriteria);

	List<ProcedureExt> selectWithNode(@Param("id") String id);
}