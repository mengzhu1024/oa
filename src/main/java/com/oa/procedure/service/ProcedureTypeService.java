package com.oa.procedure.service;

import com.elementchain.base.service.BaseService;
import com.oa.procedure.entity.ProcedureType;

/**
 * @author huwenlong
 */
public interface ProcedureTypeService extends BaseService<ProcedureType> {
	void updateOrder(ProcedureType procedureType, int offset);
}