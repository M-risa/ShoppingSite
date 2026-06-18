<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css">

</head>
<body id="page-body"><%@include file="header.jsp"%>
	<div class="detail-container">

		<div class="detail-left-box">
			<c:choose>
				<c:when test="${not empty product.imageUrl}">
					<img
						src="${pageContext.request.contextPath}/images/${product.imageUrl}"
						alt="${product.productName}">
				</c:when>
				<c:otherwise>
					<div class="detail-no-image">画像なし</div>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="detail-right-box">
			<h1 class="detail-product-name">${product.productName}</h1>

			<p class="detail-product-spec">${product.spec}</p>

			<div class="detail-price-row">
				<span class="detail-price-label">値段</span>
				<span class="detail-price">${product.price} 円</span>
			</div>

			<div class="detail-stock-row">
				<span class="detail-stock-label">在庫数</span>
				<c:choose>
					<c:when test="${product.stock > 0}">
						<span class="detail-stock-value">${product.stock} 個</span>
					</c:when>
					<c:otherwise>
						<span class="detail-stock-none">売り切れ（入荷待ち）</span>
					</c:otherwise>
				</c:choose>
			</div>

			<div class="detail-action-row">
				<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartAdd.action">
					<input type="hidden" name="productId" value="${product.productId}">
					<button type="submit" class="btn-add-to-cart">カートに追加</button>
				</form>
			</div>
		</div>

	</div>

</body>
</html>