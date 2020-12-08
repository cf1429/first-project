package com.using.cms.service.impl;

import com.using.cms.bean.BusinessException;
import com.using.cms.bean.Function;
import com.using.cms.bean.extra.TreeNode;
import com.using.cms.dao.FunctionDao;
import com.using.cms.service.FunctionService;
import com.using.cms.util.ErrorEnum;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class FunctionServiceImpl implements FunctionService {
    @Autowired
    private FunctionDao FunctionDao;

    @Override
    public int insertFunction(Function function) {
        function.setState(1);
        List<Function> list = FunctionDao.selectParent(function.getPid());
        if(list.size()>0) {
            function.setLevel(list.get(0).getLevel()+1);
        }else {
            function.setLevel(1);
        }
        return FunctionDao.insert(function);
    }

    @Override
    public int updateFunction(Function function) {
        return FunctionDao.update(function);
    }

    @Override
    public List<Function> list(Map<String, Object> conditions) {
        List<Function> list = FunctionDao.listByMap(conditions);
        return list;
    }

    @Override
    public int delete(int id) throws BusinessException {

        List<Function> list =FunctionDao.selectChildren(id);
        if(list.size()>0) {
            throw new BusinessException(ErrorEnum.ERROR_PARAM, "该菜单下存在子菜单,不能删除");
        }

        return FunctionDao.deleteById(id);
    }

    @Override
    public TreeNode generate(List<Function> list) throws BusinessException {
        TreeNode rootNode = new TreeNode();
        List<TreeNode> nodeList =  new ArrayList<>();
        for(Function func:list) {
            TreeNode node  = new TreeNode();
            node.setId(func.getId());
            node.setPid(func.getPid());
            node.setTitle(func.getName());
            if("1".equals(func.getFlag())&&func.getType()==2)
                node.setChecked(true);
            if(func.getPid()==0) {
                rootNode=node;
            }
            nodeList.add(node);
        }
        generateTree(nodeList,rootNode);
        return  rootNode;
    }
    private TreeNode generateTree(List<TreeNode> nodeList,
                                  TreeNode parent) {
        for (TreeNode n : nodeList) {
            if (n.getPid() == parent.getId()) {
                parent.getChildren().add(n);
                generateTree(nodeList, n);
            }
        }
        return parent;
    }

}
