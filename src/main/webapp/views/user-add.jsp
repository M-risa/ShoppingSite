<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録 | shoppingSite</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/add.css">

</head>
<body id="page-body">
	<div class="common-container">
		<h2>新規会員登録</h2>
		
		<% if(request.getAttribute("error") != null){ %>
			<p style="color: #ff4444;  font-weight: bold; margin-bottom: 15px;">
	            ${error}
	        </p>
	    <% } %>
	
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserAdd.action" method="post">
		<div class="input-group">
			<% if(request.getAttribute("idError") != null){ %>
				<p style="color: #ff4444;  font-weight: bold; margin-bottom: 15px;">
		            ${idError}
		        </p>
		    <% } %>
				<label for="memberId">ID：</label>
				<input type="text" name="memberId"><br>
				
				<% if(request.getAttribute("passError") != null){ %>
				<p style="color: #ff4444;  font-weight: bold; margin-bottom: 15px;">
		            ${passError}
		        </p>
		    <% } %>
				<label for="password">パスワード：</label>
				<input type="password" name="password"><br>
				
				<label for="lastName">名前（姓）：</label>
				<input type="text" name="lastName"><br>
				
				<label for="firstName">名前（名）：</label>
				<input type="text" name="firstName"><br>
				
				<label for="address">住所：</label>
				<input type="text" name="address"><br>
				
				<% if(request.getAttribute("mailError") != null){ %>
				<p style="color: #ff4444;  font-weight: bold; margin-bottom: 15px;">
		            ${mailError}
		        </p>
		    <% } %>
				<label for="mailAddress">メールアドレス：</label>
				<input type="text" name="mailAddress"><br>
		</div>
				
				<input type="submit" value="確認" class="btn-edit">
			</form>
				
				<input type="button" value="ログイン画面に戻る" class="btn-back"
					onclick="location.href='${pageContext.request.contextPath}/views/login-in.jsp'">
	</div>
	

</body>
</html>