package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Payment;
import utils.HibernateUtils;

public class PaymentDAO {
	public static ArrayList<Payment> getAllPayments(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Payment> payments = new ArrayList<Payment>();
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Payment.class.getName();
			
			Query<Payment> query = session.createQuery(sql);
			
			payments = (ArrayList<Payment>) query.getResultList();
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return payments;
	}
	public static void insertPayment(Payment payment) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.save(payment);
			
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
	public static void updatePayment(Payment payment) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(payment);
			
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
	
	public static void deletePayment(Payment payment) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.delete(payment);
			
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
	
	public static void deletePayment(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Payment payment = null;
		try {
			transaction = session.beginTransaction();
			
			payment = session.get(Payment.class, id);
			
			session.delete(payment);
			
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
	
	public static Payment getPaymentByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Payment payment = null;
		try {
			transaction = session.beginTransaction();
			
			payment = session.get(Payment.class, id);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return payment;
	}
}
