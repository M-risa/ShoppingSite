<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>登録内容確認</h2>
	<p>以下の内容で登録します。よろしいですか？</p>
	
	<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserAddConfirm.action" method="post">
	
	<input type="hidden" name="memberId" value="${param.memberId}">
	<input type="hidden" name="password" value="${param.password}">
	<input type="hidden" name="lastName" value="${param.lastName}">
	<input type="hidden" name="firstName" value="${param.firstName}">
	<input type="hidden" name="address" value="${param.address}">
	<input type="hidden" name="mailAddress" value="${param.mailAddress}">
	
	<p>ユーザーID：${param.memberId}</p>
	<p>パスワード：${param.password}</p>
	<p>名前（姓）：${param.lastName}</p>
	<p>名前（名）：${param.firstName}</p>
	<p>住所：${param.address}</p>
	<p>メールアドレス：${param.mailAddress}</p>
	
	
	<input type="submit" value="登録">
	<input type="button" value="戻る"
		onclick="history.back()">
	</form>

</body>
</html>