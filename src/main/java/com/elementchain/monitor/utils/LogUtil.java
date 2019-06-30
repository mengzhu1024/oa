package com.elementchain.monitor.utils;

import com.elementchain.base.enums.OperateEnum;

/**
 * @author huwenlong
 * @date 2019/4/11 10:30
 */
public class LogUtil {

    public static Boolean needLog(OperateEnum[] operateEnums, String methodName) {
        for (OperateEnum operateEnum : operateEnums) {
            switch (operateEnum) {
                case ADD:
                    if (methodName.startsWith("insert") || methodName.startsWith("batchInsert")) {
                        return true;
                    }
                    break;
                case UPDATE:
                    if (methodName.startsWith("update") || methodName.startsWith("batchUpdate")) {
                        return true;
                    }
                    break;
                case DELETE:
                    if (methodName.startsWith("delete") || methodName.startsWith("batchDelete")) {
                        return true;
                    }
                    break;
                default:
                    if (methodName.startsWith("select")) {
                        return true;
                    }
                    break;
            }
        }
        return false;
    }

}
