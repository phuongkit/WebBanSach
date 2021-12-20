package DAO;

import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Cart;
import Model.Order;
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

		} catch (Exception e) 
		{
			e.printStackTrace();
		} finally {
			session.close();
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
	public static void updateCart(Cart cart) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(cart);

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

	public static void deleteCart(Cart cart) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(cart);

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

	public static Cart getCartByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Cart cart = null;
		try {
			transaction = session.beginTransaction();

			cart = session.get(Cart.class, id);

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return cart;
	}
	
	public static Cart getCartByAccountAndBook(long account_id, long book_id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Cart cart = null;
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Cart.class.getName() + " where account_id=:account_id and book_id=:book_id";

			Query<Cart> query = session.createQuery(sql);

			query.setParameter("account_id", account_id);
			query.setParameter("book_id", book_id);
			
			cart = query.getSingleResult();
			
			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return cart;
	}
	
	public static Cart getCartByAccountAndBookNotOrder(long account_id, long book_id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Cart cart = null;
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Cart.class.getName() + " where account_id=:account_id and book_id=:book_id  and order_id = NULL";

			Query<Cart> query = session.createQuery(sql);

			query.setParameter("account_id", account_id);
			query.setParameter("book_id", book_id);
			
			cart = query.getSingleResult();
			
			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return cart;
	}
	
	public static ArrayList<Cart> getCountCartNotOrderByAccount(long account_id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		ArrayList<Cart> carts = new ArrayList<Cart>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Cart.class.getName() + " where account_id=:account_id and order_id = NULL";

			Query<Cart> query = session.createQuery(sql);

			query.setParameter("account_id", account_id);
			
			carts = (ArrayList<Cart>) query.getResultList();

			transaction.commit();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		} finally {
			session.close();
		}
		return carts;
	}
	
	public static ArrayList<Cart> getCartByOrder(long order_id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Cart> carts = new ArrayList<Cart>();
		try {
			transaction = session.beginTransaction();
			
			String sql = "from " + Cart.class.getName() + " where order_id=:order_id";
			
			Query<Cart> query = session.createQuery(sql);
			
			query.setParameter("order_id", order_id);
			
			carts = (ArrayList<Cart>) query.getResultList();
			
			transaction.commit();
			
			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}
		
		return carts;
	}
}
