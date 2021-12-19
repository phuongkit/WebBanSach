package servlets.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CartDAO;
import DAO.CustomerDAO;
import DAO.PaymentDAO;
import DAO.ShippingMethodDAO;
import Model.Account;
import Model.Cart;
import Model.Customer;
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
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}