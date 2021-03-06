
package servlets.admin;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountDAO;
import DAO.BookDAO;
import Model.Account;
import Model.Book;
import utils.MyUtils;

/**
 * Servlet implementation class indexServlet
 */
@WebServlet(urlPatterns = "/admin")
public class indexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public indexServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		request.getRequestDispatcher("/admin/index.jsp").forward(request, response);
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/admin/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username	= request.getParameter("username");
		String password	= request.getParameter("password");
		String rememberMeStr = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememberMeStr);
		
		Account user = null;
		boolean hasError = false;
		String errorString = null;

		if(username == null || password == null || username.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString	= "Required username and password!";
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			try {
				// T??m user trong DB
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
			// L??u c??c th??ng tin v??o request attribute tr?????c khi forward.
//			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);
			// Forward (chuy???n ti???p) t???i trang /WEB-INF/views/loginView.jsp
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/admin/index.jsp");
			dispatcher.forward(request, response);
		}
		// Tr?????ng h???p kh??ng c?? l???i
		// L??u th??ng tin ng?????i d??ng v??o Secction
		// V?? chuy???n h?????ng sang trang userInfo
		else {
			
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);

			// N???u ng?????i d??ng ch???n t??nh n??ng "Remember me"
			if (remember) {
				MyUtils.storeUserCookie(response, user);
			}
			// Ng?????c l???i x??a Cookie
			else {
				MyUtils.deleteUserCookie(response);
			}
			// Redirect (chuy???n h?????ng) sang trang /userInfo
			response.sendRedirect("admin/Dashboard.jsp");
		}
	}
}
