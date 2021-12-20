package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.query.Query;

import Model.Book;
import utils.HibernateUtils;

public class BookDAO {
	public static ArrayList<Book> getAllBooks(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Book> books = new ArrayList<Book>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Book.class.getName();

			Query<Book> query = session.createQuery(sql);

			books = (ArrayList<Book>) query.getResultList();

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
		}

		return books;
	}
	public static void insertBook(Book book) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.save(book);

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
	public static void updateBook(Book book) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(book);

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

	public static void deleteBook(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Book book = null;
		try {
			transaction = session.beginTransaction();

			book = session.get(Book.class, id);

			session.delete(book);

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
	public static void deleteBook(Book book) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(book);

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



	public static Book getBookByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Book book = null;
		try {
			transaction = session.beginTransaction();

			book = session.get(Book.class, id);

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return book;
	}

	public static ArrayList<Book> getAllBookOrderByNgayTao(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Book> books = new ArrayList<Book>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Book.class.getName() + " order by createdAt desc";

			Query<Book> query = session.createQuery(sql);

			books = (ArrayList<Book>) query.getResultList();

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
		}

		return books;
	}

	public static ArrayList<Book> getAllBookOrderByQuantitySold(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Book> books = new ArrayList<Book>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Book.class.getName() + " order by quantitySold desc";

			Query<Book> query = session.createQuery(sql);

			books = (ArrayList<Book>) query.getResultList();

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
		}

		return books;
	}

	public static ArrayList<Book> getAllBookOrderBySales(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Book> books = new ArrayList<Book>();
		try {
			transaction = session.beginTransaction();

			String sql = "select new " + Book.class.getName() + "(b)"
					+ " from " + Book.class.getName() + " b join b.discounts d"
					+ " where DATEDIFF(DAY, d.createdAt, GETDATE()) >= 0"
					+ "	and DATEDIFF(DAY, GETDATE(), d.expiredAt) > 0"
					+ " group by b"
					+ " order by max(d.percentSale) desc";

			Query<Book> query = session.createQuery(sql);

			books = (ArrayList<Book>) query.getResultList();

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
		}

		return books;
	}

	public static double getSalesByBookNotExpired(long book_id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		double sales = -1;
		try {
			transaction = session.beginTransaction();

			String sql = "select max(d.percentSale) from " + Book.class.getName() + " b join b.discounts d"
					+ " where b.id=:book_id"
					+ " and DATEDIFF(DAY, d.createdAt, GETDATE()) >= 0"
					+ " and DATEDIFF(DAY, GETDATE(), d.expiredAt) > 0";

			Query query = session.createQuery(sql);

			query.setParameter("book_id", book_id);

			Object obj = query.getResultList().get(0);

			if(obj == null) {
				sales = -1;
			}
			else {
				sales = (double) obj;
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
		return sales;
	}
	public static ArrayList<Book> searchBookByName(String name) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		ArrayList<Book> book = null;
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Book.class.getName() + " where name like :name";
			Query<Book> query = session.createQuery(sql);
			query.setParameter("name", MatchMode.ANYWHERE.toMatchString(name));
			
			book = (ArrayList<Book>) query.getResultList();
			
			transaction.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return book;
	}
	public static ArrayList<Book> getBookByGrenre(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		ArrayList<Book> book = null;
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Book.class.getName() + " where bookgrenre_id =:id";
			Query<Book> query = session.createQuery(sql);
			query.setParameter("id", id);
			
			book = (ArrayList<Book>) query.getResultList();
			
			transaction.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return book;
	}
}
