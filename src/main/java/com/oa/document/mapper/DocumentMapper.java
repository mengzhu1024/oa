package com.oa.document.mapper;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.mapper.BaseMapper;
import com.oa.document.entity.Document;
import com.oa.document.entity.DocumentExt;

import java.util.List;
import java.util.Map;

public interface DocumentMapper extends BaseMapper<Document> {
	List<DocumentExt> selectExtPage(PageCriteria<DocumentExt> documentCriteria);

	List<DocumentExt> selectWithGroup(String documentIds);

	List<String> selectCanOperateIds(Map<String, Object> map);
}