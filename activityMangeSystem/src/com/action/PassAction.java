package com.action;



import hib.com.HibernateSessionFactory;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class PassAction extends ActionSupport {

private User user=new User();
private String newpass;
private String sid;
private String result;
public String getResult() {
	return result;
}


public void setResult(String result) {
	this.result = result;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


private String password;



public String getNewpass() {
	return newpass;
}


public void setNewpass(String newpass) {
	this.newpass = newpass;
}


public String change() throws IOException{
 //  String id=user.getUserid();
	//String password=user.getUserpassword();
	sid=(String) ServletActionContext.getRequest().getSession().getAttribute("sid");
	System.out.println(sid+"  "+password+"  "+newpass);
	Session session = HibernateSessionFactory.getSession();  
	Transaction tx = session.beginTransaction(); 



	boolean has = false;
	try {		 
		    List catlist = null;
	    catlist =session.createQuery("from User").list();
	         if (catlist != null) {
	        Iterator it= catlist.iterator();
	       
	        while (it.hasNext()) {
	            User user =(User) it.next(); 
	            if(user.getUserid().equals(sid) && user.getUserpassword().equals(password)) { 
	                has = true;
	                user.setUserpassword(newpass);
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
