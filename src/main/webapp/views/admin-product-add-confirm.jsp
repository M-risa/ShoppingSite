<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者 - 登録内容確認</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product.css">
</head>
<body id="admin-product-body">

	<%@include file="header.jsp"%>

	<div class="admin-main-container">
		<h2>登録内容の確認</h2>
		<p>以下の内容で商品を登録します。よろしいですか？</p>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductAddConfirm.action"
			method="post" class="register-form">

			<div class="confirm-group">
				<span class="confirm-label">商品名</span> <span class="confirm-value">${param.productName}</span>
				<input type="hidden" name="productName" value="${param.productName}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">価格 (円)</span> <span
					class="confirm-value">${param.price} 円</span> <input type="hidden"
					name="price" value="${param.price}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">カテゴリー</span> <span class="confirm-value">
					<%
					String cat = request.getParameter("category");
					if ("monitor".equals(cat)) {
						out.print("モニター");
					} else if ("keyboard".equals(cat)) {
						out.print("キーボード");
					} else if ("mouse".equals(cat)) {
						out.print("マウス");
					} else {
						out.print("その他周辺機器");
					}
					%>
				</span> <input type="hidden" name="category" value="${param.category}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">スペック・仕様詳細</span> <span
					class="confirm-value">${param.spec}</span> <input type="hidden"
					name="spec" value="${param.spec}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">初期在庫数</span> <span class="confirm-value">${param.stock}
					個</span> <input type="hidden" name="stock" value="${param.stock}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">商品画像URL</span> <span
					class="confirm-value" style="word-break: break-all;">${param.imageUrl}</span>
				<input type="hidden" name="imageUrl" value="${param.imageUrl}">
			</div>

			<input type="submit" value="登録" class="btn-edit"> 
			<input type="button" value="戻る" class="btn-back" onclick="history.back()">
		</form>
	</div>

</body>
</html>