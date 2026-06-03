<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録 | shoppingSite</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

</head>
<body id="page-body">
	<div class="common-container">
	<h2>新規会員登録</h2>
	
	<% if(request.getAttribute("error") != null){ %>
		<p style="color: #ff4444;  font-weight: bold; margin-bottom: 15px;">
            ${error}
        </p>
    <% } %>

	<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserAdd.action" method="post">
		<label for="memberId">ID：</label>
		<input type="text" name="memberId"><br>
		
		<label for="password">パスワード：</label>
		<input type="password" name="password"><br>
		
		<label for="lastName">名前（姓）：</label>
		<input type="text" name="lastName"><br>
		
		<label for="firstName">名前（名）：</label>
		<input type="text" name="firstName"><br>
		
		<label for="address">住所：</label>
		<input type="text" name="address"><br>
		
		<label for="mailAddress">メールアドレス：</label>
		<input type="text" name="mailAddress"><br>
		
		<input type="submit" value="確認">
	</form>
		
		<input type="submit" value="ログイン画面に戻る"
			onclick="location.href='${pageContext.request.contextPath}/views/login-in.jsp'">
	
	</div>
	

</body>
</html>