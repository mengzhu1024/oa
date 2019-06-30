package com.oa.log.aspect;

import com.elementchain.base.enums.OperateEnum;
import com.elementchain.monitor.utils.LogUtil;
import com.oa.log.annotations.EnableLog;
import com.oa.log.annotations.RecordLog;
import com.oa.log.entity.Log;
import com.oa.log.service.LogService;
import com.oa.member.entity.EmployeeExt;
import com.oa.utils.StringUtil;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Date;
import java.util.Objects;

@Order(1)
@Aspect
@Component
public class LogAspect{

    @Autowired
    private LogService logService;

    @Autowired(required = false)
    private HttpSession session;

    private Logger logger = LoggerFactory.getLogger(getClass());

    //日志记录方法
    @Around("(execution(* *..*ServiceImpl.*(..))) && !bean(logServiceImpl)")
//	@Around("@within(com.oa.monitor.annotations.EnableLog)")
    public Object record(ProceedingJoinPoint point) throws Throwable {
        Class<?> targetClass = point.getTarget().getClass();
        EnableLog enableLog = targetClass.getAnnotation(EnableLog.class);
        Method method = ((MethodSignature)point.getSignature()).getMethod();
        RecordLog recordLog = method.getAnnotation(RecordLog.class);
        String methodName = method.getName();
        Log log;
        if (needLog(enableLog, recordLog, methodName)) {
            log = new Log();
            log.setId(StringUtil.randomUUID());
            if (Objects.nonNull(session)) {
                EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
                //设置操作人
                if (Objects.nonNull(loginer)) {
                    log.setOperator(loginer.getName());
                }
            }

            String operate = Objects.isNull(recordLog)? methodName + " " + enableLog.target(): recordLog.operate();
            log.setOperate(operate);
            //设置操作参数
            if(point.getArgs().length == 1){
                Object param = point.getArgs()[0];
                String object;
                if(param instanceof Object[]){
                    object = StringUtil.arraysToString((Object[]) param, "<br>");
                }else if(param instanceof Collection){
                    object = StringUtil.collectionToString((Collection<?>) param, "<br>");
                }else{
                    object = param.toString();
                }
                log.setObject(object.length() > 950? object.substring(0, 950): object);
            }else{
                log.setObject(StringUtil.arraysToString(point.getArgs(), ","));
            }
            //设置操作时间
            log.setOpertime(new Date());
            Object obj = null;
            try {
                obj = point.proceed();
            } catch (Throwable e) {
                log.setSuccess(false);
                log.setErrormes(e.getMessage());
                obj = e.getMessage();
                logger.error("{}-{} error, e:", targetClass.getName(), methodName, e);
            }finally{
                // logService.insert(monitor);
                return obj;
            }
        }else {
            return point.proceed();
        }
    }

    private Boolean needLog(EnableLog enableLog, RecordLog recordLog, String methodName) {
        if (Objects.isNull(enableLog)) {
            return false;
        }
        if (Objects.nonNull(recordLog)) {
            return true;
        }
        OperateEnum[] operateEnums = enableLog.logEnums();
        return LogUtil.needLog(operateEnums, methodName);
    }
}
