<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SETUP LAB</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">

</head>
<body id="page-body"><%@include file="header.jsp" %>
	
	<section class="home-section">
		<h2 class="section-main-title">カテゴリーから探す</h2>
		<div class="category-grid">
			
			<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action?category=monitor" class="category-card">
				<div class="category-img-placeholder">🖥️</div>
				<span class="category-card-name">モニター</span>
			</a>
			
			<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action?category=keyboard" class="category-card">
				<div class="category-img-placeholder">⌨️</div>
				<span class="category-card-name">キーボード</span>
			</a>
			
			<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action?category=mouse" class="category-card">
				<div class="category-img-placeholder">🖱️</div>
				<span class="category-card-name">マウス</span>
			</a>
			
		</div>
	</section>

	<section class="home-section bg-light">
		<div class="section-header-row">
			<h2 class="section-main-title">おすすめ製品</h2>
			<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action" class="link-view-all">すべての製品 ➔</a>
		</div>

		<div class="home-product-grid">
			<c:forEach var="product" items="${productList}" varStatus="status">
				<c:if test="${status.index < 4}">
					<div class="home-product-card">
						<div class="home-img-box">
							<img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="${product.productName}">
						</div>
						<div class="home-product-info">
							<h3 class="home-product-name">${product.productName}</h3>
							<a href="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductDetail.action?productId=${product.productId}" class="btn-home-detail">詳細を表示</a>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
	</section>

<%@ include file="footer.jsp" %>
</body>
</html>