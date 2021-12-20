package servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import DAO.BookDAO;
import DAO.CartDAO;
import DAO.ImageDAO;
import Model.Account;
import Model.Book;
import Model.Cart;
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
		ArrayList<Book> referencesBooks = BookDAO.getBookByGrenre(book.getBookGrenre().getId());
		request.setAttribute("referencesBooks", referencesBooks);
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		request.setAttribute("formatter", formatter);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/book.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		switch (action) {
		case "":addCart(request,response);break;
		default:
			break;
		}
	}

	private void addCart(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		long book_id = Long.parseLong(request.getParameter("book_id"));
		BigDecimal count = new BigDecimal(request.getParameter("count"));
		Book book = BookDAO.getBookByID(book_id);
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("loginedUser");
		Object[] result = new Object[2];
		response.setContentType("application/json;");
		response.setCharacterEncoding("UTF-8");
		if(obj == null) {
			System.out.println("\nCurrent account is null\n");
			result[0] = " Vui lòng đăng nhập vào tài khoản trước";
		}
		else {
			Cart cart = null;
			Account account = (Account)obj;
			cart = CartDAO.getCartByAccountAndBookNotOrder(account.getId(), book_id);
			if(cart != null) {
				BigDecimal quantity = book.getQuantityAvailable();
				if(quantity.compareTo(count) > -1) {
					quantity = quantity.subtract(count);
					cart.setQuantity(cart.getQuantity().add(count));
					CartDAO.updateCart(cart);
					result[0] = "Thêm vào giỏ hàng thành công!";
				}
				else {
					result[0] = "Số lượng sản phẩm hiện có không đủ! Vui lòng chọn số lượng khác!";
				}
			}
			else {
				cart = new Cart();
				cart.setAccount(account);
				cart.setBook(book);
				cart.setQuantity(count);
				cart.setCreatedAt(new Timestamp(System.currentTimeMillis()));
				cart.setOrder(null);
				CartDAO.insertCart(cart);
				result[0] = "Thêm vào giỏ hàng thành công!";
			}
		}
		result[1] = book.getQuantityAvailable();
		try {
			Gson gson= new Gson();
			PrintWriter writer = response.getWriter();
			writer.print(gson.toJson(result));
			writer.flush();
			writer.close();
//			doGet(request, response);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
