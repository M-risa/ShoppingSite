<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入履歴 | SETUP LAB</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/history.css">

</head>
<body id="page-body"><%@include file="header.jsp"%>

	<div class="history-main-container">
		<h1 class="history-main-title">購入履歴</h1>

		<c:choose>
			<c:when test="${empty orderHistoryList}">
				<div class="history-empty-box">
					<p>まだ購入された商品はありません。</p>
					<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action"
						class="btn-back-to-shop">商品を探す</a>
				</div>
			</c:when>

			<c:otherwise>
				<div class="history-list-wrapper">

					<c:forEach var="order" items="${orderHistoryList}">
						<div class="history-order-group">

							<div class="history-order-top-info">
								<div class="info-row">
									<span class="info-label">注文番号：</span>
									<span class="info-value">#${order.orderId}</span>
								</div>
								<div class="info-row">
									<span class="info-label">合計金額：</span>
									<span class="info-value price-highlight"><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />円</span> <span
										style="font-size: 13px; color: #666666; margin-left: 6px;">
										（内消費税(10%)：<fmt:formatNumber value="${order.totalPrice * 10 / 110}" pattern="#,###" />円）
									</span>
								</div>
								<div class="info-row">
									<span class="info-label">注文日：</span> <span class="info-value">${order.orderDate}</span>
								</div>
							</div>

							<div class="history-order-products-box">
								<c:forEach var="item" items="${order.items}">
									<div class="history-product-card">

										<div class="history-product-img-wrapper">
											<c:choose>
												<c:when test="${not empty item.imageUrl}">
													<img
														src="${pageContext.request.contextPath}/images/${item.imageUrl}"
														alt="${item.productName}">
												</c:when>
												<c:otherwise>
													<div class="history-no-image">NO IMAGE</div>
												</c:otherwise>
											</c:choose>
										</div>

										<div class="history-product-details">
											<h3 class="history-product-title">${item.productName}</h3>
											<p class="history-product-price"><fmt:formatNumber value="${item.price * 1.1}" pattern="#,###" />円</p>
											<span class="history-product-qty">数量: ${item.quantity}</span>
										</div>

										<div class="history-product-action">
											<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductDetail.action?productId=${item.productId}"
												class="btn-history-detail">商品詳細</a>
										</div>

									</div>
								</c:forEach>
							</div>

						</div>
					</c:forEach>

				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="history-actions-container"
		style="text-align: center; margin-top: 40px; margin-bottom: 40px;">
		<div class="action-box-mini">
			<input type="button" value="マイページに戻る" class="btn-back"
				onclick="location.href='${pageContext.request.contextPath}/views/user-menu.jsp'">
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>