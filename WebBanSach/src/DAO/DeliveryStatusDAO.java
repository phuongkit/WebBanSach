package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.DeliveryStatus;
import utils.HibernateUtils;

public class DeliveryStatusDAO {
	public static ArrayList<DeliveryStatus> getAllDeliveryStatuss(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<DeliveryStatus> deliveryStatuss = new ArrayList<DeliveryStatus>();
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + DeliveryStatus.class.getName();
			
			Query<DeliveryStatus> query = session.createQuery(sql);
			
			deliveryStatuss = (ArrayList<DeliveryStatus>) query.getResultList();
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return deliveryStatuss;
	}
	public static void insertDeliveryStatus(DeliveryStatus deliveryStatus) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.save(deliveryStatus);
			
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
	public static void updateDeliveryStatus(DeliveryStatus deliveryStatus) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(deliveryStatus);
			
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
	
	public static void deleteDeliveryStatus(DeliveryStatus deliveryStatus) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.delete(deliveryStatus);
			
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
	
	public static void deleteDeliveryStatus(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		DeliveryStatus deliveryStatus = null;
		try {
			transaction = session.beginTransaction();
			
			deliveryStatus = session.get(DeliveryStatus.class, id);
			
			session.delete(deliveryStatus);
			
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
	
	public static DeliveryStatus getDeliveryStatusByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		DeliveryStatus deliveryStatus = null;
		try {
			transaction = session.beginTransaction();
			
			deliveryStatus = session.get(DeliveryStatus.class, id);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return deliveryStatus;
	}
}
