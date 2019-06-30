package com.oa.log.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oa.log.entity.LogCriteria;

public interface LogMapper<Log> {
	
	List<Log> selectAll(LogCriteria logCriteria);
	
	void createLogTable(String tableName);
	
	List<String> selectNeedTables(@Param("tableName") String tableName, @Param("relation") String relation);
	
	void dropLogTable(String tableName);
	
	public void insertLog(@Param("monitor") Log log, @Param("tableName") String tableName);
}
