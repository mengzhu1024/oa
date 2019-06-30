package com.elementchain.base.interceptor;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.Criterion;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.PageResult;
import com.elementchain.utils.ReflectUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.plugin.*;
import org.springframework.util.StringUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;

/**
 * @author wenlong
 */
@Slf4j
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class, Integer.class}) })
public class ExecutorInterceptor implements Interceptor {
	/**
	 * 数据库类型，不同的数据库有不同的分页方法
	 */
	private String  databaseType;

	private static final String DB_MYSQL = "mysql";

	private static final String DB_ORACLE = "oracle";

	public ExecutorInterceptor(String databaseType) {
		this.databaseType = databaseType;
	}

	/**
	 * 拦截sql语句后执行的方法
	 * @param invocation invocation
	 * @return preparedStatement
	 * @throws Throwable 数据库异常
	 */
	@Override
	public Object intercept(Invocation invocation) throws Throwable {
		RoutingStatementHandler handler = (RoutingStatementHandler) invocation.getTarget();
		StatementHandler delegate = (StatementHandler) ReflectUtil.getFieldValue(handler, "delegate");
		BoundSql boundSql = delegate.getBoundSql();
		Object obj = boundSql.getParameterObject();
		StringBuilder sqlBuilder = new StringBuilder(boundSql.getSql());
		if (obj instanceof Criteria) {
			Criteria criteria = (Criteria) obj;
			List<Criterion> criterionList = criteria.getCriteria();
			Connection connection = (Connection) invocation.getArgs()[0];
			if(obj instanceof PageCriteria<?>){
				//分页查询
				StringBuilder countSqlBuilder = new StringBuilder(sqlBuilder);
				int i = 0;
				for(Criterion criterion : criterionList){
					if(i == 0){
						if(criterion.isInjection()){
							sqlBuilder.append(" where ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ?");
							countSqlBuilder.append(" where ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ?");
						}else{
							sqlBuilder.append(" where ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ").append(criterion.getValue());
							countSqlBuilder.append(" where ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ").append(criterion.getValue());
						}
					}else{
						if(criterion.isInjection()){
							sqlBuilder.append(" and ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ?");
							countSqlBuilder.append(" and ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ?");
						}else{
							sqlBuilder.append(" and ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ").append(criterion.getValue());
							countSqlBuilder.append(" and ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ").append(criterion.getValue());
						}
					}
					i ++;
				}
				if(!StringUtils.isEmpty(criteria.getOrderBy())){
					sqlBuilder.append(" order by ").append(criteria.getOrderBy());
				}
				setPageRowCount((PageCriteria<?>) criteria, countSqlBuilder, connection);
				setPageSql((PageCriteria<?>) criteria, sqlBuilder);
			}else{
				//不分页查询
				assembleNoPageCriteria(criterionList, sqlBuilder);
				if(!StringUtils.isEmpty(criteria.getOrderBy())){
					sqlBuilder.append(" order by ").append(criteria.getOrderBy());
				}
				if(criteria.getLimit() != null && criteria.getLimit() != 0) {
					sqlBuilder.append(" limit 0, ").append(criteria.getLimit());
				}
			}
			//绑定拼装后的sql
			ReflectUtil.setFieldValue(boundSql, "sql", sqlBuilder.toString());
			//取出PreparedStatement进行自定义参数注入
			PreparedStatement preparedStatement = (PreparedStatement) invocation.proceed();
			int i = 1;
			for(Criterion criterion : criterionList){
				if(criterion.isInjection()){
					preparedStatement.setObject(i, criterion.getValue());
					i ++;
				}
			}
			return preparedStatement;
		}
		return invocation.proceed();
	}

	private void assembleNoPageCriteria(List<Criterion> criterionList, StringBuilder sqlBuilder) {
		//拼装条件
		int i = 0;
		for(Criterion criterion : criterionList){
			if(i == 0){
				if(criterion.isInjection()){
					sqlBuilder.append(" where ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ?");
				}else{
					sqlBuilder.append(" where ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ").append(criterion.getValue());
				}
			}else{
				if(criterion.isInjection()){
					sqlBuilder.append(" and ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ?");
				}else{
					sqlBuilder.append(" and ").append(criterion.getParam()).append(" ").append(criterion.getRelation()).append(" ").append(criterion.getValue());
				}
			}
			i ++;
		}
	}

	/**
	 * 拦截器对应的封装原始对象的方法
	 */
	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	/**
	 * 给拦截器设置属性
	 * @param properties 数据库属性
	 */
	@Override
	public void setProperties(Properties properties) {
		this.databaseType = properties.getProperty("databaseType");
	}

	/**
	 * 根据不同的数据库、原有的sql和分页信息生成相应的分页sql
	 * @param pageCriteria 查询封装类
	 * @param sqlBuilder sql语句
	 */
	private void setPageSql(PageCriteria<?> pageCriteria, StringBuilder sqlBuilder) {
		if (DB_MYSQL.equalsIgnoreCase(databaseType)) {
			setMysqlPageSql(pageCriteria, sqlBuilder);
		} else if (DB_ORACLE.equalsIgnoreCase(databaseType)) {
			setOraclePageSql(pageCriteria, sqlBuilder);
		}
	}

	/**
	 * 得到mysql数据库的分页
	 * @param pageCriteria 查询封装类
	 * @param sqlBuilder sql语句
	 */
	private void setMysqlPageSql(PageCriteria<?> pageCriteria, StringBuilder sqlBuilder) {
		// 计算第一条记录的位置，Mysql中记录的位置是从0开始的。
		int offset = (pageCriteria.getPageNum() - 1) * pageCriteria.getPageSize();
		sqlBuilder.append(" limit ").append(offset).append(",").append(pageCriteria.getPageSize());
	}

	/**
	 * 获取Oracle数据库的分页查询语句
	 * @param pageCriteria 查询封装类
	 * @param sqlBuilder sql语句
	 */
	private void setOraclePageSql(PageCriteria<?> pageCriteria, StringBuilder sqlBuilder) {
		int offset = (pageCriteria.getPageNum() - 1) * pageCriteria.getPageSize() + 1;
		sqlBuilder.insert(0, "select u.*, rownum r from (").append(") u where rownum < ").append(offset + pageCriteria.getPageSize())
				.insert(0, "select * from (").append(") where r >= ").append(offset);
	}

	/**
	 * 给pageCriteria设置总记录数
	 * @param pageCriteria 查询封装类
	 * @param countSqlBuilder sql语句
	 * @param connection 连接
	 */
	private void setPageRowCount(PageCriteria<?> pageCriteria, StringBuilder countSqlBuilder, Connection connection) {
		int fromIndex = countSqlBuilder.lastIndexOf("from");
		String countSql = "select count(*) " + countSqlBuilder.substring(fromIndex);
		ResultSet rs = null;
		List<Criterion> criterionList = pageCriteria.getCriteria();
		try (PreparedStatement preparedStatement = connection.prepareStatement(countSql)) {
			int i = 1;
			//参数注入
			for(Criterion criterion : criterionList){
				if(criterion.isInjection()){
					preparedStatement.setObject(i, criterion.getValue());
					i ++;
				}
			}
			rs = preparedStatement.executeQuery();
			rs.next();
			// 给当前的参数pageCriteria对象设置总记录数
			PageResult pageResult = PageResult.getCurrentPageResult();
			Integer rowCount = rs.getInt(1);
			Integer pageCount = rowCount == 0? 1: (rowCount-1)/pageCriteria.getPageSize() + 1;
			Integer pageNum = pageCriteria.getPageNum() < pageCount? pageCriteria.getPageNum(): pageCount;
			pageResult.setRowCount(rowCount);
			pageResult.setPageCount(pageCount);
			pageResult.setPageNum(pageNum);
		} catch (SQLException e) {
			log.error("setPageRowCount method error, e:", e);
		} finally {
			try {
				if (rs != null){
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}