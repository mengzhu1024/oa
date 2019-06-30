package com.oa.group.mapper;

import com.elementchain.base.mapper.BaseMapper;
import com.oa.group.entity.Group;
import com.oa.group.entity.GroupExt;
import org.apache.ibatis.annotations.Param;

import java.util.Map;

public interface GroupMapper extends BaseMapper<Group> {
	void insertGroupDocument(@Param("groupId") String groupId, @Param("documentId") String documentId);

	void deleteGroupEmployee(@Param("column") String column, @Param("id") String id);

	void insertGroupEmployee(@Param("groupId") String groupId, @Param("employeeId") String employeeId);

	GroupExt selectWithMember(String id);

	void removeDocument(Map<String, Object> map);
}