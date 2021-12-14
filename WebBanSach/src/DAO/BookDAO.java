package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
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
			
			for (Book book : books) {
				System.out.println("Book: " + book.getId() + " : "+ book.getName());
			}
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
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
			session.close();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
	}
	public static void updateBook(Book book) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.saveOrUpdate(book);
			
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
	
	public static void deleteBook(Book book) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();
			
			session.delete(book);
			
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
			
			session.close();
			
		} catch (Exception e) 
		{
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
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
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return book;
	}
}
