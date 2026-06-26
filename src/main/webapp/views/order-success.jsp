<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文完了 | SETUP LAB</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/success.css?v=2">
</head>
<body id="page-body"><%@include file="header.jsp"%>

	<div class="success-main-container">
		<div class="success-icon">✓</div>

		<h1 class="success-title">ご注文が完了いたしました</h1>

		<div class="checkout-products-list">

			<c:forEach var="item" items="${successCart}">
				<div class="checkout-product-card">

					<div class="product-card-top">
						<div class="product-image-box">
							<img
								src="${pageContext.request.contextPath}/images/${item.product.imageUrl}"
								alt="商品画像">
						</div>
						<div class="product-info-box">
							<span class="product-name-text"><c:out value="${item.product.productName}" /></span><br> <span
								class="product-spec-sub"><c:out
									value="${item.product.spec}" /></span>
						</div>
					</div>

					<div class="product-card-bottom">
						<div class="info-item item-price">
							<span class="info-label">単価（税込）</span>
							<span class="info-value"><fmt:formatNumber value="${item.product.price * 1.1}" pattern="#,###" /> 円</span>
						</div>
						<div class="info-item item-count">
							<span class="info-label">数量</span>
							<span class="info-value"><c:out value="${item.count}" /></span>
						</div>
						<div class="info-item item-subtotal">
							<span class="info-label">小計</span>
							<span class="info-value"><fmt:formatNumber value="${item.subtotal * 1.1}" pattern="#,###" /> 円</span>
						</div>
					</div>

				</div>
			</c:forEach>

		</div>

		<div class="order-billing-box">
		
			<div class="billing-row">
				<span>注文番号</span> 
				<span style="font-weight: bold; color: #000000;"><c:out value="${orderId}" /></span>
			</div>
			<div class="billing-row" style="margin-bottom: 24px; padding-bottom: 16px; border-bottom: 1px dashed #e2e8f0;">
				<span>注文日時</span> 
				<span style="color: #333333;"><c:out value="${orderDate}" /></span>
			</div>
			
			<div class="billing-row">
				<span>商品合計金額（税抜）</span> 
				<span><fmt:formatNumber value="${totalExTax}" pattern="#,###" />円</span>
			</div>
			<div class="billing-row">
				<span>消費税 (10%)</span>
				<span><fmt:formatNumber value="${tax}" pattern="#,###" /> 円</span>
			</div>
			<div class="billing-row total-row">
				<span>合計金額（税込）</span>
				<span class="final-price"><fmt:formatNumber value="${totalPrice}" pattern="#,###" /> 円</span>
			</div>
		</div>

		<p class="success-message">
			この度は SETUP LAB でお買い上げいただき、誠にありがとうございます。<br> またのご利用を心よりお待ちしております。
		</p>

		<div class="success-actions">
			<a
				href="${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action"
				class="btn-continue-shopping">トップページへ戻る</a>
		</div>
	</div>


	<%@ include file="footer.jsp"%>
</body>
</html>