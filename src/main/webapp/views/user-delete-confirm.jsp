<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">

</head>
<body id="page-body"><%@include file="header.jsp" %>
	<div class="common-container">
		<h2>削除してよろしいですか？</h2>
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserDeleteComfirm.action">
			<input type="submit" value="削除" class="delete-btn">
			<input type="button" value="戻る"
				onclick="history.back()">
		</form>
	</div>
	

<%@ include file="footer.jsp" %>
</body>
</html>