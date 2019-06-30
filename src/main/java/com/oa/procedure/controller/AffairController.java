package com.oa.procedure.controller;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.oa.annotations.RightAnnotation;
import com.oa.annotations.TokenAnnotation;
import com.oa.cache.CacheMap;
import com.oa.domain.Result;
import com.oa.domain.enums.FileTypeEnum;
import com.oa.domain.enums.PageEnum;
import com.oa.form.service.FormService;
import com.oa.member.entity.EmployeeExt;
import com.oa.procedure.entity.*;
import com.oa.procedure.service.AffairService;
import com.oa.procedure.service.ControlService;
import com.oa.procedure.service.NodeService;
import com.oa.utils.Constant;
import com.oa.utils.FilesUtil;
import com.oa.utils.StringUtil;
import com.oa.utils.ValidateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author huwenlong
 */
@Slf4j
@Controller
@RequestMapping("/affair")
public class AffairController {

	@Autowired
	private AffairService affairService;

	@Autowired
	private FormService formService;

	@Autowired
	private NodeService nodeService;
	
	@Autowired
	private ControlService controlService;

	// type表示查看类型。待办事宜：toHandle;已办事宜：done;办结事宜：finish;流程监控：monitor
	@RightAnnotation(name="查看流程实例", desc="这是查看流程实例的权限", common=true)
	@RequestMapping("/admin")
	public String admin(Model model, String type, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
		model.addAttribute("procedureTypeMap", CacheMap.procedureTypeMap);
		model.addAttribute("type", type);
		model.addAttribute("pageNum", pageNum);
		return PageEnum.AFFAIR_ADMIN.getPage();
	}

	@ResponseBody
	@RequestMapping("/page")
	public Result page(HttpSession session, PageCriteria<AffairExt> pageCriteria,
											String type, String[] controls) {
		EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
		if(ValidateUtil.isValid(controls)){
			//控件检索
			List<ArrayList<String>> strListList = new ArrayList<>();
			for(String control: controls){
				//查询出每一个空间条件包含的affair
				String code = control.split("\\|")[0];
				String relation = control.split("\\|")[1];
				String value = control.split("\\|")[2];
				if(relation.equals("like")){
					value = value.replace("", "%");
				}
				List<Control> controlList = controlService.selectCondition(new Criteria()
				.injectCriterion("code", "=", code).injectCriterion("value", relation, value));
				ArrayList<String> strList = new ArrayList<>();
				for(Control c: controlList){
					strList.add(c.getAffairId());
				}
				strListList.add(strList);
			}
			//让第一个List别的List取交集
			List<String> affairIdList = strListList.get(0);
			for(int i = 1; i < strListList.size(); i ++){
				affairIdList.retainAll(strListList.get(i));
			}
			if(affairIdList.size() == 0){
				//如果没有值，直接返回
				PageResult<AffairExt> pageResult = PageResult.getCurrentPageResult();
				pageResult.setRowCount(0);
				return new Result<>(pageResult);
			}else if(affairIdList.size() == 1){
				pageCriteria.injectCriterion("a.id", "=", affairIdList.get(0));
			}else{
				pageCriteria.concatCriterion("a.id", "in", "('" + StringUtil.collectionToString(affairIdList, "','") + "')");
			}
		}
		
		if(type.equals("toHandle")){
			//查找我的待办事务（办理人员包括指定的办理人员or打回流程后的发起者）
			pageCriteria.concatCriterion("(handler_id", "= '"+loginer.getAccount()+"' and a.status = 0)",
					" or (sponsor_id = '"+loginer.getId()+"' and a.status = 1)");
		}else if(type.equals("done")){
			//查找我已办事务
			pageCriteria.concatCriterion("a.id", "in",
					"(select affair_id FROM procedure_process where handler = '"+loginer.getName() + "(" + loginer.getAccount()+")') and a.status = 0");
		}else if(type.equals("finish")){
			//查找我已办事务并且已经流转完毕
			pageCriteria.concatCriterion("a.id", "in",
					"(select affair_id FROM procedure_process where handler = '"+loginer.getName() + "(" + loginer.getAccount()+")') and a.status = 2");
		}else if(type.equals("monitor")){
			//如果查看所有流程且不是超级管理员，则只能查看自己发起的流程
			if(!loginer.isSupper()) {
				pageCriteria.injectCriterion("a.sponsor_id", "=", loginer.getId());
			}
		}
		return new Result<>(affairService.selectExtPage(pageCriteria));
	}

	//type表示查看类型。发起流程：start;办理事务：handle;查看事务：examine;
	@RightAnnotation(name="办理事务", desc="这是办理事务的权限，包括发起流程", common=true)
	@RequestMapping("/to-handle")
	public String toHandle(Model model, AffairExt affair, Integer pageNum, String type) {
		Node node;
		if(type.equals("start")){
			//发起流程需要查找第一个节点
			node = nodeService.selectCondition(new Criteria()
					.injectCriterion("proc_id", "=", affair.getProcId())
					.injectCriterion("order", "=", "1")).get(0);
		}else{
			String sponsorName = affair.getSponsorName();
			affair = affairService.selectWithControlsAndAttachments(affair.getId());
			affair.setSponsorName(sponsorName);
			node = nodeService.selectByPrimaryKey(affair.getNodeId());
			model.addAttribute("previewableList", FileTypeEnum.previewableList());
		}
		model.addAttribute("node", node);
		model.addAttribute("affair", affair);
		model.addAttribute("form", formService.selectWithContent(affair.getFormId()));
		model.addAttribute("departmentMap", CacheMap.departmentMap);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("type", type);
		model.addAttribute("ip_port", Constant.IP_PORT);
		return PageEnum.HANDLE_AFFAIR.getPage();
	}

	//type表示办理类型。提交：submit;打回：revoke
	@RequestMapping("/handle")
	@TokenAnnotation(targetUrl="//affair/admin?type=toHandle")
	public String handle(Model model, HttpSession session, MultipartFile[] files,
								 String[] controlStrings, Affair affair, String type, @RequestParam(required = false) String nextNodeId) throws IOException {
		if(type.equals("submit")){
			//提交流程
			//查询当前节点
			Node node = nodeService.selectByPrimaryKey(affair.getNodeId());
			EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
			//如果节点序号是1并且是正常流转，表示发起流程
			if(node.getOrder() == 1 && affair.getStatus() != Constant.AFFAIR_REVOKE){
				affair.setId(StringUtil.randomUUID());
				//事务重命名
				affair.setName(affair.getName() + "(" + StringUtil.dateToString(new Date(), "yyyy-MM-dd HH:mm:ss") + ":"+loginer.getName()+")");
				affair.setSponsorId(loginer.getId());
				affair.setStatus(Constant.AFFAIR_NORMAL);
				//添加流程实例
				affairService.insert(affair);
			}
			//如果是打回的流程，删除残余的第一个节点填写的控件
			if(affair.getStatus().equals(Constant.AFFAIR_REVOKE)){
				controlService.deleteByCriteria(new Criteria().injectCriterion("affair_id", "=", affair.getId()));
			}
			Control[] controls = new Control[controlStrings.length];
			for(int i = 0; i < controls.length; i ++){
				String controlString = controlStrings[i];
				controls[i] = new Control();
				controls[i].setId(StringUtil.randomUUID());
				String[] cs = controlString.split("\\|");
				controls[i].setName(cs[0]);
				controls[i].setCode(cs[1]);
				controls[i].setValue(cs[2]);
				controls[i].setAffairId(affair.getId());
			}
			controlService.batchInsert(controls);
			if(!StringUtils.isEmpty(nextNodeId)){
				affair.setNodeId(nextNodeId);
				affair.setStatus(Constant.AFFAIR_NORMAL);
			}else{
				affair.setStatus(Constant.AFFAIR_DONE);
			}

			affairService.updateSelective(affair, loginer, node);
			if(node.getOrder() == 1 && ValidateUtil.isValid(files)){
				Date date = new Date();
				Attachment[] attachments = new Attachment[files.length];
				for(int i = 0; i < files.length; i ++){
					MultipartFile file = files[i];
					String name = file.getOriginalFilename();
					if(!StringUtils.isEmpty(name)){
						String newName = name.substring(0, name.lastIndexOf(".")) +
								"_" + StringUtil.dateToString(date, "yyyyMMddHHmmss") +
								name.substring(name.lastIndexOf("."));
						//附件存储路径：根目录/发起者/当天时间/事务ID
						String path = Constant.ROOT_PATH + "/attachment/" + loginer.getName() + "/" +
								StringUtil.dateToString(new Date(), "yyyy-MM-dd") + "/" + affair.getId() +
								"/" + newName;
						File localFile = new File(path);
						localFile.getParentFile().mkdirs();
						file.transferTo(localFile);
						//上传记录到数据库
						attachments[i] = new Attachment();
						attachments[i].setId(StringUtil.randomUUID());
						attachments[i].setName(name);
						attachments[i].setNewName(newName);
						attachments[i].setAffairId(affair.getId());
					}
				}
				affairService.batchInsertAttachments(attachments);
			}
		}else{
			//打回流程
			affairService.revokeAffair(affair);
		}
		return "redirect:/affair/admin?type=toHandle";
	}
	
	//选择办理人员的时候查询下一个节点
	@ResponseBody
	@PostMapping("/list-next-node")
	public Result listNextNode(Node node, String[] controls) {
		if(!StringUtils.isEmpty(node.getBranchJs())){
			//这里用&&替换掉and
			node.setBranchJs(node.getBranchJs().replace("and", "&&"));
		}
		return new Result<>(nodeService.selectNext(node, controls));
	}

	@RequestMapping("/attachment/download")
	public void downloadAttachment(HttpServletResponse response, String ids, String path){
		List<Attachment> attachmentList = affairService.selectAttachments(
				new PageCriteria<Attachment>().concatCriterion("id", "in", "(" + ids + ")"));
		File[] files = new File[attachmentList.size()];
		for(int i = 0; i < files.length; i++){
			Attachment attachment = attachmentList.get(i);
			files[i] = new File(Constant.ROOT_PATH + path + "/" + attachment.getNewName());
		}
		FilesUtil.multiDownload(files, response);
	}
	
	@RightAnnotation(name="删除流程实例", desc="这是删除流程实例", common=true)
	@RequestMapping("/delete")
	@ResponseBody
	public void delete(@RequestBody AffairExt affair) {
		affairService.delete(affair);
	}
}
