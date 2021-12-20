package servlets.user;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import DAO.CartDAO;
import DAO.CustomerDAO;
import DAO.DeliveryStatusDAO;
import DAO.OrderDAO;
import DAO.PaymentDAO;
import DAO.ShippingMethodDAO;
import Model.Account;
import Model.Cart;
import Model.Customer;
import Model.DeliveryStatus;
import Model.Order;
import Model.Payment;
import Model.ShippingMethod;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet(urlPatterns = "/cart")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("loginedUser");
		ArrayList<Cart> carts = new ArrayList<Cart>();
		if(obj != null) {
			Account account = (Account)obj;
			carts = CartDAO.getCountCartNotOrderByAccount(account.getId());
			Customer customer = CustomerDAO.getCustomerByAccount(account.getId());
			if(customer != null) {
				String fullname = customer.getFullname();
				String phone = customer.getPhone();
				String address = customer.getAddress();
				request.setAttribute("orderName", fullname);
				request.setAttribute("orderPhone", phone);
				request.setAttribute("orderAddress", address);
			}
		}
		request.setAttribute("carts", carts);

		ArrayList<ShippingMethod> shippingMethods = ShippingMethodDAO.getAllShippingMethods();
		request.setAttribute("shippingMethods", shippingMethods);

		ArrayList<Payment> payments = PaymentDAO.getAllPayments();
		request.setAttribute("payments", payments);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/cart.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "order":order(request,response);break;
		default:
			break;
		}
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	public void order(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		JSONObject jObj = new JSONObject(request.getParameter("checkbox")); 
		Iterator it = jObj.keys(); //gets all the keys
		ArrayList<Long> cart_ids = new ArrayList<Long>();
		while(it.hasNext())
		{
			String key = String.valueOf(it.next()); // get key
			Object o = jObj.get(key); // get value
			if(key.equals("fruitsGranted")) {
				String str = String.valueOf(o);
				str=str.replace("[", "");
				str=str.replace("]", "");
				str=str.replace("cart", "");
				str=str.replace("\"","");
				int index = str.indexOf(",");
				String strfirst = str.substring(0,index);
				if(strfirst.equals("rememberMe")) {
					str=str.substring(index+1, str.length());
					index = str.indexOf(",");
				}
				long cart_id;
				while(!str.equals("")) {
					cart_id = Long.parseLong(str.substring(0, index));
					cart_ids.add(cart_id);
					if(index==str.length()) {
						str="";
					}
					else {
						str=str.substring(index+1, str.length());
					}
					index = str.indexOf(",");
					if(index == -1) {
						index = str.length();
					}
				}
				break;
			}

		}
		if(cart_ids.size()>0) {
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("loginedUser");
			ArrayList<Cart> carts = new ArrayList<Cart>();
			if(obj != null) {
				Account account = (Account)obj;
				Order order = new Order();
				String name = request.getParameter("name");
				String phone = request.getParameter("phone");
				String address = request.getParameter("address");
				String note = request.getParameter("note");
				DeliveryStatus deliveryStatus = DeliveryStatusDAO.getDeliveryStatusByID(1);
				Payment payment = PaymentDAO.getPaymentByID(1);
				ShippingMethod shippingMethod = ShippingMethodDAO.getShippingMethodByID(1);
				order.setDeliveryFullname(name);
				order.setDeliveryPhone(phone);
				order.setDeliveryAddress(address);
				order.setNote(note);
				order.setAccount(account);
				order.setCreatedAt(new Timestamp(System.currentTimeMillis()));
				order.setDeliveryStatus(deliveryStatus);
				order.setPayment(payment);
				order.setShippingMethod(shippingMethod);
				
				OrderDAO.insertOrder(order);
				
				carts = CartDAO.getCountCartNotOrderByAccount(account.getId());
				if(carts!=null) {
					for(int i=0;i<carts.size();i++) {
						for(int j=0;j<cart_ids.size();j++) {
							Cart cart = carts.get(i);
							if(cart.getId() == cart_ids.get(i)) {
								cart.setOrder(order);
								CartDAO.updateCart(cart);
							}
						}
					}
				}
			}
		}
	}
}
