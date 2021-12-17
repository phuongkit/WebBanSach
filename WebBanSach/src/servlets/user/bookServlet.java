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
import DAO.ImageDAO;
import Model.Book;
import Model.Image;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet(urlPatterns = "/book")
public class bookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long id = Long.valueOf(request.getParameter("book_id"));
		Book book = BookDAO.getBookByID(id);
		request.setAttribute("book", book);
		ArrayList<Image> bookImages = ImageDAO.getAllImageByBook(id);
		request.setAttribute("bookImages", bookImages);
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		request.setAttribute("formatter", formatter);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/book.jsp");
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
