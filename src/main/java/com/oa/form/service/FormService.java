package com.oa.form.service;

import com.elementchain.base.service.BaseService;
import com.oa.form.entity.Form;

import java.util.List;

public interface FormService extends BaseService<Form> {
	Form selectWithContent(String id);

	String saveOrUpdate(Form form);

	List<Form> selectHistory(String name);
}