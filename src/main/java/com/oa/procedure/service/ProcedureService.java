package com.oa.procedure.service;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseService;
import com.oa.procedure.entity.Procedure;
import com.oa.procedure.entity.ProcedureExt;

import java.util.List;

public interface ProcedureService extends BaseService<Procedure> {
	PageResult<ProcedureExt> selectExtPage(PageCriteria<ProcedureExt> procedureCriteria);
	
	void updateContent(Procedure procedure);
	
	List<ProcedureExt> selectWithNode(String id);
}