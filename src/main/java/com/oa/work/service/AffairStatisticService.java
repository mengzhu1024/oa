package com.oa.work.service;

import java.util.List;

import com.elementchain.base.service.BaseService;
import com.oa.work.entity.AffairStatistic;

public interface AffairStatisticService extends BaseService<AffairStatistic> {

	void affairStatistic(List<AffairStatistic> affairStatisticList);

}