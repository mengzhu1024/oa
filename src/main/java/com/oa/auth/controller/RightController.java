package com.oa.auth.controller;

import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.auth.entity.Right;
import com.oa.auth.service.RightService;
import com.oa.cache.service.CacheService;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/right")
public class RightController {

	@Autowired
	private RightService rightService;
	
	@Autowired
	private CacheService cacheService;
	
	@RightAnnotation(name="查看权限", desc="这是查看权限的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("pageNum", pageNum);
		return PageEnum.RIGHT_ADMIN.getPage();
	}
	
	@ResponseBody
	@PostMapping("/page")
	public Result page(PageCriteria<Right> pageCriteria) {
		pageCriteria.setOrderBy("pos, code");
		return new Result<>(rightService.selectPage(pageCriteria));
	}
	
	@ResponseBody
	@RequestMapping("/batch-update")
	@RightAnnotation(name="批量更新权限", desc="这是批量更新权限的权限")
	public void toBatchUpdate(@RequestBody Right[] rights) {
		rightService.batchUpdate(rights);
		cacheService.refreshRightMap();
	}
}
