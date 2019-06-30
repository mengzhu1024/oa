package com.oa.member.entity;

import com.oa.auth.entity.Right;
import com.oa.auth.entity.RoleExt;
import com.oa.cache.CacheMap;
import lombok.Data;

import java.util.List;

@Data
public class EmployeeExt extends Employee {
	private String depName;

	/**
	 * 权限集合。数组下标是权限位，数组内容是该权限位的权限码通过二进制与运算得到的长整型数据
	 */
	private long[] rights;

	/**
	 * 是否是超级管理员，权限过滤的时候有用
	 */
	private boolean supper;

	/**
	 * 拥有的角色
	 */
	private List<RoleExt> roleList;

	/**
	 * 用户所在的分组
	 */
	public List<String> groupIdList;

	/**
	 * 计算权限综合
	 */
	public void caculateRightCount(){
		int pos;
		long code;
		if(roleList != null){
			for(RoleExt role: roleList){
				//判断是否是超级管理员
				if(role.getRightList().size() == CacheMap.rightMap.size()){
					role.setSupper(true);
				}
				if(role.getSupper()){
					this.supper = true;
					return;
				}
				for(Right right: role.getRightList()){
					pos = right.getPos();
					code = right.getCode();
					//rightSum声明为long[]，默认值是0，通过与运算来进行权限计算
					rights[pos] |= code;
				}
			}
			//释放资源，减缓session压力
			roleList = null;
		}
	}

	/**
	 * 判断用户是否有某个权限
	 * @param right
	 * @return
	 */
	public boolean hasRight(Right right) {
		int pos = right.getPos();
		long code = right.getCode();
		return (rights[pos] & code) != 0;
	}
}
