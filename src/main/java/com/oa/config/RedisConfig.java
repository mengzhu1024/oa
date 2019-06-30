package com.oa.config;

import com.elementchain.jedis.JedisClient;
import com.elementchain.jedis.impl.JedisClientSingle;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * @author huwenlong
 * @date 2019/5/17 13:37
 */
@Configuration
public class RedisConfig {

    @Value("${spring.redis.host}")
    private String host;

    @Value("${spring.redis.port}")
    private Integer port;

    @Value("${spring.redis.jedis.pool.max-active}")
    private Integer maxActive;

    @Value("${spring.redis.jedis.pool.max-idle}")
    private Integer maxIdle;

    @Value("${spring.redis.jedis.pool.min-idle}")
    private Integer minIdle;

    @Value("${spring.redis.timeout}")
    private Long timeout;

    @Bean("jedisPoolConfig")
    public JedisPoolConfig getJedisPoolConfig() {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(maxActive);
        jedisPoolConfig.setMaxIdle(maxIdle);
        jedisPoolConfig.setMinIdle(minIdle);
        jedisPoolConfig.setMaxWaitMillis(timeout);
        return jedisPoolConfig;
    }

    @Bean("jedisPool")
    public JedisPool getJedisPool() {
        return new JedisPool(getJedisPoolConfig(), host, port);
    }

    /**
     * 集群版配置
     * @return
     */
    /*@Bean("jedisCluster")
    public JedisCluster getJedisCluster() {
        Set<HostAndPort> nodes = new HashSet<>();
        nodes.add(new HostAndPort("192.168.137.60", 6379));
        nodes.add(new HostAndPort("192.168.137.60", 6380));
        nodes.add(new HostAndPort("192.168.137.60", 6381));
        nodes.add(new HostAndPort("192.168.137.60", 6382));
        nodes.add(new HostAndPort("192.168.137.60", 6383));
        nodes.add(new HostAndPort("192.168.137.60", 6384));
        return new JedisCluster(nodes);
    }

    @Bean("jedisClientCluster")
    public JedisClient getJedisClientCluster() {
        return new JedisClientCluster();
    }*/

    @Bean("jedisClientSingle")
    public JedisClient getJedisClientSingle() {
        return new JedisClientSingle();
    }

}
