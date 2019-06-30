package com.oa.member.controller;

import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.annotations.TokenAnnotation;
import com.oa.cache.CacheMap;
import com.oa.cache.service.CacheService;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.domain.enums.ResultEnum;
import com.oa.member.entity.Department;
import com.oa.member.entity.DepartmentExt;
import com.oa.member.entity.Employee;
import com.oa.member.service.DepartmentService;
import com.oa.utils.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * @author wenlong
 */
@Slf4j
@Controller
@RequestMapping("/dep")
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private CacheService cacheService;

	@RightAnnotation(name="查看部门", desc="这是查看部门的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("pageNum", pageNum);
		return PageEnum.DEPARTMENT_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/page")
	public Result page(PageCriteria<Department> pageCriteria) {
		return new Result<>(departmentService.selectPage(pageCriteria));
    }

	@RightAnnotation(name="操作部门", desc="这是操作部门的权限")
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer pageNum) {
		if(!StringUtils.isEmpty(id)){
			model.addAttribute("department", CacheMap.departmentMap.get(id));
		}
		model.addAttribute("pageNum", pageNum);
		return PageEnum.OPERATE_DEPARTMENT.getPage();
	}

	@TokenAnnotation(targetUrl="/dep/admin?pageNum=1")
	@RequestMapping("/operate")
	public String operate(Department department, Integer pageNum) {
		try {
			if(!StringUtils.isEmpty(department.getId())){
				departmentService.update(department);
			}else{
				department.setId(StringUtil.randomUUID());
				departmentService.insert(department);
			}
		}catch (Exception e) {
			log.error("operate method error, department:{}, e:", department, e);
		}

		//刷新DepartmentMap
		cacheService.refreshDempartmentMap();
		return "redirect:/dep/admin?pageNum=" + pageNum;
	}
	
	@RightAnnotation(name="批量更新部门", desc="这是批量更新部门的权限")
	@ResponseBody
	@RequestMapping("/batch-update")
	public Result batchUpdate(@RequestBody Department[] departments) {
		departmentService.batchUpdate(departments);
		//刷新DepartmentMap
		cacheService.refreshDempartmentMap();
		return new Result<>(ResultEnum.DEFAULT_SUCCESS);
	}

	@RightAnnotation(name="删除部门", desc="这是删除部门的权限，包括批量删除")
	@ResponseBody
	@RequestMapping("/delete")
	public Result delete(@RequestBody Department[] departments) {
		if(departments.length == 1){
			departmentService.delete(departments[0]);
		}else{
			departmentService.batchDelete(departments);
		}
		//刷新DepartmentMap
		cacheService.refreshDempartmentMap();
		return Result.result(ResultEnum.DEFAULT_SUCCESS);
	}

	@ResponseBody
	@GetMapping("/list-with-group-pos")
	public Result listWithGroupAndPos() {
		return new Result<>(CacheMap.departmentMap.values());
	}

	@ResponseBody
	@GetMapping("/list-with-emp")
	public Result listWithEmployee() {
		return new Result<>(departmentService.selectWithEmployee());
	}
	@ResponseBody
	@GetMapping("/loginer-dep")
	public Result getLoginerDepartment(HttpSession session) {
		return new Result<>(CacheMap.departmentMap.get(((Employee)session.getAttribute("loginer")).getDepId()));
	}
}
