package com.oa.auth.entity;

import lombok.Data;

import java.util.List;

/**
 * @author huwenlong
 */
@Data
public class RoleExt extends Role{

	private static final long serialVersionUID = 3432137864397335930L;

	private List<Right> rightList;
}
