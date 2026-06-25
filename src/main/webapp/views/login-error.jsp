<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインエラー | SETUP LAB</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css">

</head>

<body><%@include file="header.jsp" %>

	<div class = "common-container">
		<h2 class ="error-text">IDもしくはパスワードが違います。</h2>
		<br>
		
		<a href="${pageContext.request.contextPath}/views/login-in.jsp">ログイン画面に戻る</a>
	</div>

<%@ include file="footer.jsp" %>	
</body>
</html>