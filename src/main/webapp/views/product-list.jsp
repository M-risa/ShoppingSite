<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PRODUCTS</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/list.css">

</head>
<body id="page-body"><%@include file="header.jsp"%>

	<div class="product-main-container">

		<div class="product-filter-bar">
			<form
				action="<%=request.getContextPath()%>/jp/co/aforce/servlet/ProductSearch.action"
				method="get" class="product-filter-form">

				<div class="filter-group-horizontal">
					<span class="filter-group-label">FILTER:</span> <label
						class="product-checkbox-label"> <input type="checkbox"
						name="category" value="monitor"> MONITORS
					</label> <label class="product-checkbox-label"> <input
						type="checkbox" name="category" value="keyboard">
						KEYBOARDS
					</label> <label class="product-checkbox-label"> <input
						type="checkbox" name="category" value="mouse"> MICE
					</label>
				</div>

				<button type="submit" class="btn-filter-apply">APPLY</button>
			</form>
		</div>

		<main class="product-content-area">
			<form
				action="<%=request.getContextPath()%>/jp/co/aforce/servlet/ProductCompare.action"
				method="get">

				<div class="product-content-header">
					<span class="product-result-count">RESULTS: <strong>${productList.size()}</strong>
						ITEMS
					</span>
					<button type="submit" class="btn-product-compare">COMPARE
						SELECTED</button>
				</div>

				<div class="product-grid">

					<c:forEach var="product" items="${productList}">
						<div class="spec-card">

							<div class="corner-mark top-left"></div>
							<div class="corner-mark top-right"></div>
							<div class="corner-mark bottom-left"></div>
							<div class="corner-mark bottom-right"></div>

							<div class="card-checkbox-row">
								<label class="compare-checkbox-label"> <input
									type="checkbox" name="compareProductId"
									value="${product.productId}"> 比較
								</label>
							</div>

							<div class="product-img-box">
								<c:choose>
									<c:when test="${not empty product.imageUrl}">
										<img
											src="<%= request.getContextPath() %>/images/${product.imageUrl}"
											alt="${product.productName}">
									</c:when>
									<c:otherwise>
										NO IMAGE
									</c:otherwise>
								</c:choose>
							</div>

							<div class="product-info-details">
								<h3 class="product-title-name">${product.productName}</h3>
								<p class="product-spec-text">${product.spec}</p>

								<div class="product-card-bottom">
									<span class="product-price-display">${product.price} 円</span> <a
										href="<%= request.getContextPath() %>/jp/co/aforce/servlet/ProductDetail.action?productId=${product.productId}"
										class="btn-view-detail">詳細はこちら ➔</a>
								</div>
							</div>

						</div>
					</c:forEach>

				</div>

			</form>
		</main>

	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>