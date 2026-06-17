package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class LoginAction extends Action {
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {

		HttpSession session=request.getSession();
		
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		UserDAO dao = new UserDAO();
		
		UserBeans user = dao.search(memberId, password);
		
		if(user != null) {
			session.setAttribute("user", user);
			
			//管理者画面に行くかどうかの分岐
			if(user.getRole()== 1) {
			return "redirect:/views/admin-menu.jsp";
			} else {
			return "/jp/co/aforce/servlet/Home.action";
			}
		}
		return "/views/login-error.jsp";
		
	}
		
}
