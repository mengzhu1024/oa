package com.elementchain.jedis.impl;

import com.elementchain.jedis.JedisClient;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import redis.clients.jedis.JedisCluster;
import redis.clients.jedis.exceptions.JedisException;

import java.util.Collections;

@Slf4j
public class JedisClientCluster extends JedisClient {

	@Autowired
	private JedisCluster jedisCluster;

	@Override
	public <T> T get(String key, Class<T> clazz) {
		try {
			String value = jedisCluster.get(key);
			if(value != null) {
				return parseObject(value, clazz);
			}
		}catch (Exception e) {
			log.error("get method error, key:{}, clazz:{}, e:", key, clazz.getSimpleName());
		}
		return null;
	}

	@Override
	public boolean set(String key, Object value, long expire) {
		try {
			jedisCluster.set(key, toJSONString(value));
			if(expire >= 0) {
				jedisCluster.pexpire(key, expire);
			}
			return Boolean.TRUE;
		}catch (Exception e) {
			log.error("set method error, key:{}, value:{}, expire:{}, e:", key, value, expire);
			return Boolean.FALSE;
		}
	}

	@Override
	public <T> T hget(String key, String hkey, Class<T> clazz) {
		try {
			String value = jedisCluster.hget(key, hkey);
			if(value != null) {
				return parseObject(value, clazz);
			}
			return null;
		}catch (Exception e) {
			log.error("hget method error, key:{}, hkey:{}, clazz:{}, e:", key, hkey, clazz.getSimpleName(), e);
		}
		return null;
	}

	@Override
	public boolean hset(String key, String hkey, Object value, long expire) {
		try {
			jedisCluster.hset(key, hkey, toJSONString(value));
			if (expire > 0) {
				jedisCluster.pexpire(key, expire);
			}
			return Boolean.TRUE;
		}catch (Exception e) {
			log.error("hset method error, key:{}, hkey:{}, value:{}, expire:{}, e:", key, hkey, value, expire, e);
			return Boolean.FALSE;
		}
	}

	@Override
	public long expire(String key, long expire) {
		try {
			return jedisCluster.pexpire(key, expire);
		}catch (Exception e) {
			log.error("expire method error, key:{}, expire:{}, e:", key, expire, e);
			return 0;
		}
	}

	@Override
	public long ttl(String key) {
		try {
			return jedisCluster.ttl(key);
		}catch (Exception e) {
			log.error("ttl method error, key:{}, e:", key, e);
			return 0;
		}
	}

	@Override
	public boolean del(String key) {
		try {
			jedisCluster.del(key);
			return Boolean.TRUE;
		}catch (Exception e) {
			log.error("del method error, key:{}, e:", key, e);
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean del(String key, String value) {
		String script = "if redis.call('get', KEYS[1]) == ARGV[1] then return redis.call('del', KEYS[1]) else return 0 end";
		try {
			Object result = jedisCluster.eval(script, Collections.singletonList(key), Collections.singletonList(value));
			return LOCK_SUCCESS.equals(result);
		}catch (Exception e) {
			log.error("del method error, key:{}, value:{}, e:", key, value, e);
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean hdel(String key, String hkey) {
		try {
			jedisCluster.hdel(key, hkey);
			return Boolean.TRUE;
		}catch (Exception e) {
			log.error("hdel method error, key:{}, hkey:{}, e:", key, hkey, e);
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean setnx(String key, String value, Long expire) {
		try {
			String result = jedisCluster.set(key, value, SET_IF_NOT_EXIST, SET_WITH_EXPIRE_TIME, expire);
			return LOCK_SUCCESS.equals(result);
		}catch (Exception e) {
			log.error("setnx method error, key:{}, value:{}, expire:{}, e:", key, value, expire, e);
			return Boolean.FALSE;
		}
	}
}
