package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.tool.Action;

public class UserEditAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
			
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String address = request.getParameter("address");
		String mailAddress = request.getParameter("mailAddress");
		
		UserBeans editUser = new UserBeans();
		editUser.setlastName(lastName);
		editUser.setfirstName(firstName);
		editUser.setaddress(address);
		editUser.setmailAddress(mailAddress);
		
		request.setAttribute("editUser", editUser);
		
		return "/views/user-edit-confirm.jsp";
	}

}
