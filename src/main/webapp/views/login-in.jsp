<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン | shoppingSite</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

</head>

<body id="page-body"><%@ include file="header.jsp" %>
	
	<div class="common-container">
	<h2>ログイン</h2>
	
	<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Login.action" method="post">
		<div class="input-group">
			<label for="memberId">IDまたはメールアドレス</label>
			<input type="text" name="memberId" required>
		</div>
		
		<div class="input-group">
			<label for="password">パスワード</label>
			<input type="password" name="password" id="login-password" required>
		</div>
		<div class="password-toggle-group">
		    <input type="checkbox" id="password-toggle" onclick="togglePassword()">
		    <label tensor for="password-toggle">パスワードを表示する</label>
		</div>
		
		<input type="submit" value="ログイン" class="btn-login"> 
	</form>
	
		<div class="login-footer">
			<p>アカウントはお持ちですか？</p>
			<input type="submit" value="新規会員登録"
				onclick="location.href='${pageContext.request.contextPath}/views/user-add.jsp'">
		</div>
	
	</div>

<script src="${pageContext.request.contextPath}/script/script.js"></script>
<%@ include file="footer.jsp" %>
</body>
</html>