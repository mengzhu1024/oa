package com.oa.form.controller;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.cache.CacheMap;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.domain.enums.ResultEnum;
import com.oa.form.entity.Form;
import com.oa.form.service.FormService;
import com.oa.utils.CollectionUtil;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/form")
public class FormController {

	@Autowired
	private FormService formService;

	@RightAnnotation(name="查看表单", desc="这是查看表单的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("pageNum", pageNum);
		return PageEnum.FORM_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/page")
	public Result page(PageCriteria<Form> pageCriteria) {
		return new Result<>(formService.selectPage(pageCriteria));
	}

	@RightAnnotation(name="操作表单", desc="这是操作表单的权限")
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer pageNum) {
		if(!StringUtils.isEmpty(id)){
			model.addAttribute("form", formService.selectByPrimaryKey(id));
		}
		model.addAttribute("pageNum", pageNum);
		return PageEnum.OPERATE_FORM.getPage();
	}

	@ResponseBody
	@PostMapping("/operate")
	public String operate(Form form) {
		return formService.saveOrUpdate(form);
	}

	@RequestMapping("/his-version")
	public String hisVersion(Model model, String name, Integer pageNum) {
		model.addAttribute("formList", formService.selectHistory(name));
		model.addAttribute("pageNum", pageNum);
		return PageEnum.HISTORY_VERSION.getPage();
	}

	@RightAnnotation(name="设计表单", desc="这是设计表单的权限")
	@RequestMapping("/to-design")
	public String toDesign(Model model, String id, Integer pageNum, String type) {
		model.addAttribute("form", formService.selectWithContent(id));
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("controlTypeMap", CollectionUtil.controlTypeMap);
		//type：跳转到表单设计页面的类型。可以有design、examine、copy
		model.addAttribute("type", type);
		model.addAttribute("departmentMap", CacheMap.departmentMap);
		return PageEnum.DESIGN_FORM.getPage();
	}

	@ResponseBody
	@PostMapping("/design")
	public Result design(@RequestBody Form form) {
		//版本+1
		form.setVersion((form.getVersion() + 1));
		form.setContent(form.getContent().replace("background-color: white;", ""));
		if(!StringUtils.isEmpty(form.getId())){
			formService.update(form);
		}else{
			form.setId(StringUtil.randomUUID());
			if(form.getVersion() == 100){
				//如果是表单复制，校验表单名称
				if(!CollectionUtils.isEmpty(formService.
						selectCondition(new Criteria().injectCriterion("name", "=", form.getName())))){
					return Result.result(ResultEnum.FORM_NAME_EXISTS);
				}else{
					form.setVersion(1);
					formService.insert(form);
				}
			}else{
				formService.insert(form);
			}
		}
		return new Result<>(ResultEnum.DEFAULT_SUCCESS);
	}

	@RightAnnotation(name="删除表单", desc="这是删除表单")
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(Form form) {
		formService.delete(form);
	}
}
