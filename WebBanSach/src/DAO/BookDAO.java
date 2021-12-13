package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import Model.Book;
import utils.HibernateUtils;

public class BookDAO {
	public static ArrayList<Book> getAll(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		try {
			session.getTransaction().begin();
			String sql = "Select e from " + Book.class.getName() + " e";
			Query<Book> query = session.createQuery(sql);
			ArrayList<Book> books = (ArrayList<Book>) query.getResultList();
			for (Book book : books) {
				System.out.println("Book: " + book.getId() + " : "+ book.getName());
			}
			session.getTransaction().commit();
			return books;
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		return null;
	}
}
