package com.oa.cache;

import com.oa.auth.entity.Right;
import com.oa.member.entity.DepartmentExt;
import com.oa.member.entity.Position;
import com.oa.procedure.entity.ProcedureType;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class CacheMap {
	//权限Map，key为权限的url
	public static Map<String, Right> rightMap = new LinkedHashMap<>();

	//部门Map（包含分组、职位）
	public static Map<String, DepartmentExt> departmentMap = new HashMap<>();

	//职位Map（不属于某一部门的独立职位）
	public static Map<String, Position> notLinkDepartmentPositionMap = new HashMap<>();

	//流程类型Map
	public static Map<String, ProcedureType> procedureTypeMap = new HashMap<>();
	
	//最大权限位
	public static Integer maxRightPosition;
}
