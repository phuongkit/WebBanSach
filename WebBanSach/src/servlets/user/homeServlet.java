package servlets.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;
import Model.Book;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet(urlPatterns = "")
public class homeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public homeServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//		request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		ArrayList<Book> newBooks = BookDAO.getAllBookOrderByNgayTao();
		request.setAttribute("newBooks", newBooks);
		ArrayList<Book> bestSellingBooks = BookDAO.getAllBookOrderByQuantitySold();
		request.setAttribute("bestSellingBooks", bestSellingBooks);
		ArrayList<Book> bestDiscountBooks = BookDAO.getAllBookOrderBySales();
		request.setAttribute("bestDiscountBooks", bestDiscountBooks);
//		HttpSession session = request.getSession();
//		MyUtils.deleteLoginedUser(session);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/index.jsp");
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
