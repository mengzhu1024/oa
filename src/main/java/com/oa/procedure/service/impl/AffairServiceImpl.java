package com.oa.procedure.service.impl;

import com.elementchain.base.entity.ExecuteCriteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseServiceImpl;
import com.oa.member.entity.Employee;
import com.oa.procedure.entity.*;
import com.oa.procedure.entity.Process;
import com.oa.procedure.mapper.*;
import com.oa.procedure.service.AffairService;
import com.oa.utils.Constant;
import com.oa.utils.FilesUtil;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@Service
public class AffairServiceImpl extends BaseServiceImpl<Affair, AffairMapper> implements AffairService{

	@Autowired
	private AttachmentMapper attachmentMapper;

	@Autowired
	private ControlMapper controlMapper;

	@Autowired
	private ProcessMapper processMapper;

	@Autowired
	private NodeMapper nodeMapper;

	@Override
	public PageResult<AffairExt> selectExtPage(PageCriteria<AffairExt> affairCriteria) {
		return PageResult.getCurrentPageResult(baseMapper.selectExtPage(affairCriteria));
	}

	@Override
	public void batchInsertAttachments(Attachment[] attachments) {
		for(Attachment attachment: attachments){
			attachmentMapper.insert(attachment);
		}
	}

	@Override
	public AffairExt selectWithControlsAndAttachments(String id) {
		//这里分成两批查询，避免笛卡尔集
		AffairExt affair = baseMapper.selectWithControl(id);
		affair.setAttachmentList(attachmentMapper.selectAll(new PageCriteria<Attachment>()
				.injectCriterion("affair_id", "=", id)));
		return affair;
	}
	
	@Override
	public AffairExt selectWithProcesses(String id) {
		return baseMapper.selectWithProcess(id);
	}

	@Override
	public void updateSelective(Affair entity, Employee handler, Node node) {
		//更新之前插入一条ProcedureProcess数据
		Process process = new Process();
		process.setId(StringUtil.randomUUID());
		process.setHandleTime(new Timestamp(System.currentTimeMillis()));
		process.setHandler(handler.getName() + "(" + handler.getAccount() + ")");
		process.setAffairId(entity.getId());
		process.setNodeName(node.getName());
		process.setNodeOrder(node.getOrder());
		processMapper.insert(process);
		baseMapper.updateByPrimaryKeySelective(entity);
	}

	@Override
	public List<Attachment> selectAttachments(PageCriteria<Attachment> attachmentCriteria) {
		return attachmentMapper.selectAll(attachmentCriteria);
	}

	//重写delete方法
	@Override
	public Integer delete(Affair affair) {
		ExecuteCriteria executeCriteria = new ExecuteCriteria().injectCriterion("affair_id", "=", affair.getId());
		//删除控件
		controlMapper.deleteByCriteria(executeCriteria);
		//删除附件
		attachmentMapper.deleteByCriteria(executeCriteria);
		//删除流程过程
		processMapper.deleteByCriteria(executeCriteria);
		//删除流程实例
		baseMapper.deleteByPrimaryKey(affair);
		//删除附件文件
		String name = affair.getName();
		int index = name.lastIndexOf("(");
		File file = new File(Constant.ROOT_PATH + "/attachment/" + ((AffairExt) affair).getSponsorName() + 
				"/" + name.substring(index + 1, index + 11) + "/" + affair.getId());
		if(file.exists()){
			FilesUtil.deleteFileWithChildren(file);
		}
		return 0;
	}

	@Override
	public void revokeAffair(Affair affair) {
		ExecuteCriteria executeCriteria = new ExecuteCriteria().injectCriterion("affair_id", "=", affair.getId());
		//删除流程过程
		processMapper.deleteByCriteria(executeCriteria);
		
		//查找该流程第一个节点的控件
		Node firstNode = nodeMapper.selectAll(new PageCriteria<Node>().concatCriterion(
				"(`proc_id`, `order`)", "=", "('" + affair.getProcId() + "', 1)")).get(0);
		//查找第一个节点对应的控件
		String[] controls = firstNode.getControls().split(",");
		List<String> list = new ArrayList<String>(controls.length);
		for(String control: controls){
			list.add(control.split("_")[0]);
		}
		//添加删除控件约束条件
		executeCriteria.concatCriterion("code", "not in", "('"+StringUtil.collectionToString(list, "','")+"')");
		controlMapper.deleteByCriteria(executeCriteria);
		
		//把该流程实例退回到第一个节点，修改状态码
		affair.setStatus(Constant.AFFAIR_REVOKE);
		affair.setNodeId(firstNode.getId());
		baseMapper.updateByPrimaryKeySelective(affair);
	}	
}
