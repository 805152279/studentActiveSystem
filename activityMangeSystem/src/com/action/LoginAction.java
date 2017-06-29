package com.action;

import hib.com.HibernateSessionFactory;

import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String id;
	private String password;
	private String result;
	private String yanzheng;
	public String getLevel() {
		return level;
	}
	public String getYanzheng() {
		return yanzheng;
	}
	public void setYanzheng(String yanzheng) {
		this.yanzheng = yanzheng;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	private String level;
public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
private User user=new User();
public String check(){
	result="check";
	String kaptchaExpected=(String) ServletActionContext.getRequest().getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
	if(!kaptchaExpected.equals(yanzheng)){
		result="no";
	}
	return SUCCESS;
}
public String login(){
	Session session = HibernateSessionFactory.getSession(); 
	Transaction tx = session.beginTransaction(); 
	String kaptchaExpected=(String) ServletActionContext.getRequest().getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
	if(!kaptchaExpected.equals(yanzheng)){
		result="no";
	}
	boolean has = false;
	try {
		    List catlist = null;
	    catlist =session.createQuery("from User").list();
	         if (catlist != null) {
	        Iterator it= catlist.iterator();
	       
	        while (it.hasNext()) {
	            User user =(User) it.next(); 
	            if(user.getUserid().equals(id) && user.getUserpassword().equals(password)) { 
	                has = true;
	                level=String.valueOf(user.getUserlevel());
	                ServletActionContext.getRequest().getSession().setAttribute("sid", id);
	                break;
	            }
	            else 
	            has= false;

	        }
	    }
	    tx.commit();
	    session.clear();
	}
	catch (Exception e) {   
		tx.rollback();  
	    e.printStackTrace();  
	}finally{  
	    session.close();  
	}  
	if (has){
		  result="true";
	    return SUCCESS;
	}
	else{
		  result="false";
		return ERROR;
	    
	}
}

}
