package servlets.user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.BookDAO;
import Model.Book;

@WebServlet(urlPatterns = "/bookgrenre")
public class bookgrenreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public bookgrenreServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.valueOf(request.getParameter("bookgrenre_id"));
		ArrayList<Book> bookGrenres = new ArrayList<Book>();
		String bookgrenrename = "";
		if(id==-1) {
			bookGrenres = BookDAO.getAllBookOrderByNgayTao();
			bookgrenrename="Sách mới tuyển chọn";
		}
		else if(id==-2) {
			bookGrenres = BookDAO.getAllBookOrderByQuantitySold();
			bookgrenrename="Sách bán chạy";
		}
		else if(id==-3) {
			bookGrenres = BookDAO.getAllBookOrderBySales();
			bookgrenrename="Combo sách hot - sách giảm giá";
		}
		System.out.println(bookGrenres.size());
		request.setAttribute("bookgrenres", bookGrenres);
		request.setAttribute("bookgrenrename", bookgrenrename);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/bookgrenre.jsp");
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
