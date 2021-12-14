package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Book;
import Model.BookCategory;
import utils.HibernateUtils;

public class BookCategoryDAO {
	public static ArrayList<BookCategory> getAllBookCategories(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<BookCategory> bookCategories = new ArrayList<BookCategory>();
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + BookCategory.class.getName();
			
			Query<BookCategory> query = session.createQuery(sql);
			
			bookCategories = (ArrayList<BookCategory>) query.getResultList();
			
			for (BookCategory bookCategory : bookCategories) {
				System.out.println("Book: " + bookCategory.getId() + " : "+ bookCategory.getName());
			}
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return bookCategories;
	}
	public static void insertBookCategory(BookCategory bookCategory) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.save(bookCategory);
			
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
	public static void updateBookCategory(BookCategory bookCategory) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(bookCategory);
			
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
	
	public static void deleteBookCategory(BookCategory bookCategory) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.delete(bookCategory);
			
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
	
	public static void deleteBookCategory(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		BookCategory bookCategory = null;
		try {
			transaction = session.beginTransaction();
			
			bookCategory = session.get(BookCategory.class, id);
			
			session.delete(bookCategory);
			
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
	
	public static BookCategory getBookCategoryByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		BookCategory bookCategory = null;
		try {
			transaction = session.beginTransaction();
			
			bookCategory = session.get(BookCategory.class, id);
			
			transaction.commit();
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return bookCategory;
	}
}
