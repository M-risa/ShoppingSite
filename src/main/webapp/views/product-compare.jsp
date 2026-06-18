<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/compare.css">

<title>商品比較 | Setup Lab</title>
</head>
<body id="page-body"><%@include file="header.jsp"%>

	<div class="compare-main-container">
		<h1 class="compare-main-title">商品比較</h1>
		
		<c:choose>
			<c:when test="${empty compareList}">
				<div class="compare-empty-box">
					<p>比較する商品がございません</p>
					<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action" class="btn-back-to-list">製品一覧に戻る</a>
				</div>
			</c:when>
			

			<c:otherwise>
				<div class="compare-table-wrapper">
					<table class="compare-table">
					
						<tr class="row-image">
							<th>製品画像</th>
							<c:forEach var="product" items="${compareList}">
								<td>
									<div class="compare-img-box">
										<c:choose>
											<c:when test="${not empty product.imageUrl}">
												<img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="${product.productName}">
											</c:when>
											<c:otherwise>
												<div class="compare-no-image">画像なし</div>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
							</c:forEach>
						</tr>

						<tr class="row-name">
							<th>商品名</th>
							<c:forEach var="product" items="${compareList}">
								<td>
									<h3 class="compare-product-name">${product.productName}</h3>
								</td>
							</c:forEach>
						</tr>

						<tr class="row-price">
							<th>価格</th>
							<c:forEach var="product" items="${compareList}">
								<td>
									<span class="compare-product-price">${product.price} 円</span>
								</td>
							</c:forEach>
						</tr>

						<tr class="row-spec">
							<th>スペック</th>
							<c:forEach var="product" items="${compareList}">
								<td>
									<p class="compare-product-spec">${product.spec}</p>
								</td>
							</c:forEach>
						</tr>

						<tr class="row-action">
							<th>リンク</th>
							<c:forEach var="product" items="${compareList}">
								<td>
									<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductDetail.action?productId=${product.productId}" class="btn-compare-detail">詳細を表示</a>
								</td>
							</c:forEach>
						</tr>
					
					</table>
				</div>
				
	
				<div class="compare-bottom-actions">
					<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action" class="link-back">➔ 製品一覧に戻る</a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>


<%@ include file="footer.jsp"%>
</body>
</html>