package com.oa.config;

import com.elementchain.base.interceptor.ExecutorInterceptor;
import com.elementchain.cache.aspect.CacheAspect;
import com.elementchain.handler.RestExceptionHandler;
import com.elementchain.monitor.aspect.MonitorAspect;
import com.oa.interceptor.RightInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @author wenlong
 */
@Configuration
public class BeansConfig implements WebMvcConfigurer {

    @Bean
    public CacheAspect getCacheAspect() {
        return new CacheAspect();
    }

    @Bean
    public MonitorAspect getFileLogAspect() {
        return new MonitorAspect();
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new RightInterceptor()).addPathPatterns("/**");
    }

    @Bean
    public Interceptor getInterceptor(){
        return new ExecutorInterceptor("mysql");
    }

    /**
     * 注入ServerEndpointExporter，这个bean会自动注册使用了@ServerEndpoint注解声明的Websocket endpoint
     * @return ServerEndpointExporter
     */
    @Bean
    public ServerEndpointExporter serverEndpointExporter() {
        return new ServerEndpointExporter();
    }

    @Bean
    public SqlSession batchSqlSession(SqlSessionFactory sqlSessionFactory){
        return sqlSessionFactory.openSession(ExecutorType.BATCH);
    }

    @Bean
    public RestExceptionHandler restExceptionHandler() {
        return new RestExceptionHandler();
    }
}
