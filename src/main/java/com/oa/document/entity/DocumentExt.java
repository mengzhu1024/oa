package com.oa.document.entity;

import java.util.List;

import com.oa.domain.enums.FileTypeEnum;
import com.oa.utils.CollectionUtil;
import lombok.Data;

@Data
public class DocumentExt extends Document {

	/**
	 * 文件能否预览
	 */
	private boolean preview;

	/**
	 * 文件能否被该用户下载，默认为true，查询到结果集后再根据员工身份及所在分组分配
	 */
	private boolean download = true;

	/**
	 * 文件能否被该用户删除，默认为true，查询到结果集后再根据员工身份及所在分组分配
	 */
	private boolean delete = true;

	/**
	 * 该文件包含的分组
	 */
	public List<String> groupIdList;

	@Override
	public void setName(String name) {
		super.setName(name);
		String suffix = name.substring(name.lastIndexOf(".") + 1);
		//如果根据文件后缀设置固有的预览属性
		preview = FileTypeEnum.previewableList().contains(suffix);
	}
}
