package com.using.cms.bean.extra;

import java.util.ArrayList;
import java.util.List;

public class TreeNode {

	  private Integer         id;
	  private Integer         pid;
	  private String          title;
	  private boolean         expand = true;
	  private List<TreeNode> children = new ArrayList<TreeNode>(); ;
	  private boolean         checked  = false;
	  private String 		  type;//数据类型 组织机构人员使用 1-组织机构 2-人员
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public boolean isExpand() {
		return expand;
	}
	public void setExpand(boolean expand) {
		this.expand = expand;
	}
	public List<TreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	  
	  
}
