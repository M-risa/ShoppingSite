<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		
		<c:if test="${not empty errorMsg}">
			<div class="cart-error-message">
				${errorMsg}
			</div>
		</c:if>
		
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
						<c:forEach var="item" items="${cart}">
							<div class="cart-item-card">
							
								<div class="cart-item-img">
									<c:choose>
										<c:when test="${not empty item.product.imageUrl}">
											<img src="${pageContext.request.contextPath}/images/${item.product.imageUrl}" alt="${item.product.productName}">
										</c:when>
										<c:otherwise>
											<div class="cart-no-image">画像なし</div>
										</c:otherwise>
									</c:choose>
								</div>
								
								<div class="cart-item-info">
									<h3 class="cart-item-name">${item.product.productName}</h3>
									<p class="cart-item-spec">${item.product.spec}</p>
								</div>
								
								<div class="cart-item-quantity-box">
									<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartUpdate.action" method="post">
										<input type="hidden" name="productId" value="${item.product.productId}">
										<label class="cart-qty-label">数量：</label>
										<select name="count" onchange="this.form.submit()" class="cart-qty-select">
											<c:forEach var="i" begin="1" end="${item.product.stock}">
												<option value="${i}" ${item.count == i ? 'selected' : ''}>${i}</option>
											</c:forEach>
										</select>
									</form>
								</div>
								
								<div class="cart-item-price-box">
									<span class="cart-item-price"><fmt:formatNumber value="${item.taxIncludedSubtotal}" pattern="#,###" />円</span>
									<span class="cart-item-unit-price">(単価: <fmt:formatNumber value="${item.product.price}" pattern="#,###" />円 税別）</span>
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
							<span>商品合計金額（税別）</span>
							<span class="summary-total-price">
								<fmt:formatNumber value="${totalPriceExcludingTax}" pattern="#,###" />円
							</span>
						</div>
						
						<div class="summary-row">
							<span>消費税（10％）</span>
							<span class="summary-sub-price"><fmt:formatNumber value="${taxAmount}" pattern="#,###" />円</span>
						</div>
						
						<div class="summary-row total-row">
							<span>ご請求金額(税込)</span>
							<span class="summary-total-price"><fmt:formatNumber value="${totalPriceIncludingTax}" pattern="#,###" />円</span>
						</div>
						
						<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/ChackoutView.action" method="post">
							<button type="submit" class="btn-checkout">購入手続きへ進む</button>
						</form>
						
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