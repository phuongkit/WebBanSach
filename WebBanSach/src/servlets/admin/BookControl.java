package servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import DAO.AuthorDAO;
import DAO.BookDAO;
import DAO.BookGrenreDAO;
import DAO.ImageDAO;
import DAO.SupplierDAO;
import Model.Author;
import Model.Book;
import Model.BookGrenre;
import Model.Image;
import Model.Supplier;

/**
 * Servlet implementation class BookControl
 */
@WebServlet("/admin/BookControl")
public class BookControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		switch (action) {
		case "delete":delete(request,response);break;
		case "show":show(request,response);break;
		default:
			break;
		}
	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		long id = Long.parseLong(request.getParameter("sid"));
		Book book = BookDAO.getBookByID(id);
		
		Object[] object = new Object[11];
		object[0]=book.getId();
		object[1]=book.getName();
		object[2]=book.getDescription();
		object[3]=book.getBookGrenre().getId();
		object[4]=book.getAuthor().getId();
		object[5]=book.getSupplier().getId();
		object[6]=book.getQuantityAvailable();
		object[7]=book.getQuantitySold();
		object[8]=book.getSalePrice();
		object[9]=book.getPurchasePrice();
		object[10]=book.getImage().getName();
		Gson gson= new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(object));
		writer.flush();
		writer.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		switch (action) {
		case "add":add(request,response);break;
		case "edit":edit(request,response);break;
		//case "show":show(request,response);break;
		default:
			break;
		}
		
	}
	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("sid"));
		Book book = BookDAO.getBookByID(id);
		Date nowDate = new Date();
		Timestamp timestamp = new Timestamp(nowDate.getTime());
		String imageName = request.getParameter("imageFile");
		if(imageName.equals("")) {
			imageName="default.jpg";
		}
		
		BookGrenre bookGrenre = BookGrenreDAO.getBookGrenreByID(Long.parseLong(request.getParameter("bookgrenre")));
		Author author = AuthorDAO.getAuthorByID(Long.parseLong(request.getParameter("author")));
		Model.Supplier supplier = SupplierDAO.getSupplierByID(Long.parseLong(request.getParameter("supplier")));
		Image image = ImageDAO.getImageByName(imageName);
		
		book.setName(request.getParameter("name"));
		book.setDescription(request.getParameter("description"));
		book.setCreatedAt(timestamp);
		book.setPurchasePrice(new BigDecimal(request.getParameter("purchase_price")));
		book.setQuantityAvailable(new BigDecimal(request.getParameter("quantityAvailable")));
		book.setQuantitySold(new BigDecimal(request.getParameter("quantitySold")));
		book.setSalePrice(new BigDecimal(request.getParameter("sale_price")));
		
		//book.setAuthor(AuthorDAO.getAuthorByID(1));
		//book.setBookGrenre(BookGrenreDAO.getBookGrenreByID(1));
		//book.setSupplier(SupplierDAO.getSupplierByID(1));
		//book.setImage(ImageDAO.getImageByName("default.jpg"));
		
		book.setImage(image);
		book.setAuthor(author);
		book.setBookGrenre(bookGrenre);
		book.setSupplier(supplier);
		BookDAO.updateBook(book);
		response.sendRedirect("quan-ly-sach");
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Book book = new Book();
		Date nowDate = new Date();
		Timestamp timestamp = new Timestamp(nowDate.getTime());
		String imageName = request.getParameter("imageFile");
		if(imageName.equals("")) {
			imageName="default.jpg";
		}
		
		BookGrenre bookGrenre = BookGrenreDAO.getBookGrenreByID(Long.parseLong(request.getParameter("bookgrenre")));
		Author author = AuthorDAO.getAuthorByID(Long.parseLong(request.getParameter("author")));
		Model.Supplier supplier = SupplierDAO.getSupplierByID(Long.parseLong(request.getParameter("supplier")));
		Image image = ImageDAO.getImageByName(imageName);
		
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
		//book.setImage(ImageDAO.getImageByName("default.jpg"));
			
		book.setImage(image);
		book.setAuthor(author);
		book.setBookGrenre(bookGrenre);
		book.setSupplier(supplier);
		BookDAO.insertBook(book);
		response.sendRedirect("quan-ly-sach");
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("sid"));
		
		BookDAO bookDAO = new BookDAO();
		bookDAO.deleteBook(id);
		response.sendRedirect("quan-ly-sach");
	}
}
