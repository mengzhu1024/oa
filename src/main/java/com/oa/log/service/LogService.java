package com.oa.log.service;

import com.elementchain.base.entity.PageResult;
import com.oa.log.entity.Log;
import com.oa.log.entity.LogCriteria;

public interface LogService {
	//ID查询
	Log selectByPrimaryKey(LogCriteria logCriteria);

	PageResult<Log> selectPage(LogCriteria logCriteria);

	void createLogTable(int offset);

	void dropLogTable(int offset);

	void insert(Log log);
}
