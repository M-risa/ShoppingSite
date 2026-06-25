package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class UserEditConfirmAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
			
		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		if(loginUser == null) {
			return "/views/login-in.jsp";
		}
		
		String lastName = request.getParameter("lastName");
        String firstName = request.getParameter("firstName");
        String address = request.getParameter("address");
        String mailAddress = request.getParameter("mailAddress");
        
        UserBeans updateBeans = new UserBeans();
        updateBeans.setmemberId(loginUser.getmemberId());
        updateBeans.setlastName(lastName);
        updateBeans.setfirstName(firstName);
        updateBeans.setaddress(address);
        updateBeans.setmailAddress(mailAddress);
        
        UserDAO dao = new UserDAO();
        int line = dao.update(updateBeans);
        
        if(line > 0) {
        	loginUser.setlastName(lastName);
			loginUser.setfirstName(firstName);
			loginUser.setaddress(address);
			loginUser.setmailAddress(mailAddress);

			session.setAttribute("user", loginUser);
			
        	return "redirect:/views/user-edit-success.jsp";
        } else {
        	return "/views/login-in.jsp";
        }
        
        
	}
	

}
