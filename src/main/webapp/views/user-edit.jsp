<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録情報変更</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/edit.css">

</head>
<body id="page-body"><%@include file="header.jsp" %>
	
	<div class="common-container">
		<h2>登録情報変更</h2>
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserEdit.action" method="post">
			<div class="input-group">
				<label for="lastName">氏名（姓）</label>
				<input type="text" name="lastName" value="${not empty lastName ? lastName : user.lastName}" placeholder="例）山田" required><br>
				
				<label for="firstName">氏名（名）</label>
				<input type="text" name="firstName" value="${not empty firstName ? firstName : user.firstName}" placeholder="例）太郎" required><br>
				
				<% if(request.getAttribute("addressError") != null){ %>
					<p class="error-message" style="color: #ff4444;">${addressError}</p>
	    		<% } %>
				<label for="address">住所</label>
				<input type="text" name="address" value="${not empty address ? address : user.address}" placeholder="例）○○県××市" required><br>
				
				<% if(request.getAttribute("mailError") != null){ %>
					<p class="error-message" style="color: #ff4444;">${mailError}</p>
	    		<% } %>
				<label for="mailAddress">メールアドレス</label>
				<input type="text" name="mailAddress" value="${not empty mailAddress ? mailAddress : user.mailAddress}" placeholder="例）example@mail.com"  required><br>
			</div>
			
			<input type="submit" value="確認" class="btn-edit">
			
		</form>
		
		<input type="button" value="マイページに戻る" class="btn-back"
			onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">
	</div>
	
	
<%@ include file="footer.jsp" %>
</body>
</html>