package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Image;
import utils.HibernateUtils;

public class ImageDAO {
	public static ArrayList<Image> getAllImages(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Image> images = new ArrayList<Image>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Image.class.getName();

			Query<Image> query = session.createQuery(sql);

			images = (ArrayList<Image>) query.getResultList();

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
		}

		return images;
	}
	public static void insertImage(Image image) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.save(image);

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
	public static void updateImage(Image image) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(image);

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

	public static void deleteImage(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Image image = null;
		try {
			transaction = session.beginTransaction();

			image = session.get(Image.class, id);

			session.delete(image);

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
	public static void deleteImage(Image image) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(image);

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



	public static Image getImageByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Image image = null;
		try {
			transaction = session.beginTransaction();

			image = session.get(Image.class, id);

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return image;
	}

	public static ArrayList<Image> getAllImageByBook(long book_id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Image> images = new ArrayList<Image>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Image.class.getName() + " where book.id=:book_id";

			Query<Image> query = session.createQuery(sql);

			query.setParameter("book_id", book_id);
			
			images = (ArrayList<Image>) query.getResultList();

			transaction.commit();

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
		}

		return images;
	}
	public static Image getImageByName(String name) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Image image = null;
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Image.class.getName() + " where name=:name";
			
			Query<Image> query = session.createQuery(sql);
			
			query.setParameter("name", name);
			
			
			image = query.getSingleResult();
			
			transaction.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return image;
	}

}
