package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class UserAddAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
			
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String address = request.getParameter("address");
		String mailAddress = request.getParameter("mailAddress");
		
		if(memberId == null || memberId.isEmpty() ||
				password == null || password.isEmpty() ||
				lastName == null || lastName.isEmpty() ||
				firstName == null || firstName.isEmpty() ||
				address == null || address.isEmpty() ||
				mailAddress == null || mailAddress.isEmpty()) {
			
			request.setAttribute("error", "全ての項目を入力してください。");
			return "/views/user-add.jsp";
		}
		
		UserDAO dao = new UserDAO();
		if(dao.exists(memberId)) {
			request.setAttribute("error", "入力したユーザーIDはすでに登録されています。");
			return "/views/user-add.jsp";
		}
		return "/views/user-add-confirm.jsp";
	}

}
