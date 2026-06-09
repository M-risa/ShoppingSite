<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu.css">

</head>

<body id ="page-body"><%@include file="header.jsp" %>

	<div class = "common-container">
		<p class="welcome-text">ようこそ、${user.lastName}さん！</p>
	
		<input type="button" value="登録情報変更" class = "btn-menu"
			onclick="location.href='${pageContext.request.contextPath}/views/user-edit.jsp'">
		<input type="button" value="パスワード変更" class = "btn-menu"
			onclick="location.href='${pageContext.request.contextPath}/views/password-edit.jsp'">
		<input type="button" value="退会" class = "btn-menu"
			onclick="location.href='${pageContext.request.contextPath}/views/user-delete-confirm.jsp'">
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Logout.action" method="post">
			<input type="submit" value="ログアウト" class = "btn-logout">
		</form>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>