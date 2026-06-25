<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>退会 | SETUP LAB</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/delete.css">


</head>
<body id="page-body"><%@include file="header.jsp" %>
	<div class="common-container">
		<h2>退会</h2>
		<h3>${user.lastName}さん</h3>
		<p>退会手続きを完了するには、本人確認のためメールアドレスとパスワードを入力してください。</p>
		
		<% if(request.getAttribute("error") != null){ %>
		<p style="color: #ff4444;  font-weight: bold; margin-bottom: 15px;">
            ${error}
        </p>
    <% } %>
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserDeleteConfirm.action">
		
			<div class="input-group">
				<label for="memberId">IDまたはメールアドレス</label>
				<input type="text" name="memberId">
			</div>
			
			<div class="input-group">
				<label for="password">パスワード</label>
				<input type="password" name="password" id="login-password">
			</div>
			<div class="password-toggle-group">
			    <input type="checkbox" id="password-toggle" onclick="togglePassword()">
			    <label tensor for="password-toggle">パスワードを表示する</label>
			</div>
		
			<input type="submit" value="退会" class="btn-delete">
		</form>	
		
			<input type="button" value="戻る" class="btn-back"
				onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">
		
	</div>
	
<script src="${pageContext.request.contextPath}/script/script.js"></script>
<%@ include file="footer.jsp" %>
</body>
</html>