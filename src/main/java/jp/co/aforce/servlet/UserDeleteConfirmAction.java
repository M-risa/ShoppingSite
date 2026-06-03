package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class UserDeleteConfirmAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		//メアド＋IDとパスワードを書いて削除するパターン用
//		String loginId = request.getParameter("loginId");
//		String password = request.getParameter("password");
	
		HttpSession session=request.getSession();
		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		
		if(loginUser == null) {
			request.setAttribute("error", "セッションがタイムアウトしました。");
			return "/views/login-in.jsp";
		}
		
		UserDAO dao = new UserDAO();
		
		//本人確認チェック
//		User checkUser = dao.search(loginId, password);
//		if(checkUser != null && checkUser.getMemberId().equals(loginUser.getMemberId())) {
	
		int result = dao.delete(loginUser.getmemberId());
		
		if(result > 0) {
			session.invalidate();
			return "redirect:/views/user-delete-success.jsp";
		} else {
			request.setAttribute("error", "削除できませんでした。");
			return "/views/user-delete-confirm.jsp";
		}
	
//		} else{
//			request.setAttribute("error", "入力情報が正しくありません");
//			return "/views/user-delete-confirm.jsp;
//		}
	
	}
}
