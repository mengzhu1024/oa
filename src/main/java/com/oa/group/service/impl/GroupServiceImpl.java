package com.oa.group.service.impl;

import com.elementchain.base.service.BaseServiceImpl;
import com.elementchain.monitor.annotations.EnableMonitor;
import com.oa.document.entity.DocumentExt;
import com.oa.group.entity.Group;
import com.oa.group.entity.GroupExt;
import com.oa.group.mapper.GroupMapper;
import com.oa.group.service.GroupService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@EnableMonitor(logEnums = {})
@Service
public class GroupServiceImpl extends BaseServiceImpl<Group, GroupMapper> implements GroupService {

	@Override
	public void documentShare(String[] groupIds, List<DocumentExt> documentList) {
		for(String groupId: groupIds){
			for(DocumentExt document: documentList){
				//排除已经关联过的分组文件记录
				if(!document.getGroupIdList().contains(groupId)){
					baseMapper.insertGroupDocument(groupId, document.getId());
				}
			}
		}
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void devideGroup(String employeeId, String[] groupIds) {
		//给员工分组的时候先删掉员工所有的分组，然后批量插入
		baseMapper.deleteGroupEmployee("emp_id", employeeId);
		for(String groupId: groupIds){
			baseMapper.insertGroupEmployee(groupId, employeeId);
		}
	}

	@Override
	public GroupExt selectWithMember(String id) {
		return baseMapper.selectWithMember(id);
	}

	@Override
	public void removeDocument(String id, String[] documentIds) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		map.put("documentIds", documentIds);
		baseMapper.removeDocument(map);
	}

	@Override
	public void linkEmployee(String id, String[] employeeIds) {
		baseMapper.deleteGroupEmployee("group_id", id);
		for(String employeeId: employeeIds){
			baseMapper.insertGroupEmployee(id, employeeId);
		}
	}
}