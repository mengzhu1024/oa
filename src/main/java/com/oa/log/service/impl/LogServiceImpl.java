package com.oa.log.service.impl;

import com.elementchain.base.entity.PageResult;
import com.oa.log.entity.Log;
import com.oa.log.entity.LogCriteria;
import com.oa.log.mapper.LogMapper;
import com.oa.log.service.LogService;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LogServiceImpl implements LogService {

	@Autowired
	private LogMapper<Log> logMapper;
	
	@Override
	public Log selectByPrimaryKey(LogCriteria logCriteria) {
		List<String> tableList = logMapper.selectNeedTables(StringUtil.generateTableName(- logCriteria.getMonthNum()), 
				" <= '"+StringUtil.generateTableName(0)+"' and TABLE_NAME >");
		logCriteria.setTableList(tableList);
		return logMapper.selectAll(logCriteria).get(0);
	}
	
	@Override
	public PageResult<Log> selectPage(LogCriteria logCriteria) {
		List<String> tableList = logMapper.selectNeedTables(StringUtil.generateTableName(- logCriteria.getMonthNum()), 
				" <= '"+StringUtil.generateTableName(0)+"' and TABLE_NAME >");
		logCriteria.setTableList(tableList);
		return PageResult.getCurrentPageResult(logMapper.selectAll(logCriteria));
	}

	@Override
	public void createLogTable(int offset) {
		List<String> tableList = new ArrayList<String>();
		//添加当月和后两个月的日志表
		for(int i = 0; i <= offset; i ++){
			tableList.add(StringUtil.generateTableName(i));
		}
		for(String tableName: tableList){
			logMapper.createLogTable(tableName);
		}
	}

	@Override
	public void dropLogTable(int offset) {
		List<String> tableList = logMapper.selectNeedTables(StringUtil.generateTableName(offset), "<=");
		for(String tableName: tableList){
			logMapper.dropLogTable(tableName);
		}
	}

	@Override
	public void insert(Log log) {
		logMapper.insertLog(log, StringUtil.generateTableName(0));
	}
}
