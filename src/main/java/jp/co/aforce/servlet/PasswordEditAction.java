package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class PasswordEditAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		
		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		if(loginUser == null) {
			return "login-in.jsp";
		}
		
		String currentPassword = request.getParameter("currentPassword");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword =request.getParameter("confirmPassword");
		
		boolean hasError = false;
		
		if (!loginUser.getpassword().equals(currentPassword)) {
			request.setAttribute("currentPassError", "現在のパスワードが正しくありません。");
			hasError = true;
		}
		
		if (newPassword == null || newPassword.length() < 5) {
			request.setAttribute("newPassError", "新しいパスワードは5文字以上で入力してください。");
			hasError = true;
		}
		
		if (newPassword != null && !newPassword.equals(confirmPassword)) {
			request.setAttribute("confirmPassError", "新しいパスワードと確認用パスワードが一致しません。");
			hasError = true;
		}
		
		if (hasError) {
			return "/views/password-edit.jsp";
		}
		
		//UserDAOに追加したメソッドを呼び出す
		UserDAO dao = new UserDAO();
		int line = dao.updatePassword(loginUser.getmemberId(), newPassword);
		
		if(line > 0) {
			loginUser.setpassword(newPassword);
			session.setAttribute("user", loginUser);
			request.setAttribute("message", "パスワードを正常に変更しました。");
			return "/views/password-success.jsp";
		} else {
			request.setAttribute("error", "システムエラーが発生しました。もう一度お試しください。");
			return "/views/password-edit.jsp";
		}
	}

}
