<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文完了 | SETUP LAB</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/success.css">
</head>
<body id="page-body"><%@include file="header.jsp" %>

	<div class="success-main-container">
		<div class="success-icon">✓</div>

		<h1 class="success-title">ご注文が完了いたしました</h1>

		<table class="order-details-table">
			<thead>
				<tr>
					<th>商品名</th>
					<th class="text-center">数量</th>
					<th class="text-right">価格</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${cart}">
					<tr>
						<td class="product-name-cell">${product.productName}<br>
							<span class="product-spec-sub">${product.spec}</span>
						</td>
						<td class="text-center">1</td>
						<td class="text-right">${product.price}円</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="order-billing-box">
			<div class="billing-row">
				<span>商品合計金額（税抜）</span> <span><c:out
						value="${totalPrice - tax}" /> 円</span>
			</div>
			<div class="billing-row">
				<span>消費税 (10%)</span> <span>${tax} 円</span>
			</div>
			<div class="billing-row total-row">
				<span>合計金額（税込）</span> <span class="final-price">${totalPrice}
					円</span>
			</div>
		</div>
	</div>

	<p class="success-message">
            この度は SETUP LAB でお買い上げいただき、誠にありがとうございます。<br>
            またのご利用を心よりお待ちしております。
        </p>
        
        <div class="success-actions">
            <a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action" class="btn-continue-shopping">トップページへ戻る</a>
        </div>
    </div>


<%@ include file="footer.jsp" %>
</body>
</html>