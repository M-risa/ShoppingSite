<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
</head>
<body id ="page-body">
	<div class = "common-container">
		<p class="welcome-text">ようこそ、${user.lastName}さん！</p>
	
		<input type="submit" value="修正" class = "btn-memu">
		<input type="submit" value="削除" class = "btn-memu">
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Logout.action" method="post">
			<input type="submit" value="ログアウト" class = "btn-logout">
		</form>
	</div>

</body>
</html>