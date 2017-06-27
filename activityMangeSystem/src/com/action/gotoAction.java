package com.action;


import hib.com.HibernateSessionFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.User;
import com.opensymphony.xwork2.ActionSupport;

public class gotoAction extends ActionSupport{
	private List<User> students=new ArrayList<User>();
	public String selectStudent(){
				
		Session session = HibernateSessionFactory.getSession();  
		Transaction tx = session.beginTransaction(); 
		try {
		    List catlist = null;
	    catlist =session.createQuery("from User").list();
	         if (catlist != null) {
	        Iterator it= catlist.iterator();
	       
	        while (it.hasNext()) {
	            User user =(User) it.next(); 
	            if(user.getUserlevel()==1)continue;
	    		students.add(user);
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
	session1.setAttribute("students", students);
	return SUCCESS;


		
	}
}
