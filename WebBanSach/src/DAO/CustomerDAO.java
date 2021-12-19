package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Customer;
import utils.HibernateUtils;

public class CustomerDAO {
	public static ArrayList<Customer> getAllCustomers(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Customer> customers = new ArrayList<Customer>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Customer.class.getName();

			Query<Customer> query = session.createQuery(sql);

			customers = (ArrayList<Customer>) query.getResultList();

			transaction.commit();

			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		return customers;
	}
	public static void insertCustomer(Customer customer) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.save(customer);

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
	public static void updateCustomer(Customer customer) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(customer);

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

	public static void deleteCustomer(Customer customer) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(customer);

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

	public static void deleteCustomer(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Customer customer = null;
		try {
			transaction = session.beginTransaction();

			customer = session.get(Customer.class, id);

			session.delete(customer);

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

	public static Customer getCustomerByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Customer customer = null;
		try {
			transaction = session.beginTransaction();

			customer = session.get(Customer.class, id);

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return customer;
	}

	public static Customer getCustomerByAccount(long account_id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Customer customer = null;
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Customer.class.getName() + " where account_id=:account_id";

			Query<Customer> query = session.createQuery(sql);

			query.setParameter("account_id", account_id);
			
			customer = query.getSingleResult();


			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return customer;
	}
}
