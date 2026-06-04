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
		
		//エラー時に入力値を残すための処理
		request.setAttribute("memberId", memberId);
		request.setAttribute("password", password);
		request.setAttribute("lastName", lastName);
		request.setAttribute("firstName", firstName);
		request.setAttribute("address", address);
		request.setAttribute("mailAddress", mailAddress);
		
		//個別のエラーチェックを記憶する
		boolean hasError = false;
		
		if(memberId == null || memberId.isEmpty() ||
				password == null || password.isEmpty() ||
				lastName == null || lastName.isEmpty() ||
				firstName == null || firstName.isEmpty() ||
				address == null || address.isEmpty() ||
				mailAddress == null || mailAddress.isEmpty()) {
			
			request.setAttribute("error", "全ての項目を入力してください。");
			hasError = true;
		}
		
		// 半角英数字（a-z, A-Z, 0-9）以外が含まれていたらエラー
		if (!memberId.matches("^[a-zA-Z0-9]+$")) {
		    request.setAttribute("idError", "ユーザーIDは半角英数字のみで入力してください。");
		    hasError = true;
		}
		//パスワード文字数チェック
		if(password.length() < 5) {
			request.setAttribute("passError","パスワードは5文字以上で入力してください。");
			hasError = true;
		}
		
		// メールアドレスに「@」が含まれていなければエラー
		if (!mailAddress.contains("@")) {
		    request.setAttribute("mailError", "メールアドレスの形式が正しくありません。");
		    hasError = true;
		}
		
		if(hasError) {
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
