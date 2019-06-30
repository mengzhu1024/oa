package com.oa.document.service;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseService;
import com.oa.document.entity.Document;
import com.oa.document.entity.DocumentExt;

import java.util.List;

public interface DocumentService extends BaseService<Document> {
	
	PageResult<DocumentExt> selectExtPage(PageCriteria<DocumentExt> documentCriteria);

	void setOperateable(String employeeId, List<DocumentExt> documentList);
	
	void batchInsert(List<Document> documentList, String[] groupIds);
	
	boolean hasExist(Document document);
	
	void clearTempDirectary();
	
	List<DocumentExt> selectWithGroup(String documentIds);
}