package servlets.user;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import DAO.CustomerDAO;
import Model.Account;
import Model.Customer;

/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/register")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public registerServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname	= request.getParameter("regFullName");
		String phone = request.getParameter("regPhone");
		String email = request.getParameter("regEmail");
		String address	= request.getParameter("regAddress");	
		String username	= request.getParameter("regUsername");
		String password	= request.getParameter("regPassword");
		
		String message = "";

		Account account = AccountDAO.getAccountByUsername(username);

		if(account != null) {
			message="Đã tồn tại tài khoản với username này! Vui lòng đặt tên khác!";
		}
		else {
			account = new Account();
			account.setCreatedAt(new Timestamp(System.currentTimeMillis()));
			account.setPassword(password);
			account.setPermission(false);
			account.setUsername(username);
			AccountDAO.insertAccount(account);
			Customer customer = new Customer();
			customer.setAccount(account);
			customer.setFullname(fullname);
			customer.setPhone(phone);
			customer.setEmail(email);
			customer.setAddress(address);
			CustomerDAO.insertCustomer(customer);
			message="Đã tạo tài khoản thành công! Bây giờ bạn có thể đăng nhập vào hệ thống!";
		}
		System.out.println(message);
		response.sendRedirect(request.getContextPath());

	}

}
