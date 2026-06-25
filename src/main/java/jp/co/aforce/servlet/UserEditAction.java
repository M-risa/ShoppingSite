package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.UserDAO;
import jp.co.aforce.tool.Action;

public class UserEditAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
			
		String lastName = request.getParameter("lastName");
		String firstName = request.getParameter("firstName");
		String address = request.getParameter("address");
		String mailAddress = request.getParameter("mailAddress");
		
		//エラー時に入力値を残すための処理
		request.setAttribute("lastName", lastName);
		request.setAttribute("firstName", firstName);
		request.setAttribute("address", address);
		request.setAttribute("mailAddress", mailAddress);
		
		//個別のエラーチェックを記憶する
		boolean hasError = false;
		
		if(lastName == null || lastName.isEmpty() ||
				firstName == null || firstName.isEmpty() ||
				address == null || address.isEmpty() ||
				mailAddress == null || mailAddress.isEmpty()) {
			
			request.setAttribute("error", "空の項目があります。全ての項目を入力してください。");
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
		
		// メールアドレスに「@」が含まれていなければエラー
		if (mailAddress != null && (!mailAddress.contains("@") || mailAddress.startsWith("@") || mailAddress.endsWith("@"))) {
			request.setAttribute("mailError", "メールアドレスの形式が正しくありません。");
			hasError = true;
			}
		
		//住所の文字制限
		if(address.length() < 5) {
			request.setAttribute("addressError", "住所は都道府県から正確に入力してください。");
			hasError = true;
			}
		
		if(hasError) {
			return "/views/user-edit.jsp";
		}
		
		HttpSession session = request.getSession();

		UserBeans loginUser = (UserBeans) session.getAttribute("user");

		if (loginUser != null) {
			String currentMemberId = loginUser.getmemberId();
			String currentMailAddress = loginUser.getmailAddress();
			
			if(!mailAddress.equals(currentMailAddress)) {
			UserDAO dao = new UserDAO();
				if (dao.existsMailAddressForEdit(mailAddress, currentMemberId)) {
					request.setAttribute("mailError", "このメールアドレスはすでに他のユーザーに登録されています。");
					return "/views/user-edit.jsp";
				}
			}
		}
		
		UserBeans editUser = new UserBeans();
		editUser.setlastName(lastName);
		editUser.setfirstName(firstName);
		editUser.setaddress(address);
		editUser.setmailAddress(mailAddress);
		
		request.setAttribute("editUser", editUser);
		
		return "/views/user-edit-confirm.jsp";
	}

}
