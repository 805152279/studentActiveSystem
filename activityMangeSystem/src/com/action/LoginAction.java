package com.action;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LoginAction extends ActionSupport implements ModelDriven<User>{

private User user=new User();

public String login(){
System.out.println(user.getUserid());
System.out.println(user.getUserpassword());
	return "SUCCESS";
}



@Override
public User getModel() {
	// TODO Auto-generated method stub
	return user;
}


	
	
}
