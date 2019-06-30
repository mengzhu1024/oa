package com.oa.group.controller;

import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.cache.CacheMap;
import com.oa.document.entity.Document;
import com.oa.document.service.DocumentService;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.domain.enums.ResultEnum;
import com.oa.group.entity.Group;
import com.oa.group.service.GroupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/group")
public class GroupController {

	@Autowired
	private GroupService groupService;

	@Autowired
	private DocumentService documentService;

	@RightAnnotation(name="查看分组", desc="这是查看分组的权限")
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("departmentMap", CacheMap.departmentMap);
		model.addAttribute("pageNum", pageNum);
		return PageEnum.GROUP_ADMIN.getPage();
	}

	@ResponseBody
	@PostMapping("/page")
	public Result page(PageCriteria<Group> pageCriteria) {
		return new Result<>(groupService.selectPage(pageCriteria.setOrderBy("dep_id")));
	}

	@RightAnnotation(name="操作分组", desc="这是操作分组的权限，用来关联成员和文件")
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer groupPageNum, PageCriteria<Document> documentCriteria) {
		//通过查询分组关联包含的成员
		model.addAttribute("group", groupService.selectWithMember(id));
		//通过DocumentService分页查询分组包含的文件
		documentCriteria.concatCriterion("id", "in", "(select doc_id from group_document where group_id = '"+id+"')");
		model.addAttribute("documentCriteria", documentService.selectPage(documentCriteria));
		model.addAttribute("groupPageNum", groupPageNum);
		return PageEnum.OPERATE_GROUP.getPage();
	}

	@ResponseBody
	@RequestMapping("/doc-page")
	public Result docPage(PageCriteria<Document> documentCriteria, String id) {
		documentCriteria.concatCriterion("id", "in",
				"(select doc_id from group_document where group_id = '"+id+"')");
		return new Result<>(documentService.selectPage(documentCriteria));
	}

	@ResponseBody
	@RequestMapping("/remove-doc")
	public Result removeDocument(String id, HttpServletRequest request) {
		groupService.removeDocument(id, request.getParameterValues("documentIds[]"));
		return Result.result(ResultEnum.DEFAULT_SUCCESS);
	}

	@ResponseBody
	@PostMapping("/link-emp")
	public Result linkEmployee(String id, HttpServletRequest request) {
		groupService.linkEmployee(id, request.getParameterValues("employeeIds[]"));
		return Result.result(ResultEnum.DEFAULT_SUCCESS);
	}
}
