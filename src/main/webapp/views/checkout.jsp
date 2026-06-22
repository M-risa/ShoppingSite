<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文内容の確認 | SETUP LAB</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkout.css">

</head>
<body id="page-body"><%@include file="header.jsp" %>

	<div class="checkout-container">
		<h1 class="checkout-title">注文内容の確認</h1>
		
		<div class="checkout-list">
			<c:forEach var="product" items="${cart}">
				<div class="checkout-item">
					<span class="item-name">${product.productName}</span>
					<span class="item-price">${product.price} 円</span>
				</div>
			</c:forEach>
		</div>
		
		<div class="total-box">
				合計金額：<span class="total-price-highlight">${totalPrice}</span>円
		</div>
		
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/OrderSubmit.action" method="post">
			<button type="submit" class="btn-order-confirm">注文を確定する</button>
		</form>
		
		<div class="back-to-cart-box">
			<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartView.action" class="btn-back-to-cart">カートに戻る</a>
		</div>
		
	</div>
	

<%@ include file="footer.jsp" %>
</body>
</html>