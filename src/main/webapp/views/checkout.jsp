<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容の確認 | SETUP LAB</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/checkout.css">

</head>
<body id="page-body"><%@include file="header.jsp"%>

	<div class="checkout-container">
		<h1 class="checkout-title">注文内容の確認</h1>

		<div class="checkout-list">
			<c:forEach var="item" items="${cart}">
				<div class="checkout-item-card">
					
					<div class="item-image-box">
						<c:choose>
							<c:when test="${not empty item.product.imageUrl}">
								<img src="${pageContext.request.contextPath}/images/${item.product.imageUrl}" alt="商品画像" class="product-img">
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/images/no-image.png" alt="No Image" class="product-img">
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="item-detail-box">
						<h3 class="item-name">
							<c:out value="${item.product.productName}" />
						</h3>
						<div class="item-price">
							<fmt:formatNumber value="${item.subtotal}" pattern="#,###" /> 円
						</div>
						<div class="item-count">
							数量：<c:out value="${item.count}" />
						</div>
					</div>

				</div>
			</c:forEach>
		</div>

		<div class="total-box">
			合計金額：<span class="total-price-highlight"><fmt:formatNumber value="${totalPrice}" pattern="#,###" /></span>円
		</div>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/OrderSubmit.action"
			method="post">
			<button type="submit" class="btn-order-confirm">注文を確定する</button>
		</form>

		<div class="back-to-cart-box">
			<a
				href="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartView.action"
				class="btn-back-to-cart">カートに戻る</a>
		</div>

	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>