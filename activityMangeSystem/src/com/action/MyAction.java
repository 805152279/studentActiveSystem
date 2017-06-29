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
import com.bean.Canjia;
import com.opensymphony.xwork2.ActionSupport;

public class MyAction extends ActionSupport{

	private List<Canjia> actives=new ArrayList<Canjia>();
	public String see(){
		Session session = HibernateSessionFactory.getSession();  
		Transaction tx = session.beginTransaction(); 
		String sid=(String) ServletActionContext.getRequest().getSession().getAttribute("sid");
		try {
		    List catlist = null;
	        catlist =session.createQuery("from Canjia").list();
	         if (catlist != null) {
	        Iterator it= catlist.iterator();
	       
	        while (it.hasNext()) {
	            Canjia user =(Canjia) it.next(); 
	            if(user.getUserid().equals(sid)){
	            	actives.add(user);
	            }            	
	            
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
