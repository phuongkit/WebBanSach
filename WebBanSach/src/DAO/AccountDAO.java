package DAO;

import java.util.ArrayList;

import javax.persistence.NoResultException;

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

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
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

		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
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

		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
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

		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
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

		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
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

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return account;
	}

	public static Account getAccountByUsernamePassword(String username, String password) {
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

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return account;
	}

	public static Account getAccountByUsername(String username) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Account account = new Account();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Account.class.getName() + " where username=:username";

			Query<Account> query = session.createQuery(sql);

			query.setParameter("username", username);
			try {
				account = query.getSingleResult();
			}
			catch (NoResultException nre){
				account = null;
				//Ignore this because as per your logic this is ok!
			}

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return account;
	}
}
