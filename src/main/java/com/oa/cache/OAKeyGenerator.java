package com.oa.cache;

import java.lang.reflect.Method;
import java.util.Arrays;

import com.elementchain.base.entity.Criteria;
import org.springframework.cache.interceptor.KeyGenerator;
import com.oa.utils.StringUtil;

/**
 * 自定义缓存key生成器
 * @author Administrator
 *
 */
public class OAKeyGenerator implements KeyGenerator{

	@Override
	public Object generate(Object target, Method method, Object... params) {
		StringBuilder key = new StringBuilder(target.getClass().getSimpleName()).append(".").append(method.getName());
		if(params.length == 1){
			if(params[0] instanceof String){
				//缓存唯一查询
				key.append("(").append(params[0]).append(")");
			}else if(params[0] instanceof Criteria){
				//缓存条件查询和分页查询
				Criteria criteria = (Criteria) params[0];
				key.append("(").append(criteria).append(")");
			}else{
				//缓存其他
				key.append("(").append(params[0].toString()).append(")");
			}
		}else if(params.length >= 1){
			//其他缓存
			key.append("(").append(Arrays.toString(params)).append(")");
		}
		System.out.println("key：" + key);
		return key.toString();
	}
}
