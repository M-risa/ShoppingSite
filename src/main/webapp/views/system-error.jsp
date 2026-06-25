<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>エラー | SETUP LAB</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/error.css">

</head>

<body><%@include file="header.jsp" %>

	<div class = "common-container">
		<h2 class ="error-text">システムエラーが発生しました</h2>
		<br>
		<p class="system-text">
            申し訳ございません。リクエストの処理中に<br>
            予期せぬエラーが発生しました。<br>
            一度トップページに戻るか、しばらく経ってから再度お試しください。
        </p>
		
		<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action">トップページへ戻る</a>
	</div>

<%@ include file="footer.jsp" %>	
</body>
</html>