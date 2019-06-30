package com.oa.member.service.impl;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.enums.OperateEnum;
import com.elementchain.base.service.BaseServiceImpl;
import com.elementchain.cache.annotations.DelectCache;
import com.elementchain.cache.annotations.EnableCache;
import com.elementchain.cache.annotations.SelectCache;
import com.oa.log.annotations.EnableLog;
import com.oa.log.annotations.RecordLog;
import com.oa.member.entity.Employee;
import com.oa.member.entity.EmployeeExt;
import com.oa.member.mapper.EmployeeMapper;
import com.oa.member.service.EmployeeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.Map;

/**
 * @author huwenlong
 */
@EnableLog(target = "employee", logEnums = {OperateEnum.ADD, OperateEnum.DELETE, OperateEnum.UPDATE})
@EnableCache(key = "employee", expire = 120000)
@Service
public class EmployeeServiceImpl extends BaseServiceImpl<Employee, EmployeeMapper> implements EmployeeService {

    @SelectCache
    @Override
    public EmployeeExt validLoginer(String account, String password) {
        Map<String, String> map = new HashMap<>();
        map.put("account", account);
        map.put("password", password);
        return baseMapper.validLoginer(map);
    }

    @Override
    public PageResult<EmployeeExt> selectExtPage(PageCriteria<EmployeeExt> pageCriteria) {
        try {
            return PageResult.getCurrentPageResult(baseMapper.selectExtPage(pageCriteria));
        }catch (Exception e) {
            return null;
        }
    }

    @RecordLog(operate = "删除员工")
    @Override
    public Integer delete(Employee employee) {
        employee.setStatus(false);
        return baseMapper.updateByPrimaryKeySelective(employee);
    }

    @RecordLog(operate = "批量删除员工")
    @Override
    public Integer batchDelete(Employee[] employees) {
        for(Employee employee: employees){
            employee.setStatus(false);
            baseMapper.updateByPrimaryKeySelective(employee);
        }
        return 0;
    }

    @Override
    @DelectCache
    @Transactional(rollbackFor = Exception.class)
    public void authorize(String id, String[] roleIds) {
        baseMapper.clearRole(id);
        for(String roleId: roleIds){
            Map<String, String> map = new HashMap<>(2);
            map.put("id", id);
            map.put("roleId", roleId);
            baseMapper.linkRole(map);
        }
    }

    @Override
    public EmployeeExt selectWithGroup(String id) {
        return baseMapper.selectWithGroup(id);
    }
}