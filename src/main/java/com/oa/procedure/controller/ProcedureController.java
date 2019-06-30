package com.oa.procedure.controller;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.cache.CacheMap;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.form.service.FormService;
import com.oa.procedure.entity.Node;
import com.oa.procedure.entity.Procedure;
import com.oa.procedure.entity.ProcedureExt;
import com.oa.procedure.service.AffairService;
import com.oa.procedure.service.NodeService;
import com.oa.procedure.service.ProcedureService;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import java.util.*;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/proc")
public class ProcedureController {

	@Autowired
	private ProcedureService procedureService;

	@Autowired
	private FormService formService;

	@Autowired
	private NodeService nodeService;

	@Autowired
	private AffairService affairService;

	@RightAnnotation(name="查看流程", desc="这是查看流程的权限", common=true)
	@RequestMapping("/admin")
	public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("procedureTypeMap", CacheMap.procedureTypeMap);
		model.addAttribute("pageNum", pageNum);
		return PageEnum.PROCEDURE_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/page")
	public Result page(PageCriteria<ProcedureExt> pageCriteria) {
		return new Result<>(procedureService.selectExtPage(pageCriteria));
	}

	@RightAnnotation(name="操作流程", desc="这是操作流程的权限")
	@RequestMapping("/to-operate")
	public String toOperate(Model model, String id, Integer pageNum) {
		if(!StringUtils.isEmpty(id)){
			model.addAttribute("procedure", procedureService.selectByPrimaryKey(id));
		}
		model.addAttribute("procedureTypeMap", CacheMap.procedureTypeMap);
		model.addAttribute("formList", formService.selectAll());
		model.addAttribute("pageNum", pageNum);
		return PageEnum.OPERATE_PROCEDURE.getPage();
	}
	@RequestMapping("/operate")
	public String operate(Procedure procedure, Integer pageNum) {
		if(!StringUtils.isEmpty(procedure.getId())){
			procedureService.updateSelective(procedure);
		}else{
			procedure.setId(StringUtil.randomUUID());
			procedureService.insert(procedure);
		}
		return "redirect:/proc/admin?pageNum=" + pageNum;
	}

	@RightAnnotation(name="批量更新流程", desc="这是批量更新流程的权限")
	@ResponseBody
	@RequestMapping("/batch-update")
	public void batchUpdate(@RequestBody Procedure[] procedures) {
		procedureService.batchUpdate(procedures);
	}

	@RightAnnotation(name="删除流程", desc="这是删除流程的权限，包括批量删除")
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody Procedure[] procedures) {
		if(procedures.length == 1){
			procedureService.delete(procedures[0]);
		}else{
			procedureService.batchDelete(procedures);
		}
	}

	@RequestMapping("/to-design-node")
	@RightAnnotation(name="节点设计", desc="这是节点设计的权限")
	//type：跳转到节点设计页面的类型。可以有designNode、checkNode、checkAffair这三个值
	public String toDesignNode(Model model, String id, @RequestParam(required = false) int pageNum, @RequestParam(required = false) String affairId) {
		model.addAttribute("procedure", procedureService.selectWithNode(id).get(0));
		model.addAttribute("departmentMap", CacheMap.departmentMap);
		model.addAttribute("notLinkDepartmentPositionMap", CacheMap.notLinkDepartmentPositionMap);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("type", "designNode");
		return PageEnum.DESIGN_NODE.getPage();
	}

	@ResponseBody
	@RequestMapping("/design-node")
	public void designNode(@RequestBody Procedure procedure) {
		procedureService.updateContent(procedure);
	}

	@RequestMapping("/to-proc-chart")
	public String toProcedureChart(Model model, String id, @RequestParam(required = false) int pageNum, String type, @RequestParam(required = false) String affairId) {
		model.addAttribute("procedure", procedureService.selectWithNode(id).get(0));
		if(type.equals("checkNode")){
			model.addAttribute("departmentMap", CacheMap.departmentMap);
			model.addAttribute("notLinkDepartmentPositionMap", CacheMap.notLinkDepartmentPositionMap);
		}else if (type.equals("checkAffair")){
			model.addAttribute("affair", affairService.selectWithProcesses(affairId));
		}
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("type", type);
		return PageEnum.DESIGN_NODE.getPage();
	}

	@ResponseBody
	@RequestMapping("/update-node-handler")
	public void updateNodeHaldler(Node node, String[] handlers) {
		node.setHandlers(StringUtil.arraysToString(handlers, ","));
		nodeService.updateSelective(node);
	}

	@RequestMapping("/to-select-control")
	//type：跳转到节点设计页面的类型。可以有readonly、operate这两个值。直接继承节点设计页面的type
	public String toSelectFormControl(Model model, String formId, String nodeId, String procId, String type) {
		model.addAttribute("form", formService.selectWithContent(formId));
		model.addAttribute("node", nodeService.selectByPrimaryKey(nodeId));
		//查询其他的节点
		model.addAttribute("otherNodeList", nodeService.selectCondition(new Criteria()
				.injectCriterion("proc_id", "=", procId)
				.injectCriterion("id", "!=", nodeId)));
		model.addAttribute("type", type);
		return PageEnum.SELECT_CONTROL.getPage();
	}

	@ResponseBody
	@PostMapping("/select-control")
	public void selectControl(Node node, String[] controls){
		node.setControls(StringUtil.arraysToString(controls, ","));
		nodeService.updateSelective(node);
	}

	//节点分支设计
	@RequestMapping("/design-branch")
	@ResponseBody
	public void designBranch(Node node){
		node.setBranch(node.getBranch());
		node.setBranchJs(getJsString(node.getBranch(), node.getFlowNumber()));
		nodeService.updateSelective(node);
	}

	//把node的branch字符串解析成脚本语言
	private String getJsString(String str, String flowNumber) {
		//把字符串分成条件数组
		String[] strs = str.split(",");
		//创建一个map，键是返回值（流向的节点），值是返回到该节点的条件
		Map<String, String> strMap = new HashMap<>();
		//创建一个参数Set，用于记录控件名称
		Set<String> paramSet = new HashSet<>();
		for(String str2: strs){
			//把每一个条件拆分成返回值（流向的节点）、逻辑关系、控件名称、数学关系、值
			String[] strs2 = str2.split("_");
			paramSet.add(strs2[2]);
			String key = strs2[0];
			if(strMap.containsKey(key)){
				strMap.put(key, strMap.get(key) + " " + strs2[1] + " " + strs2[2] + " " + strs2[3] + " " + strs2[4]);
			}else{
				strMap.put(key, strs2[2] + " " + strs2[3] + " " + strs2[4]);
			}
		}
		String[] params = paramSet.toArray(new String[]{});
		StringBuilder str2 = new StringBuilder("var order="+flowNumber.subSequence(0, flowNumber.indexOf(","))+
				";function setSeqnum(" + StringUtil.arraysToString(params, ",") + "){");
		Iterator<String> it = strMap.keySet().iterator();
		List<String> flowseqList = new ArrayList<>();
		flowseqList.addAll(Arrays.asList(flowNumber.split(",")));
		while(it.hasNext()){
			String key = it.next();
			flowseqList.remove(key);
			str2.append("else if(" + strMap.get(key) + "){order=" + key + ";}");
		}
		if(!CollectionUtils.isEmpty(flowseqList)){
			str2.append("else{order="+flowseqList.get(0)+";}");
		}
		str2.append("}setSeqnum("+StringUtil.arraysToString(params, ",")+
				");//" + StringUtil.arraysToString(params, ","));
		return str2.delete(str2.indexOf("else if"), str2.indexOf("else if") + 5).toString();
	}
	
	@ResponseBody
	@RequestMapping("/list-by-type")
	public Result listByType(String procedureTypeId) {
		return new Result<>(procedureService.selectCondition(new Criteria().injectCriterion("type_id", "=", procedureTypeId)));
	}
	
	@ResponseBody
	@RequestMapping("/list-control")
	public List<String> listControl(String procId) {
		List<Node> nodeList = nodeService.selectCondition(new Criteria().setOrderBy("`order`")
				.injectCriterion("proc_id", "=", procId));
		List<String> controlList = new ArrayList<>();
		for(Node node: nodeList){
			controlList.add(node.getControls());
		}
		return controlList;
	}
}
