package com.using.cms.bean.extra;

import com.using.cms.bean.Function;
import com.using.cms.bean.Role;

import java.util.List;

public class ExtRole extends Role {
	
	
	private List<Function> funcList;
	
	private TreeNode treeNode;

	public List<Function> getFuncList() {
		return funcList;
	}

	public void setFuncList(List<Function> funcList) {
		this.funcList = funcList;
	}

	public TreeNode getTreeNode() {
		return treeNode;
	}

	public void setTreeNode(TreeNode treeNode) {
		this.treeNode = treeNode;
	}

}
