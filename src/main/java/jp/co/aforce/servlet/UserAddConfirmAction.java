package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class UserAddConfirmAction extends Action{
	
	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		try {
			String memberId = request.getParameter("memberId");
			String password = request.getParameter("password");
			String lastName = request.getParameter("lastName");
			String firstName = request.getParameter("firstName");
			String address = request.getParameter("address");
			String mailAddress = request.getParameter("mailAddress");
			
			UserBeans user = new UserBeans(
					memberId, password, lastName, firstName, address, mailAddress, 0, "", "");
		
			UserDAO dao = new UserDAO();
			int result = dao.insert(user);
			
			if(result > 0) {
				return "redirect:/views/user-success.jsp";
			} else {
				request.setAttribute("error", "登録に失敗しました。");
				return "/views/user-add.jsp";
			}
		} catch(Exception e) {
			e.printStackTrace();
			
			return "redirect:/views/login-in.jsp";
		}
				
	}
	
}

