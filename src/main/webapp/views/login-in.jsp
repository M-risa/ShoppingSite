<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | shoppingSite</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body id = "page-body">
	
	<div class = "common-container">
	<h2>ログイン</h2>
	
	<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Login.action" method="post">
		<div class = "input-group">
			<label for="memberId">ID</label>
			<input type="text" name="memberId">
		</div>
		
		<div class = "input-group">
			<label for = "password">パスワード</label>
			<input type="password" name="password">
		</div>
		
		<input type="submit" value="ログイン" class="btn-login"> 
		
	</form>
	
		<div class ="login-footer">
			<p>アカウントはお持ちですか？</p>
			<input type="submit" value="新規会員登録">
		</div>
	
	</div>

</body>
</html>