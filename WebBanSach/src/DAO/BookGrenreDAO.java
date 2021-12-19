package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.BookGrenre;
import utils.HibernateUtils;

public class BookGrenreDAO {
	public static ArrayList<BookGrenre> getAllBookGrenres(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<BookGrenre> bookGrenres = new ArrayList<BookGrenre>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + BookGrenre.class.getName();

			Query<BookGrenre> query = session.createQuery(sql);

			bookGrenres = (ArrayList<BookGrenre>) query.getResultList();

			transaction.commit();

			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return bookGrenres;
	}
	public static void insertBookGrenre(BookGrenre bookGrenre) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.save(bookGrenre);

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
	public static void updateBookGrenre(BookGrenre bookGrenre) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(bookGrenre);

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

	public static void deleteBookGrenre(BookGrenre bookGrenre) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(bookGrenre);

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

	public static void deleteBookGrenre(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		BookGrenre bookGrenre = null;
		try {
			transaction = session.beginTransaction();

			bookGrenre = session.get(BookGrenre.class, id);

			session.delete(bookGrenre);

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

	public static BookGrenre getBookGrenreByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		BookGrenre bookGrenre = null;
		try {
			transaction = session.beginTransaction();

			bookGrenre = session.get(BookGrenre.class, id);

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return bookGrenre;
	}
	public static ArrayList<BookGrenre> getAllBookGrenreByBookCategoryID(long bookCategory_id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		ArrayList<BookGrenre> bookGrenres = new ArrayList<BookGrenre>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + BookGrenre.class.getName() + " where bookCategory_id=:bookCategory_id";

			Query<BookGrenre> query = session.createQuery(sql);
			
			query.setParameter("bookCategory_id", bookCategory_id);

			bookGrenres = (ArrayList<BookGrenre>) query.getResultList();

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return bookGrenres;
	}
}
