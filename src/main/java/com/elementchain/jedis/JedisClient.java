package com.elementchain.jedis;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.serializer.SerializerFeature;
import redis.clients.jedis.exceptions.JedisException;

import java.util.Collection;
import java.util.Map;

public abstract class JedisClient {

	protected String LOCK_SUCCESS = "OK";

	protected String SET_IF_NOT_EXIST = "NX";

	protected String SET_WITH_EXPIRE_TIME = "PX";

	public abstract <T> T get(String key, Class<T> clazz);

	public abstract boolean set(String key, Object value, long expire);

	public abstract <T> T  hget(String key, String hkey, Class<T> clazz);

	public abstract boolean hset(String key, String hkey, Object value, long expire);

	public abstract long expire(String key, long expire);

	public abstract long ttl(String key);

	public abstract boolean del(String key);

	public abstract boolean del(String key, String value);

	public abstract boolean hdel(String key, String hkey);

	public abstract boolean setnx(String key, String value, Long expire);

	protected String toJSONString(Object object) {
		return JSON.toJSONString(object, SerializerFeature.WriteClassName);
	}

	protected <T> T parseObject(String value, Class<T> clazz) {
		return JSON.parseObject(value, clazz, Feature.SupportAutoType);
	}
}
