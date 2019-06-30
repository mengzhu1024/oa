package com.oa.procedure.controller;

import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.cache.CacheMap;
import com.oa.cache.service.CacheService;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.procedure.entity.ProcedureType;
import com.oa.procedure.service.ProcedureTypeService;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.thymeleaf.util.StringUtils;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/proc-type")
public class ProcedureTypeController {

	@Autowired
	private ProcedureTypeService procedureTypeService;
	
	@Autowired
	private CacheService cacheService;

	@RightAnnotation(name="查看流程类型", desc="这是查看流程类型的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("pageNum", pageNum);
		return PageEnum.PROCEDURE_TYPE_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/page")
	public Result page(PageCriteria<ProcedureType> pageCriteria) {
		return new Result<>(procedureTypeService.selectPage(pageCriteria.setOrderBy("`order`")));
	}

	@RightAnnotation(name="操作流程类型", desc="这是操作流程类型的权限")
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer pageNum) {
		if(!StringUtils.isEmpty(id)){
			model.addAttribute("procedureType", CacheMap.procedureTypeMap.get(id));
		}
		model.addAttribute("pageNum", pageNum);
		return PageEnum.OPERATE_PROCEDURE_TYPE.getPage();
	}

	@RequestMapping("/operate")
	public String operate(ProcedureType procedureType, Integer pageNum) {
		if(!StringUtils.isEmpty(procedureType.getId())){
			procedureTypeService.updateSelective(procedureType);
		}else{
			procedureType.setId(StringUtil.randomUUID());
			procedureTypeService.insert(procedureType);
		}
		//刷新ProcedureTypeMap
		cacheService.refreshProcedureTypeMap();
		return "redirect:/proc-type/admin?pageNum=" + pageNum;
	}

	@ResponseBody
	@RequestMapping("/update-order")
	public void updateOrder(ProcedureType procedureType, int offset) {
		procedureTypeService.updateOrder(procedureType, offset);
		//刷新ProcedureTypeMap
		cacheService.refreshProcedureTypeMap();
	}
}
