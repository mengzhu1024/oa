package com.oa.member.controller;

import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.cache.CacheMap;
import com.oa.cache.service.CacheService;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.domain.enums.ResultEnum;
import com.oa.member.entity.Position;
import com.oa.member.entity.PositionExt;
import com.oa.member.service.PositionService;
import com.oa.utils.StringUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

/**
 * @author wenlong
 */
@Slf4j
@Controller
@RequestMapping("/pos")
public class PositionController {

	@Autowired
	private PositionService positionService;

	@Autowired
	private CacheService cacheService;

	@RightAnnotation(name="查看职位", desc="这是查看职位的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("departmentMap", CacheMap.departmentMap);
		model.addAttribute("pageNum", pageNum);
		return PageEnum.POSITION_ADMIN.getPage();
	}

	@ResponseBody
	@PostMapping("/page")
	public Result page(PageCriteria<PositionExt> pageCriteria) {
		return new Result<>(positionService.selectExtPage(pageCriteria));
	}

	@RightAnnotation(name="操作职位", desc="这是操作职位的权限")
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer pageNum) {
		if(!StringUtils.isEmpty(id)){
			model.addAttribute("position", positionService.selectByPrimaryKey(id));
		}
		model.addAttribute("departmentMap", CacheMap.departmentMap);
		model.addAttribute("pageNum", pageNum);
		return PageEnum.OPERATE_POSITION.getPage();
	}

	@RequestMapping("/operate")
	public String operate(Position position, Integer pageNum) {
		position.setDepId(!StringUtils.isEmpty(position.getDepId())? position.getDepId(): null);
		try {
			if(!StringUtils.isEmpty(position.getId())){
				positionService.update(position);
			}else{
				position.setId(StringUtil.randomUUID());
				positionService.insert(position);
			}
		}catch (Exception e) {
			log.error("operate method error, e:", e);
		}

		//刷新部门扩展类Map
		cacheService.refreshDempartmentMap();
		//如果操作的职位不包含bumenID，刷新NotLinkDepartmentPositionMap
		if(StringUtils.isEmpty(position.getDepId())){
			cacheService.refreshNotLinkDepartmentPositionMap();
		}
		return "redirect:/pos/admin?pageNum=" + pageNum;
	}

	@RightAnnotation(name="批量更新职位", desc="这是批量更新职位的权限")
	@ResponseBody
	@RequestMapping("/batch-update")
	public Result batchUpdate(@RequestBody Position[] positions) {
		positionService.batchUpdate(positions);
		//刷新部门扩展类Map
		cacheService.refreshDempartmentMap();
		return new Result<>(ResultEnum.DEFAULT_SUCCESS);
	}

	@RightAnnotation(name="删除职位", desc="这是删除职位的权限，包括批量删除")
	@RequestMapping("/delete")
	@ResponseBody
	public Result delete(@RequestBody Position[] positions) {
		try {
			if(positions.length == 1){
				positionService.delete(positions[0]);
			}else{
				positionService.batchDelete(positions);
			}
			//刷新部门扩展类Map
			cacheService.refreshDempartmentMap();
			//刷新NotLinkDepartmentPositionMap
			cacheService.refreshNotLinkDepartmentPositionMap();
			return new Result<>(ResultEnum.DEFAULT_SUCCESS);
		}catch (Exception e) {
			log.error("delete method error, e:", e);
			return new Result<>(ResultEnum.SYSTEM_ERROR);
		}
	}
}
