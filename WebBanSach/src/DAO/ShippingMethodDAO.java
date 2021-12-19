package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.ShippingMethod;
import utils.HibernateUtils;

public class ShippingMethodDAO {
	public static ArrayList<ShippingMethod> getAllShippingMethods(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<ShippingMethod> ShippingMethods = new ArrayList<ShippingMethod>();
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + ShippingMethod.class.getName();
			
			Query<ShippingMethod> query = session.createQuery(sql);
			
			ShippingMethods = (ArrayList<ShippingMethod>) query.getResultList();
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return ShippingMethods;
	}
	public static void insertShippingMethod(ShippingMethod shippingMethod) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.save(shippingMethod);
			
			transaction.commit();
			session.close();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
	}
	public static void updateShippingMethod(ShippingMethod shippingMethod) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(shippingMethod);
			
//			int result = query.executeUpdate();
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
	}
	
	public static void deleteShippingMethod(ShippingMethod shippingMethod) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.delete(shippingMethod);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
	}
	
	public static void deleteShippingMethod(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		ShippingMethod shippingMethod = null;
		try {
			transaction = session.beginTransaction();
			
			shippingMethod = session.get(ShippingMethod.class, id);
			
			session.delete(shippingMethod);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
	}
	
	public static ShippingMethod getShippingMethodByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		ShippingMethod shippingMethod = null;
		try {
			transaction = session.beginTransaction();
			
			shippingMethod = session.get(ShippingMethod.class, id);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return shippingMethod;
	}
}
