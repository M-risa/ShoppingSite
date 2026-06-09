package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class AdminUserListAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		
		HttpSession session = request.getSession();
		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		
		if(loginUser == null || loginUser.getRole() != 1) {
			return "/views/login-in.jsp";
		}
		
		UserDAO dao = new UserDAO();
		List<UserBeans> userList = dao.selectAll();
		
		request.setAttribute("userList", userList);
		return "/views/admin-user-list.jsp";
	}

}
