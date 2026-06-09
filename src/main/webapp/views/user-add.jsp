<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録 | shoppingSite</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/add.css">

</head>
<body id="page-body">
	<div class="common-container">
		<h2>新規会員登録</h2>

		<% if(request.getAttribute("error") != null){ %>
		<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
			${error}</p>
		<% } %>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserAdd.action"
			method="post" autocomplete="off">
			<div class="input-group">

				<label for="memberId">ID</label>
				<% if(request.getAttribute("idError") != null){ %>
				<p class="error-message" style="color: #ff4444;">${idError}</p>
				<% } %>
				<input type="text" name="memberId" placeholder="例）M123456"
					autocomplete="off"><br> <label for="password">パスワード</label>
				<% if(request.getAttribute("passError") != null){ %>
				<p class="error-message" style="color: #ff4444;">${passError}</p>
				<% } %>
				<input type="password" name="password" autocomplete="off"><br>

				<label for="lastName">氏名（姓）</label> <input type="text"
					name="lastName" placeholder="例）山田"><br> <label
					for="firstName">氏名（名）</label> <input type="text" name="firstName"
					placeholder="例）太郎"><br> <label for="address">住所</label>
				<% if(request.getAttribute("addressError") != null){ %>
				<p class="error-message" style="color: #ff4444;">${addressError}</p>
				<% } %>
				<input type="text" name="address" placeholder="例）○○県××市"><br>


				<label for="mailAddress">メールアドレス</label>
				<% if(request.getAttribute("mailError") != null){ %>
				<p class="error-message" style="color: #ff4444;">${mailError}</p>
				<% } %>
				<input type="text" name="mailAddress"
					placeholder="例）example@mail.com"><br>
			</div>

			<input type="submit" value="確認" class="btn-edit">
		</form>

		<input type="button" value="ログイン画面に戻る" class="btn-back"
			onclick="location.href='${pageContext.request.contextPath}/views/login-in.jsp'">
	</div>


</body>
</html>