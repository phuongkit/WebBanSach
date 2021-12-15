package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Account;
import utils.HibernateUtils;

public class AccountDAO {
	public static ArrayList<Account> getAllAccounts(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Account> accounts = new ArrayList<Account>();
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Account.class.getName();
			
			Query<Account> query = session.createQuery(sql);
			
			accounts = (ArrayList<Account>) query.getResultList();
			
			for (Account account : accounts) {
				System.out.println("Book: " + account.getId() + " : "+ account.getUsername());
			}
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return accounts;
	}
	public static void insertAccount(Account account) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.save(account);
			
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
	public static void updateAccount(Account account) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(account);
			
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
	
	public static void deleteAccount(Account account) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.delete(account);
			
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
	
	public static void deleteAccount(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Account account = null;
		try {
			transaction = session.beginTransaction();
			
			account = session.get(Account.class, id);
			
			session.delete(account);
			
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
	
	public static Account getAccountByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Account account = null;
		try {
			transaction = session.beginTransaction();
			
			account = session.get(Account.class, id);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return account;
	}
	
	public static Account getAccountByUsername(String username, String password) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Account account = null;
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Account.class.getName() + " where username=:username and password=:password";
			
			Query<Account> query = session.createQuery(sql);
			
			query.setParameter("username", username);
			query.setParameter("password", password);
			
			account = query.getSingleResult();
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return account;
	}
}
