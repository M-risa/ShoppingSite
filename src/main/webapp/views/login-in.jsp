<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン画面</title>
</head>
<body>
	
	<form action="/servlet/login-action" method="post">
		<p>ID：<input type="text" name="id"></p>
		<p>パスワード：<input type="text" name="password"></p>
		<input type="submit" value="ログイン"> 
		<input type="submit" value="新規会員登録">
	</form>

</body>
</html>