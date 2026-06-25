<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規会員登録 | SETUP LAB</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/add.css">

</head>
<body id="page-body">
	<div class="common-container">
		<h2>新規会員登録</h2>

		<c:if test="${not empty error}">
			<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
				<c:out value="${error}" />
			</p>
		</c:if>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/UserAdd.action"
			method="post" autocomplete="off">
			<div class="input-group">

				<label for="memberId">ID</label>
				<c:if test="${not empty error}">
					<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
						<c:out value="${idError}" />
					</p>
				</c:if>
				<input type="text" name="memberId" value="${memberId}"
					placeholder="例）M123456" autocomplete="off"><br>
					
					<label for="password">パスワード</label>
				<c:if test="${not empty passError}">
					<p class="error-message" style="color: #ff4444;">
						<c:out value="${passError}" />
					</p>
				</c:if>
				<input type="password" name="password" value="${password}" autocomplete="off"><br>
				
				<label for="password">パスワード（確認用）</label>
				<c:if test="${not empty passConfirmError}">
					<p class="error-message" style="color: #ff4444;">
						<c:out value="${passConfirmError}" />
					</p>
				</c:if>
				<input type="password" name="passwordConfirm"
					value="${passwordConfirm}" autocomplete="off"><br>
					
					<label for="lastName">氏名（姓）</label>
				<c:if test="${not empty lastNameError}">
					<p class="error-message" style="color: #ff4444;">
						<c:out value="${lastNameError}" />
					</p>
				</c:if>
				<input type="text" name="lastName" value="${lastName}" placeholder="例）山田"><br> 
				
				<label for="firstName">氏名（名）</label>
				<c:if test="${not empty firstNameError}">
					<p class="error-message" style="color: #ff4444;">
						<c:out value="${firstNameError}" />
					</p>
				</c:if>
				<input type="text" name="firstName" value="${firstName}" placeholder="例）太郎"><br> 
				
				<label for="address">住所</label>
				<c:if test="${not empty addressError}">
					<p class="error-message" style="color: #ff4444;">
						<c:out value="${addressError}" />
					</p>
				</c:if>
				<input type="text" name="address" value="${address}" placeholder="例）○○県××市"><br>
				
					<label for="mailAddress">メールアドレス</label>
				<c:if test="${not empty mailError}">
					<p class="error-message" style="color: #ff4444;">
						<c:out value="${mailError}" />
					</p>
				</c:if>
				<input type="text" name="mailAddress" value="${mailAddress}" placeholder="例）example@mail.com"><br>
			</div>

			<input type="submit" value="確認" class="btn-edit">
		</form>

		<input type="button" value="ログイン画面に戻る" class="btn-back"
			onclick="location.href='${pageContext.request.contextPath}/views/login-in.jsp'">
	</div>


</body>
</html>