package servlets.user;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountDAO;
import Model.Account;
import utils.MyUtils;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet(urlPatterns = "/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//		request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		//		ArrayList<BookCategory> bookCategories = BookCategoryDAO.getAllBookCategories();
		//
		//		request.setAttribute("bookCategories", bookCategories);

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username	= request.getParameter("username");
		String password	= request.getParameter("password");
		String rememberMeStr = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememberMeStr);;
		
		Account user = null;
		boolean hasError = false;
		String errorString = null;

		if(username == null || password == null || username.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString	= "Required username and password!";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {
				// Tìm user trong DB
				user =  AccountDAO.getAccountByUsernamePassword(username, password);

				if (user == null) {
					hasError = true;
					errorString = "Username or password failed";
				}
			} catch (Exception e) {
				e.printStackTrace();
				hasError = true;
				errorString = e.getMessage();
			}
		}
		if (hasError) {
			user = new Account();
			user.setUsername(username);
			user.setPassword(password);
			// Lưu các thông tin vào request attribute trước khi forward.
//			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);
			// Forward (chuyển tiếp) tới trang /WEB-INF/views/loginView.jsp
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/user/index.jsp");
			dispatcher.forward(request, response);
		}
		// Trường hợp không có lỗi
		// Lưu thông tin người dùng vào Secction
		// Và chuyển hướng sang trang userInfo
		else {
			
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);

			// Nếu người dùng chọn tính năng "Remember me"
			if (remember) {
				MyUtils.storeUserCookie(response, user);
			}
			// Ngược lại xóa Cookie
			else {
				MyUtils.deleteUserCookie(response);
			}
			// Redirect (chuyển hướng) sang trang /userInfo
			response.sendRedirect(request.getContextPath());
		}
	}
}
