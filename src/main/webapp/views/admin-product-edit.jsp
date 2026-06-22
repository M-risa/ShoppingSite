<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jp.co.aforce.beans.ProductBeans" %>
<%
ProductBeans product = (ProductBeans) request.getAttribute("product");
boolean isCustomStock = false;
if (product != null) {
    isCustomStock = (product.getStock() != 5 && product.getStock() != 10 && product.getStock() != 20 && product.getStock() != 50);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品情報編集</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product-add.css">

</head>
<body id="admin-body">

	<div class="adminMainContainer">
		<h2>商品情報編集</h2>
		<%
		if (request.getAttribute("error") != null) {
		%>
		<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
			${error}</p>
		<%
		}
		%>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductEdit.action"
			method="post" class="register-form" enctype="multipart/form-data">

			<input type="hidden" name="productId"
				value="<%=product.getProductId()%>">

			<div class="form-group">
				<label>商品ID</label>
				<span class="product-id-text"><%=product.getProductId()%></span>
			</div>

			<div class="form-group">
				<label for="productName">商品名</label>
				<input type="text" id="productName" name="productName"
					value="<%= product.getProductName() %>" required>
			</div>

			<div class="form-group">
				<label for="price">価格 (円)</label>
				<%
				if (request.getAttribute("priceError") != null) {
				%>
				<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
					${priceError}</p>
				<%
				}
				%>
				<input type="text" id="price" name="price" value="<%= product.getPrice() %>" required>
			</div>

			<div class="form-group">
				<label>カテゴリー</label>
				<div class="radio-group">
					<label><input type="radio" name="category" value="monitor" <%= "monitor".equals(product.getCategory()) ? "checked" : "" %>> モニター</label>
					<label><input type="radio" name="category" value="keyboard" <%= "keyboard".equals(product.getCategory()) ? "checked" : "" %>> キーボード</label>
					<label><input type="radio" name="category" value="mouse" <%= "mouse".equals(product.getCategory()) ? "checked" : "" %>> マウス</label>
					<label><input type="radio" name="category" value="other" <%= "other".equals(product.getCategory()) ? "checked" : "" %>> その他周辺機器</label>
				</div>
			</div>

			<div class="form-group">
				<label for="spec">スペック・仕様詳細</label>
				<textarea id="spec" name="spec" rows="5"><%= product.getSpec() != null ? product.getSpec() : "" %></textarea>
			</div>

			<div class="form-group">
				<label>初期在庫数（ストック）</label>
				<%
				if (request.getAttribute("stockError") != null) {
				%>
				<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
					${stockError}</p>
				<%
				}
				%>
				<div class="radio-group">
					<label><input type="radio" name="stock" value="5" <%= product.getStock() == 5 ? "checked" : "" %>> 5個</label>
					<label><input type="radio" name="stock" value="10" <%= product.getStock() == 10 ? "checked" : "" %>> 10個</label>
					<label><input type="radio" name="stock" value="20" <%= product.getStock() == 20 ? "checked" : "" %>> 20個</label>
					<label><input type="radio" name="stock" value="50" <%= product.getStock() == 50 ? "checked" : "" %>> 50個</label>
	                    
					<label class="other-option">
						<input type="radio" name="stock" value="other" id="stock-other" <%= isCustomStock ? "checked" : "" %>>その他
	                    <input type="number" name="stock_custom" id="stockCustomInput" min="1" value="<%= isCustomStock ? product.getStock() : "" %>">個
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for="imageFile">商品画像アップロード</label>
				<input type="hidden" name="imageUrl" value="${product.imageUrl}">
    			<input type="file" id="imageFile" name="imageFile" accept="image/*">
			</div>

			<input type="submit" value="確認" class="btn-edit">
		</form>

		<input type="button" value="商品管理画面に戻る" class="btn-back"
			onclick="location.href='${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductList.action'">

	</div>
<body>

</body>
</html>