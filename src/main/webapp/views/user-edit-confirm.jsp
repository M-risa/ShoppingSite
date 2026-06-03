<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会員情報変更確認</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

</head>

<body id="page-body"><%@include file="header.jsp" %>
	
	<div class="common-container">
	<h2>会員情報変更確認</h2>
	<p>以下の内容で変更します。よろしければ「更新」ボタンを押してください。</p>
	
	<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserEditConfirm.action" method="post">
	
		<input type="hidden" name="lastName" value="${editUser.getlastName()}">
		<input type="hidden" name="firstName" value="${editUser.getfirstName()}">
		<input type="hidden" name="address" value="${editUser.getaddress()}">
		<input type="hidden" name="mailAddress" value="${editUser.getmailAddress()}">
		
		<p>名前（姓）：${editUser.getlastName()}</p>
		<p>名前（名）：${editUser.getfirstName()}</p>
		<p>住所：${editUser.getaddress()}</p>
		<p>メールアドレス：${editUser.getmailAddress()}</p>
		
		<input type="submit" value="更新">
		<input type="button" value="戻る"
			onclick="history.back()">
		
	</form>
	
		
</head>
<body>

</body>
</html>