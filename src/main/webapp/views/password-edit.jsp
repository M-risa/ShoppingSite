<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード変更</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/edit.css">


</head>
<body id ="page-body"><%@include file="header.jsp" %>

	<div class="common-container">
		<h2>パスワード変更</h2>
	
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/PasswordEdit.action" method="post">
			<div class="input-group">
			<% if(request.getAttribute("currentPassError") != null){ %>
					<p class="error-message" style="color: #ff4444;">${currentPassError}</p>
	    		<% } %>
				<label for="currentPassword">現在のパスワード</label>
				<input type="password" name="currentPassword" required>
			</div>
			
			<div class="input-group">
			<% if(request.getAttribute("newPassError") != null){ %>
					<p class="error-message" style="color: #ff4444;">${newPassError}</p>
	    		<% } %>
				<label for="currentPassword">新しいパスワード</label>
				<input type="password" name="newPassword" placeholder="5文字以上" required>
			</div>
			
			<div class="input-group">
			<% if(request.getAttribute("confirmPassError") != null){ %>
					<p class="error-message" style="color: #ff4444;">${confirmPassError}</p>
	    		<% } %>
				<label for="confirmPassword">新しいパスワード（確認）</label>
				<input type="password" name="confirmPassword" required>
			</div>
			
			<input type="submit" value="変更する" class="btn-edit">
			<input type="button" value="戻る" class="btn-back"
					onclick="history.back()">
			
		</form>
		
	</div>
	
<%@ include file="footer.jsp" %>
</body>
</html>