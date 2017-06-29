package com.action;

import java.util.Iterator;
import java.util.List;

import hib.com.HibernateSessionFactory;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.Canjia;
import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;

public class CancelAction extends ActionSupport{
private String content;
	public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}

	public String cancel(){
		Session session = HibernateSessionFactory.getSession(); 
		Transaction tx = session.beginTransaction(); 
		String sid=(String) ServletActionContext.getRequest().getSession().getAttribute("sid");
		try{ 
		List catlist = null;
		    catlist =session.createQuery("from Canjia").list();
		         if (catlist != null) {
		        Iterator it= catlist.iterator();
		        while (it.hasNext()) {
		            Canjia user =(Canjia) it.next(); 
		            if(user.getUserid().equals(sid) && user.getActiveid().equals(content)) { 
		            
		             session.delete(user) ;
		                break;
		            }
		        }
		    }
		    tx.commit();
		    session.clear();
		}	catch (Exception e) {   
    		tx.rollback();  
    	    e.printStackTrace();  
    	}finally{  
    	    session.close();  
    	}  
		
		return SUCCESS;
	}
}
