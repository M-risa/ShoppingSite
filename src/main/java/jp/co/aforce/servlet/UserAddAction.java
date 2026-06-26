package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class UserAddAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String passwordConfirm = request.getParameter("passwordConfirm");
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String address = request.getParameter("address");
		String mailAddress = request.getParameter("mailAddress");

		//エラー時に入力値を残すための処理
		request.setAttribute("memberId", memberId);
		request.setAttribute("password", password);
		request.setAttribute("passwordConfirm", passwordConfirm);
		request.setAttribute("lastName", lastName);
		request.setAttribute("firstName", firstName);
		request.setAttribute("address", address);
		request.setAttribute("mailAddress", mailAddress);

		//個別のエラーチェックを記憶する
		boolean hasError = false;

		if (memberId == null || memberId.isEmpty() ||
				password == null || password.isEmpty() ||
				lastName == null || lastName.isEmpty() ||
				firstName == null || firstName.isEmpty() ||
				address == null || address.isEmpty() ||
				mailAddress == null || mailAddress.isEmpty()) {

			request.setAttribute("error", "全ての項目を入力してください。");
			hasError = true;
		}
		
		if (lastName != null) {
			// 全角・半角スペースを除去しても空っぽになる場合はエラー
			if (lastName.strip().isEmpty()) {
				request.setAttribute("lastNameError", "姓を正しく入力してください（スペースのみは不可）。");
				hasError = true;
			} else if (lastName.length() > 20) {
				request.setAttribute("lastNameError", "姓は20文字以内で入力してください。");
				hasError = true;
			}
		}

		// 氏名（名）の個別バリデーション
		if (firstName != null) {
			// 全角・半角スペースを除去しても空っぽになる場合はエラー
			if (firstName.strip().isEmpty()) {
				request.setAttribute("firstNameError", "名を正しく入力してください（スペースのみは不可）。");
				hasError = true;
			} else if (firstName.length() > 20) {
				request.setAttribute("firstNameError", "名は20文字以内で入力してください。");
				hasError = true;
			}
		}

		// 半角英数字（a-z, A-Z, 0-9）以外が含まれていたらエラー
		if (!memberId.matches("^[a-zA-Z0-9]{4,20}$")) {
			request.setAttribute("idError", "ユーザーIDは4〜20文字の半角英数字で入力してください。");
			hasError = true;
		}
		//パスワード文字数チェック
		if (password != null && (password.length() < 5 || !password.matches("^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$"))) {
			request.setAttribute("passError", "パスワードは英数字を両方含む5文字以上で入力してください。");
			hasError = true;
		}
		//パスワードの一致チェック
		if (password != null && !password.equals(passwordConfirm)) {
			request.setAttribute("passConfirmError", "パスワードと確認用パスワードが一致しません。");
			hasError = true;
		}

		//住所の文字制限
		if (address.length() < 5) {
			request.setAttribute("addressError", "住所は都道府県から正確に入力してください。");
			hasError = true;
		}


		// メールアドレスに「@」が含まれていなければエラー
		if (!mailAddress.contains("@") || mailAddress.startsWith("@") || mailAddress.endsWith("@")) {
			request.setAttribute("mailError", "メールアドレスの形式が正しくありません。");
			hasError = true;
		}


		if (hasError) {
			return "/views/user-add.jsp";
		}

		UserDAO dao = new UserDAO();
		if (dao.exists(memberId)) {
			request.setAttribute("error", "入力したユーザーIDはすでに登録されています。");
			return "/views/user-add.jsp";
		}
			
		if (dao.existsMailAddress(mailAddress)) {
			request.setAttribute("mailError", "このメールアドレスはすでに登録されています。");
			return "/views/user-add.jsp";
		}
		return "/views/user-add-confirm.jsp";
	}

}
