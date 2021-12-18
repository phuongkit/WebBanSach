package servlets.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import Model.Account;

/**
 * Servlet implementation class TableBook
 */
@WebServlet(urlPatterns = "/admin/quan-ly-tai-khoan")
public class TableAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		ArrayList<Sach> listBook = utils.DBUtils.getAllBook();
		
//		ArrayList<Book> books = BookDAO.getAllBooks();
//		ArrayList<BookGrenre> bookGrenres = BookGrenreDAO.getAllBookGrenres();
//		ArrayList<Supplier> suppliers = SupplierDAO.getAllSuppliers();
//		ArrayList<Author> authors = AuthorDAO.getAllAuthors();
		ArrayList<Account> accounts = AccountDAO.getAllAccounts();
		
		
		request.setAttribute("accounts", accounts);
//		request.setAttribute("bookGrenres", bookGrenres);
//		request.setAttribute("suppliers", suppliers);
//		request.setAttribute("authors", authors);
		request.getRequestDispatcher("tableAccount.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
