package com.oa.auth.controller;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.entity.ShadowCriteria;
import com.oa.annotations.RightAnnotation;
import com.oa.auth.entity.Role;
import com.oa.auth.service.RightService;
import com.oa.auth.service.RoleService;
import com.oa.cache.CacheMap;
import com.oa.domain.Result;
import com.oa.domain.enums.PageEnum;
import com.oa.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import java.util.List;

/**
 * @author huwenlong
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;
    
    @Autowired
    private RightService rightService;
    
    @RightAnnotation(name="查看角色", desc="这是查看角色的权限")
    @RequestMapping("/admin")
    public String admin(Model model, @RequestParam(required = false, defaultValue = "1") Integer pageNum) {
        model.addAttribute("pageNum", pageNum);
        return PageEnum.ROLE_ADMIN.getPage();
    }
    
    @ResponseBody
    @RequestMapping("/page")
    public Result page(PageCriteria<Role> pageCriteria) {
        return new Result<>(roleService.selectPage(pageCriteria));
    }
    
    @RightAnnotation(name="操作角色", desc="这是操作角色的权限")
    @RequestMapping("/to-operate")
    public String toOperate(Model model, String id, Integer pageNum) {
        if(!StringUtils.isEmpty(id)){
            model.addAttribute("role", roleService.selectByPrimaryKey(id));
        }
        model.addAttribute("pageNum", pageNum);
        return PageEnum.OPERATE_ROLE.getPage();
    }
    
    @RequestMapping("/operate")
    public String operate(Role role, Integer pageNum) {
        if(!StringUtils.isEmpty(role.getId())){
            roleService.update(role);
        }else{
            role.setId(StringUtil.randomUUID());
            roleService.insert(role);
        }
        return "redirect:/role/admin?pageNum=" + pageNum;
    }
    
    @RightAnnotation(name="批量添加角色", desc="这是批量添加角色的权限")
    @RequestMapping("/to-batch-add")
    public String toBatchAdd(Model model, Integer pageNum) {
        model.addAttribute("pageNum", pageNum);
        return PageEnum.BATCH_ADD_ROLE.getPage();
    }
    
    @ResponseBody
    @RequestMapping("/batch-add")
    public void batchAdd(@RequestBody Role[] roles) {
        for(Role role: roles){
            role.setId(StringUtil.randomUUID());
        }
        roleService.batchInsert(roles);
    }
    
    @RightAnnotation(name="批量更新角色", desc="这是批量更新角色的权限")
    @ResponseBody
    @RequestMapping("/to-batch-update")
    public void toBatchUpdate(@RequestBody Role[] roles) {
        roleService.batchUpdate(roles);
    }
    
    @RightAnnotation(name="删除角色", desc="这是删除角色的权限，包括批量删除")
    @ResponseBody
    @RequestMapping("/delete")
    public void delete(@RequestBody Role[] roles) {
		if(roles.length == 1){
			roleService.delete(roles[0]);
		}else{
			roleService.batchDelete(roles);
		}
    }
    
    @RightAnnotation(name = "关联权限", desc = "这是关联权限的权限")
    @RequestMapping("/to-link-right")
    public String toLinkRight(Model model, String id, Integer pageNum) {
        Role role = roleService.selectByPrimaryKey(id);
        model.addAttribute("rightMap", CacheMap.rightMap);
        model.addAttribute("role", role);
        List<String> ownRightIds = rightService.selectSingleShadow(new ShadowCriteria<String>("auth_role_right", "right_id")
                .injectCriterion("role_id", "=", id));
        model.addAttribute("ownRightIds", ownRightIds);
        model.addAttribute("pageNum", pageNum);
        return PageEnum.LINK_RIGHT.getPage();
    }
    
    @ResponseBody
    @PostMapping("/link-right")
    public void linkRight(String id, String[] rightIds) {
        roleService.batchLinkRight(id, rightIds);
    }
}
