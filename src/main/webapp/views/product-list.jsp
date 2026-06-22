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
			<form action="<%=request.getContextPath()%>/jp/co/aforce/servlet/ProductSearch.action"
				method="get" class="product-filter-form">

				<div class="filter-group-horizontal">
					<span class="filter-group-label">FILTER:</span>
					<label class="product-checkbox-label">
						<input type="checkbox" name="category" value="monitor"> モニター
					</label> 
					<label class="product-checkbox-label">
						<input type="checkbox" name="category" value="keyboard">キーボード
					</label>
					<label class="product-checkbox-label">
						<input type="checkbox" name="category" value="mouse"> マウス
					</label>
				</div>

				<button type="submit" class="btn-filter-apply">適用</button>
			</form>
		</div>

		<main class="product-content-area">
			<form action="<%=request.getContextPath()%>/jp/co/aforce/servlet/ProductCompare.action"
				method="get">

				<div class="product-content-header">
					<span class="product-result-count">検索結果: <strong>${productList.size()}</strong>
						件の商品が見つかりました
					</span>
					
					<div class="product-sort-box">
						<label for="sort-select" class="sort-label">並び替え</label>
						<select id="sort-select" name="sort" onchange="submitWithFilters(this)">
							<option value="default" ${param.sort == 'default' ? 'selected' : '' }>新着順</option>
							<option value="price_asc" ${param.sort == 'price_asc' ? 'selected' : '' }>価格の安い順</option>
							<option value="price_desc" ${param.sort == 'price_desc' ? 'selected' : '' }>価格の高い順</option>
							<option value="name_asc" ${param.sort == 'name_asc' ? 'selected' : '' }>商品名（昇順）</option>
							<option value="name_desc" ${param.sort == 'name_desc' ? 'selected' : '' }>商品名（降順）</option>
							<option value="category_asc" ${param.sort == 'category_asc' ? 'selected' : '' }>カテゴリー（昇順）</option>
							<option value="category_desc" ${param.sort == 'category_desc' ? 'selected' : '' }>カテゴリー（降順）</option>
						</select>
					
					</div>
					<button type="submit" class="btn-product-compare">比較する</button>
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


	<script src="${pageContext.request.contextPath}/script/script.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>