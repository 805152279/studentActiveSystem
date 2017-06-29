package com.action;

import hib.com.HibernateSessionFactory;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Canjia;
import com.opensymphony.xwork2.ActionSupport;

public class orderAction extends ActionSupport {
private String content;
private String sid;
private String act;
public String getAct() {
	return act;
}
public void setAct(String act) {
	this.act = act;
}
public String getContent() {
return content;
}
public void setContent(String content) {
this.content = content;
}
	public String order(){
		sid=(String) ServletActionContext.getRequest().getSession().getAttribute("sid");
	//System.out.println(content);
		Session session = HibernateSessionFactory.getSession();  
		Transaction tx = session.beginTransaction(); 
		Canjia join=new Canjia();
	
	
		
		join.setUserid(sid);
		join.setActiveid(content);		
		join.setTime(new java.util.Date());
		join.setAvtivename(act);
		try {
		session.save(join);
	    tx.commit();
	    session.clear();
	}
	catch (Exception e) {   
		tx.rollback();  
	    e.printStackTrace();  
	}finally{  
	    session.close();  
	}  
		
		
		
		return SUCCESS;
	}
	

}
