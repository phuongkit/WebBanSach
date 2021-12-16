package servlets.admin;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

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

/**
 * Servlet implementation class add
 */
@WebServlet("/admin/add")
public class add extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Book book = new Book();
		Date nowDate = new Date();
		Timestamp timestamp = new Timestamp(nowDate.getTime());
		
		BookGrenre bookGrenre = BookGrenreDAO.getBookGrenreByID(Long.parseLong(request.getParameter("bookgrenre")));
		Author author = AuthorDAO.getAuthorByID(Long.parseLong(request.getParameter("author")));
		Model.Supplier supplier = SupplierDAO.getSupplierByID(Long.parseLong(request.getParameter("supplier")));
		
		
		book.setName(request.getParameter("name"));
		book.setDescription(request.getParameter("description"));
		book.setCreatedAt(timestamp);
		book.setPurchasePrice(new BigDecimal(request.getParameter("purchase_price")));
		book.setQuantityAvailable(new BigDecimal(request.getParameter("quantity")));
		book.setQuantitySold(new BigDecimal(0));
		book.setSalePrice(new BigDecimal(request.getParameter("sale_price")));
		
		//book.setAuthor(AuthorDAO.getAuthorByID(1));
		//book.setBookGrenre(BookGrenreDAO.getBookGrenreByID(1));
		//book.setSupplier(SupplierDAO.getSupplierByID(1));
		
		book.setAuthor(author);
		book.setBookGrenre(bookGrenre);
		book.setSupplier(supplier);
		BookDAO.insertBook(book);
		response.sendRedirect("quan-ly-sach");
	}

}
