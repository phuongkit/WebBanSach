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

import DAO.CustomerDAO;
import DAO.OrderDAO;
import Model.Account;
import Model.Cart;
import Model.Customer;
import Model.Order;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet(urlPatterns = "/account")
public class accountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public accountServlet() {
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
			Account account = (Account)obj;Customer customer = CustomerDAO.getCustomerByAccount(account.getId());
			if(customer != null) {
				ArrayList<Order> orders = OrderDAO.getAllOrderByAccount(account.getId());
				
				request.setAttribute("fullname", customer.getFullname());
				request.setAttribute("phone", customer.getPhone());
				request.setAttribute("email",  customer.getEmail());
				request.setAttribute("address", customer.getAddress());
				request.setAttribute("username", account.getUsername());
				request.setAttribute("orders", orders);
			}
		}

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/account.jsp");
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
