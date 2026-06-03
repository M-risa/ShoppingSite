<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録情報変更</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

</head>
<body id="page-body"><%@include file="header.jsp" %>
	
	<div class="common-container">
		<h2>登録情報変更</h2>
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserEdit.action" method="post">

			<label for="lastName">名前（姓）：</label>
			<input type="text" name="lastName" value="${user.getlastName()}" required><br>
			
			<label for="firstName">名前（名）：</label>
			<input type="text" name="firstName" value="${user.getfirstName()}" required><br>
			
			<label for="address">住所：</label>
			<input type="text" name="address" value="${user.getaddress()}" required><br>
			
			<label for="mailAddress">メールアドレス：</label>
			<input type="text" name="mailAddress" value="${user.getmailAddress()}" required><br>
			
			<input type="submit" value="確認">
			
		</form>
		
		<input type="button" value="マイページに戻る"
			onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">

</body>
</html>