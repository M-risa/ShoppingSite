<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ショッピングカート | Setup Lab</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css">

</head>
<body id="page-body"><%@include file="header.jsp" %>

	<div class="cart-main-container">
		<h1 class="cart-main-title">カート</h1>
		
		<c:choose>
			<c:when test="${empty cart}">
				<div class="cart-empty-box">
					<p>カートに商品が入ってません</p>
					<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action" class="btn-back-to-shop">お買い物を続ける</a>
				</div>
			</c:when>
			
			
			<c:otherwise>
				<div class="cart-content-layout">
				
					<div class="cart-items-list">
						<c:forEach var="product" items="${cart}">
							<div class="cart-item-card">
							
								<div class="cart-item-img">
									<c:choose>
										<c:when test="${not empty product.imageUrl}">
											<img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="${product.productName}">
										</c:when>
										<c:otherwise>
											<div class="cart-no-image">画像なし</div>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="cart-item-info">
									<h3 class="cart-item-name">${product.productName}</h3>
									<p class="cart-item-spec">${product.spec}</p>
								</div>
								
								<div class="cart-item-price-box">
									<span class="cart-item-price">${product.price} 円</span>
								</div>

								<div class="cart-item-remove-box">
									<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartRemove.action"
										method="post">
										<input type="hidden" name="productId" value="${product.productId}">
										<button type="submit" class="btn-cart-remove">削除</button>
									</form>
								</div>
							</div>
						</c:forEach>

					</div>
				
				
				<div class="cart-summary-box">
						<h2 class="summary-title">注文内容</h2>
						
						<div class="summary-row">
							<span>商品合計金額</span>
							<span class="summary-total-price">
								計算中...
							</span>
						</div>
						
						<button type="button" class="btn-checkout" onclick="alert('購入処理は未実装です！')">購入手続きへ進む</button>
						
						<div class="summary-back-link">
							<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action">➔ お買い物を続ける</a>
						</div>
					</div>
				
				</div>
			</c:otherwise>
		</c:choose>
	</div>

<%@ include file="footer.jsp" %>
</body>
</html>