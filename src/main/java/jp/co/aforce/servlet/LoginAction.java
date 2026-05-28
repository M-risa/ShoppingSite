package jp.co.aforce.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/servlet/login-action")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(
			HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		UserDAO dao = new UserDAO();
		
		try {
		UserBeans user = dao.search(memberId, password);
		
		if(user != null) {
			session.setAttribute("user", user);
			
			request.getRequestDispatcher("user-menu.jsp").forward(request, response);
		
		} else {
			request.getRequestDispatcher("login-error.jsp").forward(request, response);
		}
	
		
	} catch(Exception e) {
		e.printStackTrace();
		
		request.getRequestDispatcher("login-error.jsp").forward(request, response);
	}

	}
}
