package servlets.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AuthorDAO;
import DAO.BookDAO;
import DAO.BookGrenreDAO;
import DAO.SupplierDAO;
import Model.Author;
import Model.Book;
import Model.BookGrenre;
import Model.Supplier;

/**
 * Servlet implementation class TableBook
 */
@WebServlet(urlPatterns = "/admin/quan-ly-sach")
public class TableBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableBook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		ArrayList<Sach> listBook = utils.DBUtils.getAllBook();
		
		ArrayList<Book> books = BookDAO.getAllBooks();
		ArrayList<BookGrenre> bookGrenres = BookGrenreDAO.getAllBookGrenres();
		ArrayList<Supplier> suppliers = SupplierDAO.getAllSuppliers();
		ArrayList<Author> authors = AuthorDAO.getAllAuthors();
		
		request.setAttribute("books", books);
		request.setAttribute("bookGrenres", bookGrenres);
		request.setAttribute("suppliers", suppliers);
		request.setAttribute("authors", authors);
		
		request.getRequestDispatcher("tableBook.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
