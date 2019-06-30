package com.oa.procedure.service.impl;

import com.elementchain.base.entity.PageCriteria;
import com.elementchain.base.service.BaseServiceImpl;
import com.oa.procedure.entity.Node;
import com.oa.procedure.mapper.NodeMapper;
import com.oa.procedure.service.NodeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.thymeleaf.util.StringUtils;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import java.util.List;

@Slf4j
@Service
public class NodeServiceImpl extends BaseServiceImpl<Node, NodeMapper> implements NodeService{
    
    @Override
    public Node selectNext(Node node, String[] controls) {
        Node nextNode = null;
        String branchJs = node.getBranchJs();
        if(!StringUtils.isEmpty(branchJs)){
            ScriptEngineManager manager = new ScriptEngineManager();
            ScriptEngine engine = manager.getEngineByName("javascript");
            //给js代码填充控件的值
            for(String control: controls){
                engine.put(control.split("\\|")[0], control.split("\\|")[1]);
            }
            try {
                //运行js字符串
                engine.eval(branchJs);
            } catch (ScriptException e) {
                log.error("engine.eval error, branchJs:{}, e:", branchJs, e);
                return null;
            }
            //得到计算结果序号
            String order = engine.get("order").toString();
            nextNode = baseMapper.selectAll(new PageCriteria<Node>()
                    .injectCriterion("proc_id", "=", node.getProcId())
                    .injectCriterion("`order`", "=", order)).get(0);
        }else{
            List<Node> nodeList = baseMapper.selectAll(new PageCriteria<Node>()
                    .injectCriterion("proc_id", "=", node.getProcId())
                    .injectCriterion("`order`", "=", node.getFlowNumber()));
            if(!CollectionUtils.isEmpty(nodeList)){
                nextNode = nodeList.get(0);
            }
        }
        return nextNode;
    }    
}
