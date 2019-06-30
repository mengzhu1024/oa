package com.oa.member.controller;

import com.elementchain.base.entity.Criteria;
import com.elementchain.base.entity.Criterion;
import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.ShadowCriteria;
import com.oa.annotations.NoLoginAnnotation;
import com.oa.annotations.RightAnnotation;
import com.oa.auth.service.RoleService;
import com.oa.cache.CacheMap;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.domain.enums.ResultEnum;
import com.oa.group.service.GroupService;
import com.oa.member.entity.Employee;
import com.oa.member.entity.EmployeeExt;
import com.oa.member.service.EmployeeService;
import com.oa.procedure.entity.Affair;
import com.oa.procedure.service.AffairService;
import com.oa.utils.Constant;
import com.oa.utils.MD5;
import com.oa.utils.StringUtil;
import com.oa.utils.ValidateUtil;
import com.oa.work.entity.AffairStatistic;
import com.oa.work.entity.Duty;
import com.oa.work.entity.DutyStatistic;
import com.oa.work.service.AffairStatisticService;
import com.oa.work.service.DutyService;
import com.oa.work.service.DutyStatisticService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * @author wenlong
 */
@Slf4j
@Controller
@RequestMapping("/emp")
public class EmployeeController {

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private AffairService affairService;

    @Autowired
    private AffairStatisticService affairStatisticService;

    @Autowired
    private DutyStatisticService dutyStatisticService;

    @Autowired
    private DutyService dutyService;

    @NoLoginAnnotation
    @PostMapping("/login")
    public String login(EmployeeExt loginer, HttpServletRequest request) {
        loginer = employeeService.validLoginer(loginer.getAccount(), MD5.encipher(loginer.getAccount() + loginer.getPassword()));
        if (loginer == null) {
            request.setAttribute("loginInfo", ResultEnum.LOGIN_PWD_ERROR.getDesc());
            return PageEnum.INDEX.getPage();
        }
        if (loginer.getRights() == null) {
            // 如果缓存失效重新进行权限计算
            loginer.setRights(new long[CacheMap.maxRightPosition]);
            loginer.caculateRightCount();
        }
        request.getSession().setAttribute("loginer", loginer);

        List<AffairStatistic> affairList;
        affairList = affairStatisticService.selectCondition(new Criteria()
                .concatCriterion("(emp, month)", "=",
                        "('" + loginer.getName() + "(" + loginer.getAccount() + ")', '" + StringUtil.dateToString(new Date(), "yyyy-MM") + "')"));

        //如果本月第一次登录，则添加事务统计信息和任务统计信息
        if (CollectionUtils.isEmpty(affairList)) {
            AffairStatistic affairStatistic = new AffairStatistic();
            affairStatistic.setId(StringUtil.randomUUID());
            affairStatistic.setEmp(loginer.getName() + "(" + loginer.getAccount() + ")");
            affairStatistic.setMonth(StringUtil.dateToString(new Date(), "yyyy-MM"));
            affairStatisticService.insert(affairStatistic);
        }

        List<DutyStatistic> dutyList;
        dutyList = dutyStatisticService.selectCondition(new Criteria()
                .concatCriterion("(executor, month)", "=",
                        "('" + loginer.getName() + "(" + loginer.getAccount() + ")', '" + StringUtil.dateToString(new Date(), "yyyy-MM") + "')"));
        if (CollectionUtils.isEmpty(dutyList)) {
            DutyStatistic dutyStatistic = new DutyStatistic();
            dutyStatistic.setId(StringUtil.randomUUID());
            dutyStatistic.setExecutor(loginer.getName() + "(" + loginer.getAccount() + ")");
            dutyStatistic.setMonth(StringUtil.dateToString(new Date(), "yyyy-MM"));
            try {
                dutyStatisticService.insert(dutyStatistic);
            } catch (Exception e) {
                log.error("login method. insert duty statistic error, e:", e);
            }
        }
        return "redirect:/emp/main";
    }

    @RightAnnotation(name = "去往主页面", desc = "这是去往主页面的权限", common = true)
    @RequestMapping("/main")
    public String toMainView(HttpSession session, HttpServletRequest request) {
        EmployeeExt loginer = (EmployeeExt) session.getAttribute("loginer");
        //登陆成功后查询我的待办事宜、未查看的任务
        List<Affair> affairList = affairService.selectCondition(new Criteria().
                concatCriterion("(handler_id", "= '" + loginer.getAccount() + "' and status = 0)",
                        " or (sponsor_id = '" + loginer.getId() + "' AND status = 1)"));
        int len = affairList.size();
        if (len > 0) {
            String msg = "待办事宜：您有" + len + "条待办事务";
            if (len == 1) {
                msg = "待办事宜：" + affairList.get(0).getName();
            }
            request.setAttribute("msg", msg);
            request.setAttribute("len", len);
        }

        List<Duty> dutyList = dutyService.selectCondition(new Criteria()
                .concatCriterion("(executor, status)", "=", "('" + loginer.getName() +
                        "(" + loginer.getAccount() + ")" + "', 0)"));
        len = dutyList.size();
        if (len > 0) {
            String msg2 = "待办任务：您有" + len + "条待办事务";
            if (len == 1) {
                msg2 = "待办任务：" + dutyList.get(0).getTitle();
            }
            request.setAttribute("msg2", msg2);
            request.setAttribute("len2", len);
        }
        request.setAttribute("ip_port", Constant.IP_PORT);
        return PageEnum.MAIM.getPage();
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest request, String loginInfo) {
        request.setAttribute("loginInfo", loginInfo);
        return "index";
    }

    @RightAnnotation(name = "查看员工", desc = "这是查看员工的权限")
    @GetMapping("/admin")
    public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
        model.addAttribute("departmentMap", CacheMap.departmentMap);
        model.addAttribute("notLinkDepartmentPositionMap", CacheMap.notLinkDepartmentPositionMap);
        model.addAttribute("pageNum", pageNum);
        return PageEnum.EMPLOYEE_ADMIN.getPage();
    }

    @ResponseBody
    @PostMapping("/page")
    public Result page(PageCriteria<EmployeeExt> pageCriteria) {
        return new Result<>(employeeService.selectExtPage(pageCriteria));
    }

    @RightAnnotation(name = "操作员工", desc = "这是操作员工的权限")
    @GetMapping("/to-operate")
    public String toOperate(Model model, String id, Integer pageNum, String type) {
        if (!StringUtils.isEmpty(id)) {
            Employee employee = employeeService.selectWithGroup(id);
            if ("copy".equals(type)) {
                //如果复制员工，移除id
                employee.setId(null);
            } else {
                //如果点击复制按钮，没有任何操作返回，这时候如果修改员工，则会从缓存中取出没有id的数据，这里需要重新为id赋值
                employee.setId(id);
            }
            model.addAttribute("employee", employee);
        }
        model.addAttribute("departmentMap", CacheMap.departmentMap);
        model.addAttribute("notLinkDepartmentPositionMap", CacheMap.notLinkDepartmentPositionMap);
        model.addAttribute("pageNum", pageNum);
        return PageEnum.OPERATE_EMPLOYEE.getPage();
    }

    @ResponseBody
    @PostMapping("/operate")
    public Result operate(Employee employee, HttpServletRequest request) {
        employee.setDepId(!StringUtils.isEmpty(employee.getDepId()) ?
                employee.getDepId() : null);
        employee.setPosId(!StringUtils.isEmpty(employee.getPosId()) ?
                employee.getPosId() : null);
        //如果操作员工不记录日志
        PageCriteria<Employee> employeeCriteria = new PageCriteria<>();
        if(StringUtils.isEmpty(employee.getId())){
            //如果增加员工，则全表扫描有没有重复的accnum和email
            employeeCriteria.injectCriterion("account", "=", employee.getAccount());
            List<Employee> list = employeeService.selectCondition(employeeCriteria);
            if(!CollectionUtils.isEmpty(list)){
                return new Result<>(ResultEnum.ACCOUNT_HAS_EXISTS);
            }
            employeeCriteria.getCriteria().get(0).setParam("telnum").setValue(employee.getTelnum());
            list = employeeService.selectCondition(employeeCriteria);
            if(!CollectionUtils.isEmpty(list)){
                return new Result<>(ResultEnum.PHONE_HAS_EXISTS);
            }
            employee.setId(StringUtil.randomUUID());
            employee.setPassword(MD5.encipher(employee.getAccount() + employee.getPassword()));
            employeeService.insert(employee);
        }else {
            // 如果是修改员工
            employeeCriteria.injectCriterion("telnum", "=", employee.getTelnum())
                    .concatCriterion("telnum", "!=", "(select telnum from member_employee where id = '"+employee.getId()+"')");
            List<Employee> list = employeeService.selectCondition(employeeCriteria);
            if(!CollectionUtils.isEmpty(list)) {
                return new Result<>(ResultEnum.PHONE_HAS_EXISTS);
            }
            employeeService.updateSelective(employee);
        }
        //如果操作成功，则设置分组
        String[] groupIds = request.getParameterValues("groupIds[]");
        if (ValidateUtil.isValid(groupIds)) {
            groupService.devideGroup(employee.getId(), groupIds);
        }
        return new Result<>(ResultEnum.DEFAULT_SUCCESS);
    }

    @RightAnnotation(name = "批量更新员工", desc = "这是批量更新员工的权限")
    @ResponseBody
    @PutMapping("/batch-update")
    public Result batchUpdate(@RequestBody Employee[] employees) {
        employeeService.batchUpdateSelective(employees);
        return new Result<>(ResultEnum.DEFAULT_SUCCESS);
    }

    @RightAnnotation(name = "删除员工", desc = "这是删除员工的权限，包括批量删除")
    @ResponseBody
    @RequestMapping("/delete")
    public Result delete(@RequestBody Employee[] employees) {
        if (employees.length == 1) {
            employeeService.delete(employees[0]);
        } else {
            employeeService.batchDelete(employees);
        }
        return new Result<>(ResultEnum.DEFAULT_SUCCESS);
    }

    @RightAnnotation(name = "用户授权", desc = "这是用户授权的权限")
    @RequestMapping("/to-authorize")
    public String toAuthorize(Model model, String id, Integer pageNum) {
        model.addAttribute("roleList", roleService.selectAll());
        model.addAttribute("employee", employeeService.selectByPrimaryKey(id));
        model.addAttribute("ownRoleIds", roleService.selectSingleShadow(new ShadowCriteria<String>("member_emp_role", "role_id")
                .injectCriterion("emp_id", "=", id)));
        model.addAttribute("pageNum", pageNum);
        return PageEnum.AUTHORIZE.getPage();
    }

    @ResponseBody
    @PostMapping("/authorize")
    public Result authorize(String id, String[] roleIds) {
        employeeService.authorize(id, roleIds);
        return new Result<>(ResultEnum.DEFAULT_SUCCESS);
    }

    @ResponseBody
    @GetMapping("/list-by-dep")
    public Result listByDep(String depId) {
        Criterion criterion;
        if (Objects.equals(depId, "null")) {
            criterion = new Criterion("dep_id", "is", "null", false);
        } else {
            criterion = new Criterion("dep_id", "=", depId);
        }
        return new Result<>(employeeService.selectCondition(new Criteria().addCriterion(criterion)));
    }

    @ResponseBody
    @GetMapping("/list-by-pos")
    public Result listByPos(String posId) {
        return new Result<>(employeeService.selectCondition(new Criteria()
                .injectCriterion("pos_id", "=", posId)));
    }

    @ResponseBody
    @GetMapping("/get-by-id")
    public Result getById(String id) {
        return new Result<>(employeeService.selectByPrimaryKey(id));
    }

    @ResponseBody
    @GetMapping("/loginer")
    public Result loginer(HttpSession session) {
        return new Result<>(session.getAttribute("loginer"));
    }

}
