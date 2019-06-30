package com.oa.work.controller;

import com.elementchain.base.entity.ExecuteCriteria;
import com.elementchain.base.entity.PageCriteria;
import com.oa.cache.CacheMap;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.member.entity.EmployeeExt;
import com.oa.utils.StringUtil;
import com.oa.work.entity.Duty;
import com.oa.work.service.DutyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Date;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/duty")
public class DutyController {

	@Autowired
	private DutyService dutyService;
	
	@RequestMapping("/admin")
	public String admin(Model model, HttpSession session, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		//到任务管理界面的时候修改所有登录者需要执行的已发起的任务状态为已查看。
		EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
		Duty duty = new Duty();
		duty.setStatus(1);
		dutyService.updateByCriteriaSelective(new ExecuteCriteria<>(duty).concatCriterion("(executor, status)",
				"=", "('"+loginer.getName() + "("+loginer.getAccount()+")"+"', 0)"));
		model.addAttribute("pageNum", pageNum);
		return PageEnum.DUTY_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/page")
	public Result page(HttpSession session, PageCriteria<Duty> pageCriteria, String type) {
		pageCriteria.setOrderBy("launch_date desc");
		EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
		if(!loginer.isSupper()){
			//如果不是超级管理员，只能查看跟自己相关的任务
			if(type.equals("1")){
				//发起的任务
				pageCriteria.injectCriterion("sponsor", "=", loginer.getName() + "("+loginer.getAccount()+")");
			}else if(type.equals("2")){
				//执行的任务
				pageCriteria.injectCriterion("executor", "=", loginer.getName() + "("+loginer.getAccount()+")");
			}else{
				//和我相关的任务
				pageCriteria.injectCriterion("sponsor = '" + loginer.getName() + "("+loginer.getAccount()+
						")' or executor", "=", loginer.getName() + "("+loginer.getAccount()+")");
			}
		}
		return new Result<>(dutyService.selectPage(pageCriteria));
	}
	
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer pageNum, String type) {
		if(type.equals("launch")){
			//发起一个任务
			model.addAttribute("departmentMap", CacheMap.departmentMap);
		}else if(type.equals("check")){
			//查看任务
			model.addAttribute("duty", dutyService.selectByPrimaryKey(id));
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("type", type);
		return PageEnum.OPERATE_DUTY.getPage();
	}
	
	@RequestMapping("/operate")
	public String operate(Model model, Duty duty, Integer pageNum, String type) {
		if(type.equals("launch")){
			//执行发起任务
			duty.setId(StringUtil.randomUUID());
			duty.setLaunchDate(new Date());
			dutyService.insert(duty);
		}else if(type.equals("submit")){
			duty.setStatus(2);
			dutyService.updateSelective(duty);
		}else if(type.equals("complete")){
			duty.setStatus(3);
			dutyService.updateSelective(duty);
		}else if(type.equals("uncomplete")){
			duty.setStatus(4);
			dutyService.updateSelective(duty);
		}
		model.addAttribute("pageNum", pageNum);
		return PageEnum.DUTY_ADMIN.getPage();
	}
	
	@ResponseBody
	@RequestMapping("/delete")
	public void delete(@RequestBody Duty[] dutys) {
		dutyService.delete(dutys[0]);
	}
}