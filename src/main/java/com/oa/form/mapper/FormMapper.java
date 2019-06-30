package com.oa.form.mapper;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.mapper.BaseMapper;
import com.oa.form.entity.Form;

import java.util.List;

public interface FormMapper extends BaseMapper<Form> {
	List<Form> selectMaxVersion(Criteria criteria);

	Form selectWithContent(String id);

	void updateVersion(Form form);

	List<Form> selectHistory(String name);
}