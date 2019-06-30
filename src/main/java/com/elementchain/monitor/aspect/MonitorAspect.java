package com.elementchain.monitor.aspect;

import com.elementchain.base.enums.OperateEnum;
import com.elementchain.monitor.annotations.EnableMonitor;
import com.elementchain.monitor.annotations.Monitor;
import com.elementchain.monitor.enums.Level;
import com.elementchain.monitor.utils.LogUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.core.annotation.Order;

import java.lang.reflect.Method;
import java.util.Objects;

/**
 * @author wenlong
 */
@Slf4j
@Order(3)
@Aspect
public class MonitorAspect {

    @Around("(execution(* *..*ServiceImpl.*(..)))")
    public Object record(ProceedingJoinPoint point) throws Throwable {
        EnableMonitor enableMonitor = point.getTarget().getClass().getAnnotation(EnableMonitor.class);
        Method method = ((MethodSignature) point.getSignature()).getMethod();
        Monitor monitor = method.getAnnotation(Monitor.class);
        Level level = Objects.isNull(monitor) ? Level.INFO : monitor.level();
        String className = point.getTarget().getClass().getName();
        String methodName = method.getName();
        if (needMonitor(enableMonitor, monitor, methodName)) {
            printLog(level, getStartLogMsg(className, methodName, monitor), point.getArgs());
            long startTime = System.currentTimeMillis();
            Object result = point.proceed();
            long cost = System.currentTimeMillis() - startTime;
            boolean hasReturn = !Objects.equals(method.getReturnType().toString(), "void");
            printLog(level, getEndLogMsg(className, methodName, hasReturn), hasReturn? new Object[]{result, cost}: new Object[]{cost});
            return result;
        } else {
            return point.proceed();
        }
    }

    private Boolean needMonitor(EnableMonitor enableMonitor, Monitor monitor, String methodName) {
        if (Objects.isNull(enableMonitor)) {
            return false;
        }
        if (Objects.nonNull(monitor)) {
            return true;
        }
        OperateEnum[] operateEnums = enableMonitor.logEnums();
        return LogUtil.needLog(operateEnums, methodName);
    }

    private String getStartLogMsg(String className, String methodName, Monitor monitor) {
        StringBuilder logMsg = new StringBuilder(className).append(".").append(methodName).append(" start, ");
        if (Objects.nonNull(monitor)) {
            String[] paramNames = monitor.paramNames();
            if (paramNames.length != 0) {
                for (String paramName : paramNames) {
                    logMsg.append(paramName).append(":{}, ");
                }
            }
            logMsg.delete(logMsg.length() - 2, logMsg.length());
        } else {
            logMsg.append("params:{}, ");
        }
        return logMsg.toString();
    }

    private String getEndLogMsg(String className, String methodName, Boolean hasReturn) {
        if (hasReturn) {
            return className + "." + methodName + " end, return:{}, cost:{}";
        }else {
            return className + "." + methodName + " end, cost:{}";
        }
    }

    private void printLog(Level level, String logMsg, Object[] args) {
        switch (level) {
            case DEBUG:
                log.debug(logMsg, args);
                break;
            case INFO:
                log.info(logMsg, args);
                break;
            case ERROR:
                log.warn(logMsg, args);
                break;
            default:
                log.error(logMsg, args);
                break;
        }
    }
}
