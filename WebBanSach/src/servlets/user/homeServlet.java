package servlets.user;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import DAO.AccountDAO;
import Model.Account;
import utils.HibernateUtils;
import utils.MyUtils;

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
		//		ArrayList<BookCategory> bookCategories = BookCategoryDAO.getAllBookCategories();
		//
		//		request.setAttribute("bookCategories", bookCategories);
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
