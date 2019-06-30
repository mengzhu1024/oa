package com.oa.work.service.impl;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.service.BaseServiceImpl;
import com.oa.procedure.entity.Process;
import com.oa.procedure.mapper.ProcessMapper;
import com.oa.work.entity.AffairStatistic;
import com.oa.work.mapper.AffairStatisticMapper;
import com.oa.work.service.AffairStatisticService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AffairStatisticServiceImpl extends BaseServiceImpl<AffairStatistic, AffairStatisticMapper> implements AffairStatisticService {

	@Autowired
	private ProcessMapper processMapper;

	@Override
	public void affairStatistic(List<AffairStatistic> affairStatisticList) {
		for(AffairStatistic affairStatistic: affairStatisticList){
			//设置日常事务发起数量
			affairStatistic.setStartNum1(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '6f5d6f50-92d5-4c92-b0db-0461db3ebc95'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置日常事务审批数量
			affairStatistic.setHandleNum1(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '6f5d6f50-92d5-4c92-b0db-0461db3ebc95'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置行政事务发起数量
			affairStatistic.setStartNum2(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '9bcd6f49-5d7d-48c2-9e91-dbe9bd5ba30f'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置行政事务审批数量
			affairStatistic.setHandleNum2(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '9bcd6f49-5d7d-48c2-9e91-dbe9bd5ba30f'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置物资流程发起数量
			affairStatistic.setStartNum3(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '4c285c0e-3f7b-45ab-980d-2070a4fe8efc'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置物资流程审批数量
			affairStatistic.setHandleNum3(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '4c285c0e-3f7b-45ab-980d-2070a4fe8efc'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置经济事务发起数量
			affairStatistic.setStartNum4(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '4c120d5c-d973-4439-b26c-f3b9f4dd4834'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置经济事务审批数量
			affairStatistic.setHandleNum4(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '4c120d5c-d973-4439-b26c-f3b9f4dd4834'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置营销流程发起数量
			affairStatistic.setStartNum5(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '33233e20-8044-403b-9fb2-bb4b17fed0b6'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置营销流程审批数量
			affairStatistic.setHandleNum5(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '33233e20-8044-403b-9fb2-bb4b17fed0b6'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置公司日常流程发起数量
			affairStatistic.setStartNum6(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '82214233-a64b-4baa-b4b1-3c1c7f891aed'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置公司日常流程审批数量
			affairStatistic.setHandleNum6(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '82214233-a64b-4baa-b4b1-3c1c7f891aed'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置工程流程发起数量
			affairStatistic.setStartNum7(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '7c373d8e-bfcc-4414-9bb5-503c78c3fd51'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置工程流程审批数量
			affairStatistic.setHandleNum7(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '7c373d8e-bfcc-4414-9bb5-503c78c3fd51'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置卓之印发起数量
			affairStatistic.setStartNum8(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '8fd9222b-4d71-44b7-a9ed-18cdd73d437f'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置卓之印审批数量
			affairStatistic.setHandleNum8(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = '8fd9222b-4d71-44b7-a9ed-18cdd73d437f'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置通罗物流发起数量
			affairStatistic.setStartNum9(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = 'fba0470f-7346-4f68-8ba6-e4618ec3fa38'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			//设置通罗物流审批数量 
			affairStatistic.setHandleNum9(processMapper.countByCriteria(new PageCriteria<Process>()
					.concatCriterion("affair_id", "in", "(select id from `procedure`affair where proc_id in (select id "+
			"from `procedure` where type_id = 'fba0470f-7346-4f68-8ba6-e4618ec3fa38'))")
			.concatCriterion("handler", "=", affairStatistic.getEmp()).concatCriterion("node_order", "!=", "1")
			.concatCriterion("handle_time", "like", affairStatistic.getMonth() + "%")));
			
			//设置合计发起数量
			affairStatistic.setStartNum10();
			//设置合计审批数量
			affairStatistic.setHandleNum10();
			
			baseMapper.updateByPrimaryKey(affairStatistic);
		}
	}
}