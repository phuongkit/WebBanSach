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

import DAO.AccountDAO;
import DAO.BookDAO;
import Model.Account;
import Model.Book;

/**
 * Servlet implementation class AccountControl
 */
@WebServlet("/admin/AccountControl")
public class AccountControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountControl() {
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

	private void show(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		long id = Long.parseLong(request.getParameter("sid"));
		Account account = AccountDAO.getAccountByID(id);
		
		Object[] object = new Object[11];
		object[0]=account.getId();
		object[1]=account.getUsername();
		object[2]=account.getPassword();
		object[3]=account.getCreatedAt();
		object[4]=account.getPermission();
		Gson gson= new Gson();
		PrintWriter writer = response.getWriter();
		writer.print(gson.toJson(object));
		writer.flush();
		writer.close();
		
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("sid"));
		
		AccountDAO accountDAO = new AccountDAO();
		accountDAO.deleteAccount(id);
		response.sendRedirect("quan-ly-tai-khoan");
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

		default:
			break;
		}
	}

	private void edit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("sid"));
		Account account = AccountDAO.getAccountByID(id);
		Date nowDate = new Date();
		Timestamp timestamp = new Timestamp(nowDate.getTime());
		
		account.setUsername(request.getParameter("username"));
		account.setPassword(request.getParameter("password"));
		account.setCreatedAt(timestamp);
		account.setPermission(Boolean.parseBoolean(request.getParameter("permission")));
		
		AccountDAO.updateAccount(account);
		response.sendRedirect("quan-ly-tai-khoan");
	}

	private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		Account account = new Account();
		Date date = new Date();
		Timestamp timestamp= new Timestamp(date.getTime());
		account.setUsername(request.getParameter("username"));
		account.setPassword(request.getParameter("password"));
		account.setCreatedAt(timestamp);
		account.setPermission(Boolean.parseBoolean(request.getParameter("permission")));
		
		AccountDAO.insertAccount(account);
		response.sendRedirect("quan-ly-tai-khoan");
	}

}
