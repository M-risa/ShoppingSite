<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【管理者モード】メニュー</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin.css">

</head>

<body id="admin-body">

	<div class="admin-container">
		<p class="welcome-text">【管理者モード】ようこそ、${user.lastName}さん！</p>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminUserList.action"
			method="post">
			<input type="submit" value="会員情報管理" class="btn-menu">
		</form>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductList.action"
			method="post">
			<input type="submit" value="商品管理" class="btn-menu">
		</form>
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/Logout.action" method="post">
			<input type="submit" value="ログアウト" class="btn-logout">
		</form>
	</div>

</body>
</html>