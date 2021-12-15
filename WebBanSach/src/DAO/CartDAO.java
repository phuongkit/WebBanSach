package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Cart;
import utils.HibernateUtils;

public class CartDAO {
	public static ArrayList<Cart> getAllCarts(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Cart> carts = new ArrayList<Cart>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Cart.class.getName();

			Query<Cart> query = session.createQuery(sql);

			carts = (ArrayList<Cart>) query.getResultList();

			for (Cart cart : carts) {
				System.out.println("Cart: " + cart.getId() + " : "+ cart.getBook().getName());
			}

			transaction.commit();

			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		return carts;
	}
	public static void insertCart(Cart cart) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.save(cart);

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
	public static void updateCart(Cart cart) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(cart);

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

	public static void deleteCart(Cart cart) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(cart);

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

	public static void deleteCart(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Cart cart = null;
		try {
			transaction = session.beginTransaction();

			cart = session.get(Cart.class, id);

			session.delete(cart);

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

	public static Cart getCartByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Cart cart = null;
		try {
			transaction = session.beginTransaction();

			cart = session.get(Cart.class, id);

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return cart;
	}
	public static int getCountCartNotOrderByUsername(String username) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		int Count = 0;
		try {
			transaction = session.beginTransaction();

//			String sql = "from " + Cart.class.getName() " c inner join "
//
//			Query<Cart> query = session.createQuery(sql);
//
//			carts = (ArrayList<Cart>) query.getResultList();
//
//			cart = session.get(Cart.class, id);

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return Count;
	}
}
