package com.oa.procedure.entity;

import lombok.Data;

import java.util.List;

/**
 * @author huwenlong
 */
@Data
public class ProcedureExt extends Procedure {

	private static final long serialVersionUID = -8996451414814984L;

	private String formName;
	
	private String typeName;
	
	private List<Node> nodeList;
}
