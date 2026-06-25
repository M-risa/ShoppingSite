<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細 | SETUP LAB</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/detail.css">

</head>
<body id="page-body"><%@ include file="header.jsp"%>
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
				<span class="product-price-display"><fmt:formatNumber value="${product.price}" pattern="#,###" /> 円</span>
			</div>

			<div class="detail-stock-row">
				<span class="detail-stock-label">在庫数</span>
				<c:if test="${not empty errorMsg}">
					<div class="detail-error-message">${errorMsg}</div>
				</c:if>

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
				<c:choose>
					<c:when test="${product.stock > 0}">
						<form
							action="${pageContext.request.contextPath}/jp/co/aforce/servlet/CartAdd.action"
							method="post">
							<input type="hidden" name="productId"
								value="${product.productId}">

							<div class="detail-quantity-row">
								<label for="quantity-select" class="quantity-label">数量</label> <select
									id="quantity-select" name="count">
									<c:forEach var="i" begin="1" end="${product.stock}">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select>
							</div>

							<button type="submit" class="btn-add-to-cart">カートに追加</button>
						</form>
					</c:when>

					<c:otherwise>
						<button typre="button" class="btn-add-to-cart-disabled">売り切れ</button>
					</c:otherwise>
				</c:choose>
			</div>

		</div>

	</div>

		<%@ include file="footer.jsp"%>

	<script src="${pageContext.request.contextPath}/js/script.js"></script>
</body>
</html>