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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【管理者モード】商品情報編集</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product-add.css">

</head>
<body id="admin-body">

	<c:set var="currentName"     value="${not empty productName ? productName : product.productName}" />
	<c:set var="currentPrice"    value="${not empty price ? price : product.price}" />
	<c:set var="currentCategory" value="${not empty category ? category : product.category}" />
	<c:set var="currentSpec"     value="${not empty spec ? spec : product.spec}" />
	
	<c:set var="currentStock"    value="${not empty stock ? stock : product.stock}" />
	<c:set var="isCustomStock"   value="${currentStock != 5 && currentStock != 10 && currentStock != 20 && currentStock != 50}" />

	<div class="adminMainContainer">
		<h2>商品情報編集</h2>
			<c:if test="${not empty error}">
				<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
					<c:out value="${error}" />
				</p>
			</c:if>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductEdit.action"
			method="post" class="register-form" enctype="multipart/form-data">

			<input type="hidden" name="productId"
				value="${not empty product.productId ? product.productId : productId}">

			<div class="form-group">
				<label>商品ID</label>
				<span class="product-id-text">${not empty product.productId ? product.productId : productId}</span>
			</div>

			<div class="form-group">
				<label for="productName">商品名</label>
					<c:if test="${not empty productNameError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${productNameError}" />
						</p>
					</c:if>
				<input type="text" id="productName" name="productName"
					value="${currentName}" required>
			</div>

			<div class="form-group">
				<label for="price">価格 (円)</label>
					<c:if test="${not empty priceError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${priceError}" />
						</p>
					</c:if>
				<input type="text" id="price" name="price" value="${currentPrice}" required>
			</div>

			<div class="form-group">
				<label>カテゴリー</label>
				<div class="radio-group">
					<label><input type="radio" name="category" value="monitor" ${currentCategory == 'monitor' ? 'checked' : ''}> モニター</label>
					<label><input type="radio" name="category" value="keyboard" ${currentCategory == 'keyboard' ? 'checked' : ''}> キーボード</label>
					<label><input type="radio" name="category" value="mouse" ${currentCategory == 'mouse' ? 'checked' : ''}> マウス</label>
					<label><input type="radio" name="category" value="other" ${currentCategory == 'other' ? 'checked' : ''}> その他周辺機器</label></div>
			</div>

			<div class="form-group">
				<label for="spec">スペック・仕様詳細</label>
					<c:if test="${not empty specError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${specError}" />
						</p>
					</c:if>
				<textarea id="spec" name="spec" rows="5">${currentSpec}</textarea>
			</div>

			<div class="form-group">
				<label>初期在庫数（ストック）</label>
					<c:if test="${not empty stockError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${stockError}" />
						</p>
					</c:if>
				<div class="radio-group">
					<label><input type="radio" name="stock" value="5" ${currentStock == 5 ? 'checked' : ''}> 5個</label>
					<label><input type="radio" name="stock" value="10" ${currentStock == 10 ? 'checked' : ''}> 10個</label>
					<label><input type="radio" name="stock" value="20" ${currentStock == 20 ? 'checked' : ''}> 20個</label>
					<label><input type="radio" name="stock" value="50" ${currentStock == 50 ? 'checked' : ''}> 50個</label>
	                    
					<label class="other-option">
						<input type="radio" name="stock" value="other" id="stock-other" ${isCustomStock ? 'checked' : ''}>その他
	                    <input type="number" name="stock_custom" id="stockCustomInput" min="1" value="${isCustomStock ? currentStock : ''}">個
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for="imageFile">商品画像アップロード</label>
					<c:if test="${not empty imageError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${imageError}" />
						</p>
					</c:if>
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