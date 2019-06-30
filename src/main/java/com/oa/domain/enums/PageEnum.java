package com.oa.domain.enums;

import lombok.Getter;

/**
 * @author jiguang.qi
 * Created on 2018/11/13
 * Description
 */
public enum PageEnum {

    /**
     * 跳转页面枚举
     */
    ERROR("base/error", "登录页面"),
    INDEX("index", "登录页面"),
    MAIM("base/main", "主页面"),
    EMPLOYEE_ADMIN("member/employeeAdmin", "员工管理页面"),
    OPERATE_EMPLOYEE("member/operateEmployee", "操作员工页面"),
    AUTHORIZE("member/authorize", "员工授权页面"),
    DEPARTMENT_ADMIN("member/departmentAdmin", "部门管理页面"),
    OPERATE_DEPARTMENT("member/operateDepartment", "操作部门页面"),
    POSITION_ADMIN("member/positionAdmin", "职位管理页面"),
    OPERATE_POSITION("member/operatePosition", "操作职位页面"),
    AFFAIR_ADMIN("procedure/affairAdmin", "事务管理页面"),
    HANDLE_AFFAIR("procedure/handleAffair", "处理事务页面"),
    PROCEDURE_ADMIN("procedure/procedureAdmin", "流程管理页面"),
    OPERATE_PROCEDURE("procedure/operateProcedure", "操作流程页面"),
    DESIGN_NODE("procedure/designNode", "节点设计页面"),
    SELECT_CONTROL("procedure/selectControl", "选择控件页面"),
    PROCEDURE_TYPE_ADMIN("procedure/procedureTypeAdmin", "流程类型管理页面"),
    OPERATE_PROCEDURE_TYPE("procedure/operateProcedureType", "流程类型管理页面"),
    RIGHT_ADMIN("auth/rightAdmin", "权限管理页面"),
    ROLE_ADMIN("auth/roleAdmin", "角色管理页面"),
    OPERATE_ROLE("auth/operateRole", "操作角色页面"),
    BATCH_ADD_ROLE("auth/batchAddRole", "批量添加角色页面"),
    LINK_RIGHT("auth/linkRight", "关联权限页面"),
    DOCUMENT_ADMIN("document/documentAdmin", "文件管理页面"),
    UPLOAD_FILE("document/uploadFile", "上传文件页面"),
    EDIT_FILE("document/editDocument", "编辑文件页面"),
    DOCUMENT_SHARE("document/documentShare", "文件共享页面"),
    FORM_ADMIN("form/formAdmin", "表单管理页面"),
    OPERATE_FORM("form/operateForm", "操作表单页面"),
    HISTORY_VERSION("form/historyVersion", "表单历史版本页面"),
    DESIGN_FORM("form/designForm", "设计表单页面"),
    GROUP_ADMIN("group/groupAdmin", "分组管理页面"),
    OPERATE_GROUP("group/operateGroup", "操作分组页面"),
    LOG_ADMIN("log/logAdmin", "日志管理页面"),
    OPERATE_LOG("monitor/operateLog", "日志详细信息页面"),
    DUTY_ADMIN("work/dutyAdmin", "任务管理页面"),
    OPERATE_DUTY("work/operateDuty", "操作任务页面"),
    AFFAIR_STATISTIC_ADMIN("work/affairStatisticAdmin", "事务统计页面"),
    DUTY_STATISTIC_ADMIN("work/dutyStatisticAdmin", "任务统计页面"),
    ;

    @Getter
    private String page;

    @Getter
    private String desc;

    PageEnum(String page, String desc) {
        this.page = page;
        this.desc = desc;
    }
}
