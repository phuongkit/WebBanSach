package servlets.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

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
 * Servlet implementation class ImageControl
 */
@WebServlet("/admin/ImageControl")
public class ImageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		switch (action) {
		case "delete": delete(request,response);break;
		case "show": show(request,response);break;
			
			

		default:
			break;
		}
	}

	private void show(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Long id = Long.parseLong(request.getParameter("sid"));
		Image image = ImageDAO.getImageByID(id);
		Object[] object = new Object[10];
		
		object[0] = image.getId();
		object[1] = image.getName();
		object[2] = image.getBook().getId();
		
		Gson gson = new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(object));
		writer.flush();
		writer.close();
		
		
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("sid"));
		Image image = ImageDAO.getImageByID(id);
		
		ImageDAO.deleteImage(image);
		response.sendRedirect("quan-ly-hinh-anh");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		switch (action) {
		case "add":add(request,response);break;
		case "edit":edit(request,response);break;	
			

		default:
			break;
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("sid"));
		Image image = ImageDAO.getImageByID(id);
		Book book = BookDAO.getBookByID(Long.parseLong(request.getParameter("book_id")));
		
		image.setBook(book);
		image.setName(request.getParameter("imageFile"));
		
		ImageDAO.updateImage(image);
		response.sendRedirect("quan-ly-hinh-anh");
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Image image = new Image(); 
		Book book = BookDAO.getBookByID(Long.parseLong(request.getParameter("book_id")));
		Date date = new Date();
		Timestamp timestamp= new Timestamp(date.getTime());
		
		image.setName(request.getParameter("imageFile"));
		System.out.print(request.getParameter("imageFile"));
		image.setCreatedAt(timestamp);
		image.setBook(book);
		ImageDAO.insertImage(image);
		response.sendRedirect("quan-ly-hinh-anh");
	}

}
