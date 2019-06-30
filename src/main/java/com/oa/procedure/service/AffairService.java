package com.oa.procedure.service;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseService;
import com.oa.member.entity.Employee;
import com.oa.procedure.entity.Affair;
import com.oa.procedure.entity.AffairExt;
import com.oa.procedure.entity.Attachment;
import com.oa.procedure.entity.Node;

import java.util.List;

public interface AffairService extends BaseService<Affair> {
	PageResult<AffairExt> selectExtPage(PageCriteria<AffairExt> procedureInstanceCriteria);
	
	void batchInsertAttachments(Attachment[] attachments);
	
	AffairExt selectWithControlsAndAttachments(String id);
	
	AffairExt selectWithProcesses(String id);

	void updateSelective(Affair instance, Employee handler, Node node);

	List<Attachment> selectAttachments(PageCriteria<Attachment> attachmentCriteria);

	/**
	 * 打回流程
	 * @param instance
	 */
	void revokeAffair(Affair instance);
}
