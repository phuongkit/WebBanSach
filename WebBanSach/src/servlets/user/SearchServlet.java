package servlets.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import DAO.BookDAO;
import DAO.ImageDAO;
import Model.Book;
import Model.Image;


/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		
		switch (action) {
//	    case "show":show(request,response);break;
//		case "search":search(request,response);break;
		case "searchcatagories":searchCatagories(request,response);break;
		default:
			break;
		
		}
	}

	
	
	
	private void searchCatagories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("id"));
		System.out.println(id);
		ArrayList<Book> books = BookDAO.getBookByGrenre(id);
		request.setAttribute("book", books);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/SearchBook.jsp");
		dispatcher.forward(request, response);
	}

	private void searchByName(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	private void search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String search=request.getParameter("term");
		ArrayList<Object> bookJQueries = new ArrayList<Object>();
		ArrayList<Book> allBook = BookDAO.getAllBooks(); 
		
		for (Book book : allBook) {
			BookJQuery bookJQuery = new BookJQuery();
			String name = book.getName().toUpperCase();
			if(name.startsWith(search.toUpperCase())) {
				bookJQuery.setId(book.getId());
				bookJQuery.setName(book.getName());
				bookJQueries.add(bookJQuery);
			}	
		}		
		Gson gson= new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(bookJQueries));
		writer.flush();
		writer.close();
	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		
		String search=request.getParameter("term");
		ArrayList<Object> bookJQueries = new ArrayList<Object>();
		ArrayList<Book> allBook = BookDAO.getAllBooks(); 
		
		for (Book book : allBook) {
			BookJQuery bookJQuery = new BookJQuery();
			String name = book.getName().toUpperCase();
			if(name.startsWith(search.toUpperCase())) {
				bookJQuery.setName(book.getName());
				bookJQueries.add(bookJQuery.getName());
			}
			
			
		}
		
		Gson gson= new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(bookJQueries));
		writer.flush();
		writer.close();
			
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("search_box");
		ArrayList<Book> book = BookDAO.searchBookByName(id);
		request.setAttribute("book", book);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/SearchBook.jsp");
		dispatcher.forward(request, response);
	}
	
	public class BookJQuery{
		private String name;
		private long id;
		
		public long getId() {
			return id;
		}
		public void setId(long id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	}
}
