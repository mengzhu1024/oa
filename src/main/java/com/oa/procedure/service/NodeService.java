package com.oa.procedure.service;

import com.elementchain.base.service.BaseService;
import com.oa.procedure.entity.Node;

public interface NodeService extends BaseService<Node> {
	public Node selectNext(Node node, String[] controls);
}