package com.oa.procedure.service.impl;

import com.elementchain.base.entity.ExecuteCriteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseServiceImpl;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.oa.procedure.entity.Node;
import com.oa.procedure.entity.Procedure;
import com.oa.procedure.entity.ProcedureExt;
import com.oa.procedure.mapper.NodeMapper;
import com.oa.procedure.mapper.ProcedureMapper;
import com.oa.procedure.service.ProcedureService;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author huwenlong
 */
@Service
public class ProcedureServiceImpl extends BaseServiceImpl<Procedure, ProcedureMapper> implements ProcedureService {

	@Autowired
	private NodeMapper nodeMapper;

	@Override
	public PageResult<ProcedureExt> selectExtPage(PageCriteria<ProcedureExt> procedureCriteria) {
		return PageResult.getCurrentPageResult(baseMapper.selectExtPage(procedureCriteria));
	}

	@Override
	public void updateContent(Procedure procedure) {
		//如果存在，删除旧节点
		nodeMapper.deleteByCriteria(new ExecuteCriteria().injectCriterion("proc_id", "=", procedure.getId()));

		//准备解析工具
		String content = procedure.getContent();
		Pattern pattern = Pattern.compile("node_\\d+':");
		Matcher matcher = pattern.matcher(content);
		JsonParser jsonParser = new JsonParser();
		JsonObject jsonObject = (JsonObject) jsonParser.parse(content);
		JsonObject nodes = jsonObject.get("nodes").getAsJsonObject();

		//创建新增节点对象
		int i = 1;
		//创建节点Map，其中key是jsonNode的名称
		Map<String, Node> nodeMap = new LinkedHashMap<String, Node>();
		while (matcher.find()) {
			String nodeName = matcher.group().replace("':", "");
			JsonObject jsonNode = nodes.get(nodeName).getAsJsonObject();
			Node node = new Node();
			node.setId(StringUtil.randomUUID());
			node.setName(jsonNode.get("name").toString().replace("\"", ""));
			node.setOrder(i);
			node.setFlowNumber("");
			node.setProcId(procedure.getId());
			nodeMap.put(nodeName, node);
			i++;
		}

		//设置Node的flowNumber属性
		pattern = Pattern.compile("line_\\d+':");
		matcher = pattern.matcher(content);
		JsonObject lines = jsonObject.get("lines").getAsJsonObject();
		while (matcher.find()) {
			JsonObject line = lines.get(matcher.group().replace("':", "")).getAsJsonObject();
			String start = line.get("from").toString().replace("\"", "");
			String end = line.get("to").toString().replace("\"", "");
			nodeMap.get(start).setFlowNumber(nodeMap.get(start).getFlowNumber() + " " + nodeMap.get(end).getOrder());
		}

		//添加节点
		for (Node node : nodeMap.values()) {
			node.setFlowNumber(node.getFlowNumber().trim().replace(" ", ","));
			nodeMapper.insert(node);
		}

		//更新流程内容
		baseMapper.updateByPrimaryKeySelective(procedure);
	}

	@Override
	public List<ProcedureExt> selectWithNode(String id) {
		return baseMapper.selectWithNode(id);
	}
}
