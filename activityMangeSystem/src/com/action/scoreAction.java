package com.action;

import hib.com.HibernateSessionFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;


import com.bean.Active;
import com.opensymphony.xwork2.ActionSupport;

public class scoreAction extends ActionSupport {
	private List<Active> actives=new ArrayList<Active>();
	public String selectActive(){
				
		Session session = HibernateSessionFactory.getSession();  
		Transaction tx = session.beginTransaction(); 
		try {
		    List catlist = null;
	    catlist =session.createQuery("from Active ORDER BY number DESC").list();
	         if (catlist != null) {
	        Iterator it= catlist.iterator();
	       
	        while (it.hasNext()) {
	            Active user =(Active) it.next(); 
	           // if(user.getUserlevel()==1)continue;
	            actives.add(user);
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
		
		
		
	HttpSession session1=ServletActionContext.getRequest().getSession();
	session1.setAttribute("students", actives);
	return SUCCESS;


		
	}
}
