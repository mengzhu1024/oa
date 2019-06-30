package com.oa.group.service;

import com.elementchain.base.service.BaseService;
import com.oa.document.entity.DocumentExt;
import com.oa.group.entity.Group;
import com.oa.group.entity.GroupExt;

import java.util.List;

public interface GroupService extends BaseService<Group> {
	void documentShare(String[] groupIds, List<DocumentExt> documentList);
	
	void devideGroup(String employeeId, String[] groupIds);
	
	GroupExt selectWithMember(String id);
	
	void removeDocument(String id, String[] documentIds);
	
	void linkEmployee(String id, String[] employeeIds);
}
