package test;

import hib.com.HibernateSessionFactory;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.bean.User;

public class Test {
public static void main(String[] args) {
	Session session = HibernateSessionFactory.getSession();  
    Transaction tx = session.beginTransaction();  
    User stu = new User("2014", "∆§∆§∫¿", "1234",1,5,0);  
   
    try {  
   session.save(stu);   //insert≤Â»Î
    
    
        tx.commit();  
    } catch (Exception e) {  
        tx.rollback();  
        e.printStackTrace();  
    }finally{  
        session.close();  
    }  
}
}
