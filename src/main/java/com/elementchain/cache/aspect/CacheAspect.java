package com.elementchain.cache.aspect;

import com.elementchain.cache.annotations.DelectCache;
import com.elementchain.cache.annotations.EnableCache;
import com.elementchain.cache.annotations.SelectCache;
import com.elementchain.jedis.JedisClient;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.Objects;

/**
 * @author wenlong
 */
@Order(2)
@Aspect
public class CacheAspect {

	@Resource(name = "jedisClientSingle")
	private JedisClient jedisClient;

	@Around("(execution(* *..*ServiceImpl.*(..)))")
//	@Around("@within(com.elementchain.cache.annotations.EnableCache)")
	public Object cacheRedis(ProceedingJoinPoint point) throws Throwable {
		//执行目标方法
		//读取接口方法签名
		Method method = ((MethodSignature)point.getSignature()).getMethod();
		String methodName = method.getName();
		EnableCache enableCache = point.getTarget().getClass().getAnnotation(EnableCache.class);
		if(Objects.nonNull(enableCache)){
			SelectCache selectCache = method.getAnnotation(SelectCache.class);
			if(Objects.nonNull(selectCache) || methodName.startsWith("select")){
				//读取方法参数
				Object[] params = point.getArgs();
				//读取缓存key
				StringBuilder key = new StringBuilder(enableCache.key()).append(":")
						.append(methodName).append(":");
				if(params.length == 1){
					key.append(params[0].toString());
				}else if(params.length >= 1){
					//其他缓存
					key.append(Arrays.toString(params));
				}
				//读取缓存对象
				Object cache = jedisClient.hget(enableCache.key(), key.toString(), method.getReturnType());
				if(Objects.isNull(cache)){
					cache = point.proceed();
					//缓存数据
					jedisClient.hset(enableCache.key(), key.toString(), Objects.isNull(cache)? "{}": cache, enableCache.expire());
				}
				return cache;
			}else{
				DelectCache delectCache = method.getAnnotation(DelectCache.class);
				if (deleteCache(delectCache, methodName) || methodName.startsWith("insert")
						|| methodName.startsWith("delete") || methodName.startsWith("update")) {
					//清除缓存对象
					if (jedisClient.del(enableCache.key())) {
						return point.proceed();
					}else {
						return null;
					}
				}else {
					return point.proceed();
				}
			}
		}else {
			return point.proceed();
		}
	}

	private Boolean deleteCache(DelectCache delectCache, String methodName) {
		return Objects.nonNull(delectCache) || methodName.startsWith("insert")
				|| methodName.startsWith("update") || methodName.startsWith("delete")
				|| methodName.startsWith("batch");
	}
}
