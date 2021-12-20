package DAO;

import java.math.BigDecimal;
import java.util.ArrayList;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import Model.Cart;
import Model.Customer;
import Model.Order;
import utils.HibernateUtils;

public class OrderDAO {
	public static ArrayList<Order> getAllOrders(){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Order> orders = new ArrayList<Order>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Order.class.getName();

			Query<Order> query = session.createQuery(sql);

			orders = (ArrayList<Order>) query.getResultList();

			transaction.commit();

			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		return orders;
	}
	public static void insertOrder(Order order) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.save(order);

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
	public static void updateOrder(Order order) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.saveOrUpdate(order);

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

	public static void deleteOrder(Order order) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		try {
			transaction = session.beginTransaction();

			session.delete(order);

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

	public static void deleteOrder(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Order order = null;
		try {
			transaction = session.beginTransaction();

			order = session.get(Order.class, id);

			session.delete(order);

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

	public static Order getOrderByID(long id) {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = null;
		Order order = null;
		try {
			transaction = session.beginTransaction();

			order = session.get(Order.class, id);

			transaction.commit();

			session.close();

		} catch (Exception e) {
			e.printStackTrace();
			if(transaction != null) {
				transaction.rollback();
			}
		}
		return order;
	}
	public static ArrayList<Order> getAllOrderByAccount(long account_id){
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction transaction = null;
		ArrayList<Order> orders = new ArrayList<Order>();
		try {
			transaction = session.beginTransaction();

			String sql = "from " + Order.class.getName() + " where account_id=:account_id";

			Query<Order> query = session.createQuery(sql);

			query.setParameter("account_id", account_id);

			orders = (ArrayList<Order>) query.getResultList();

			transaction.commit();

			session.close();
		} catch (Exception e) 
		{
			e.printStackTrace();
		}

		return orders;
	}

	public static BigDecimal getTotalMoneyByOrder(long order_id) {
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

		BigDecimal total = new BigDecimal(0);
		for(int i=0;i<carts.size();i++) {
			total = total.add(carts.get(i).getQuantity().multiply(carts.get(i).getBook().getSalePrice()));
		}
		return total;
	}
	
	public static void main(String[] args) {
	
	}
}
