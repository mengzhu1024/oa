package com.oa.procedure.entity;

import lombok.Data;

import java.util.List;

@Data
public class AffairExt extends Affair {
	private String procedureName;
	
	private String sponsorName;
	
	private String nodeName;
	
	private List<Control> controlList;
	
	private List<Attachment> attachmentList;
	
	private List<Process> processList;
}
