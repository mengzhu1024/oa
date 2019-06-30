package com.oa.form.service.impl;

import com.alibaba.druid.util.StringUtils;
import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.ExecuteCriteria;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.base.service.BaseServiceImpl;
import com.oa.form.entity.Form;
import com.oa.form.mapper.FormMapper;
import com.oa.form.service.FormService;
import com.oa.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;

@Service
public class FormServiceImpl extends BaseServiceImpl<Form, FormMapper> implements FormService {

	//覆盖分页查询
	@Override
	public PageResult<Form> selectPage(PageCriteria<Form> formCriteria) {
		return PageResult.getCurrentPageResult(baseMapper.selectMaxVersion(formCriteria));
	}

	//覆盖查询所有
	@Override
	public List<Form> selectAll() {
		//过滤掉content为null的表单
		return baseMapper.selectMaxVersion(new Criteria()
				.injectCriterion("f.version", "!=", "0"));
	}

	@Override
	public Form selectWithContent(String id) {
		return baseMapper.selectWithContent(id);
	}

	@Override
	public String saveOrUpdate(Form form) {
		String result = "true";
		PageCriteria<Form> formCriteria = new PageCriteria<Form>();
		formCriteria.injectCriterion("name", "=", form.getName());
		if(!CollectionUtils.isEmpty(baseMapper.selectAll(formCriteria))){
			result = "false";
		}else{
			if(!StringUtils.isEmpty(form.getId())){
				form.setVersion(null);
				//修改所有的同名表单
				Form form2 = baseMapper.selectByPrimaryKey(form.getId());
				baseMapper.updateByCriteriaSelective(new ExecuteCriteria<>(form).injectCriterion("name", "=", form2.getName()));
			}else{
				form.setId(StringUtil.randomUUID());
				baseMapper.insert(form);
			}
		}
		return result;
	}

	//覆盖删除方法
	@Override
	public Integer delete(Form form) {
		baseMapper.deleteByPrimaryKey(form);
		baseMapper.updateVersion(form);
		return 0;
	}

	@Override
	public List<Form> selectHistory(String name) {
		return baseMapper.selectHistory(name);
	}
}