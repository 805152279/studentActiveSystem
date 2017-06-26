package com.action;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;

public class gotoAction extends ActionSupport{
	private List<User> students=new ArrayList<User>();
	public String selectStudent(){
		User user=new User();
		user.setUserid("123");
		user.setUsername("a");
		user.setUserpassword("321");
		students.add(user);
		user=new User();
		user.setUserid("456");
		user.setUsername("b");
		user.setUserpassword("654");
		students.add(user);
		HttpSession session=ServletActionContext.getRequest().getSession();
		session.setAttribute("students", students);
		return SUCCESS;
	}
}
