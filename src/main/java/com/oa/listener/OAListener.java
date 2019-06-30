package com.oa.listener;

import com.elementchain.base.entity.ShadowCriteria;
import com.oa.auth.service.RightService;
import com.oa.cache.CacheMap;
import com.oa.cache.service.CacheService;
import com.oa.document.service.DocumentService;
import com.oa.log.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Objects;

/**
 * @author huwenlong
 */
@Component
public class OAListener implements ApplicationListener<ContextRefreshedEvent> {
	@Autowired
	private CacheService cacheService;
	
	@Autowired
	private RightService rightService;

	@Autowired
	private LogService logService;

	@Autowired
	private DocumentService documentService;

	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		//防止springmvc子容器重复加载
		if(event.getApplicationContext().getParent() == null){
			//刷新权限Map，重新从数据看获取权限
			cacheService.refreshRightMap();

			//刷新DempartmentMap
			cacheService.refreshDempartmentMap();
			//刷新ProcedureTypeMap
			cacheService.refreshProcedureTypeMap();

			//刷新notLinkDepartmentPositionMap
			cacheService.refreshNotLinkDepartmentPositionMap();
			
			//创建日志表
			logService.createLogTable(2);

			//删除半年前的日志
			logService.dropLogTable(-6);

			//清理临时文件夹
			documentService.clearTempDirectary();
			
			//设置最大权限位
			List<Integer> posList = rightService.selectSingleShadow(new ShadowCriteria<>("auth_right", "max(pos)"));
			posList.removeIf(Objects::isNull);
			CacheMap.maxRightPosition = CollectionUtils.isEmpty(posList)? 1: posList.get(0) + 1;
		}
	}
}
