package com.oa.log.controller;

import com.oa.annotations.RightAnnotation;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.log.entity.LogCriteria;
import com.oa.log.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/log")
public class LogController {
	@Autowired
	private LogService logService;

	@RightAnnotation(name = "查看日志", desc = "这是查看日志的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum){
		model.addAttribute("pageNum", pageNum);
		return PageEnum.LOG_ADMIN.getPage();
	}

	@ResponseBody
	@PostMapping("/page")
	public Result page(LogCriteria logCriteria) {
		return new Result<>(logService.selectPage(logCriteria));
	}
	
	@RequestMapping("/detail")
	public String detail(Model model, String id, Integer monthNum, Integer pageNum) {
		LogCriteria logCriteria = new LogCriteria();
		((LogCriteria) logCriteria.injectCriterion("t.id", "=", id)).setMonthNum(monthNum);
		model.addAttribute("log", logService.selectByPrimaryKey(logCriteria));
		model.addAttribute("monthNum", monthNum);
		model.addAttribute("pageNum", pageNum);
		return PageEnum.OPERATE_LOG.getPage();
	}
}
