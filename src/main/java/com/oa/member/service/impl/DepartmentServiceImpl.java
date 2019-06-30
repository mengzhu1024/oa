package com.oa.member.service.impl;

import com.elementchain.base.service.BaseServiceImpl;
import com.elementchain.cache.annotations.EnableCache;
import com.oa.group.entity.Group;
import com.oa.group.service.GroupService;
import com.oa.member.entity.Department;
import com.oa.member.entity.DepartmentExt;
import com.oa.member.mapper.DepartmentMapper;
import com.oa.member.service.DepartmentService;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@EnableCache(key = "department", expire = 120000)
@Service
public class DepartmentServiceImpl extends BaseServiceImpl<Department, DepartmentMapper> implements DepartmentService {

	@Autowired
	private GroupService groupService;

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Integer insert(Department department) {
		baseMapper.insert(department);
		//添加4个分组
		Group[] groups = new Group[4];
		groups[0] = new Group();
		groups[0].setId(StringUtil.randomUUID());
		groups[0].setName(department.getName() + "下载文件分组");
		groups[0].setDesc("这是" + department.getName() + "下载文件的分组");
		groups[0].setType(0);
		groups[0].setDepId(department.getId());

		groups[1] = new Group();
		groups[1].setId(StringUtil.randomUUID());
		groups[1].setName(department.getName() + "删除文件分组");
		groups[1].setDesc("这是" + department.getName() + "删除文件的分组");
		groups[1].setType(1);
		groups[1].setDepId(department.getId());

		groups[2] = new Group();
		groups[2].setId(StringUtil.randomUUID());
		groups[2].setName(department.getName() + "修改文件分组");
		groups[2].setDesc("这是" + department.getName() + "修改文件的分组");
		groups[2].setType(2);
		groups[2].setDepId(department.getId());

		groups[3] = new Group();
		groups[3].setId(StringUtil.randomUUID());
		groups[3].setName(department.getName() + "预览文件分组");
		groups[3].setDesc("这是" + department.getName() + "预览文件的分组");
		groups[3].setType(3);
		groups[3].setDepId(department.getId());
		groupService.batchInsert(groups);
		return 0;
	}

	@Override
	public List<DepartmentExt> selectWithEmployee() {
		return baseMapper.selectWithEmployee();
	}
}