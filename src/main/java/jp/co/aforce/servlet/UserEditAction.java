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
		
		// メールアドレスに「@」が含まれていなければエラー
		if (!mailAddress.contains("@")) {
			request.setAttribute("mailError", "メールアドレスの形式が正しくありません。");
			hasError = true;
			}
		
		if(hasError) {
			return "/views/user-edit.jsp";
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
