<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="jp.co.aforce.beans.ProductBeans"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product.css">
	
</head>
<body id="admin-body"><%@include file="header.jsp"%>

	<div class="adminProductContainer">
		<%
		List<ProductBeans> productList = (List<ProductBeans>) request.getAttribute("productList");
		if (productList != null && !productList.isEmpty()) {
			for (ProductBeans product : productList) {
				// カテゴリ表示用の日本語変換
				String catDisplay = "その他周辺機器";
				if ("monitor".equals(product.getCategory())) {
			catDisplay = "モニター";
				} else if ("keyboard".equals(product.getCategory())) {
			catDisplay = "キーボード";
				} else if ("mouse".equals(product.getCategory())) {
			catDisplay = "マウス";
				}

				//画像が未登録時のデフォルト設定
				String imgUrl = product.getImageUrl();
				if (imgUrl == null || imgUrl.trim().isEmpty()) {
			imgUrl = request.getContextPath() + "/images/no-image.png";
				}
		%>
		<div class="productCard">
			<div class="productSelectArea">
				<input type="radio" name="selectProductId"
					value="<%=product.getProductId()%>">
			</div>

			<div class="productImageArea">
				<img src="<%=imgUrl%>" alt="商品画像">
			</div>

			<div class="productInfoArea">
				<div class="productIdBadge">
					商品ID：<%=  product.getProductId() %></div>
				<h3 class="productName"><%= product.getProductName() %></h3>
				<div class="productCategory-tag"><%= catDisplay %></div>
				<div class="productSpacText">
					<%= (product.getSpec() != null && !product.getSpec().isEmpty()) ? product.getSpec() : "仕様詳細なし" %>
				</div>
			</div>

			<div class="product-status-area">
				<p class="productPrice"><%= String.format("%,d", product.getPrice()) %><span>円</span>
				</p>
				<div class="productStockStatus">
					現在庫：<%= product.getStock() %>
					個
				</div>
			</div>

		</div>

		<%
			}
		} else {
			%>
		<div style="text-align: center; padding: 40px 0; color: #888888;">
			登録されている商品がありません。下の「登録」ボタンから商品を追加してください。</div>
		<%
			}
			%>

	</div>


	<div class="actionButtonsContainer">
		<a
			href="${pageContext.request.contextPath}/views/admin-product-add.jsp"
			class="btn">登録</a>
		<button type="button" class="btn" onclick="alert('今後実装する編集機能です！');">編集</button>
		<button type="button" class="btn" onclick="alert('今後実装する削除機能です！');">削除</button>
	</div>

	<div class="back-button-container">
		<a href="${pageContext.request.contextPath}/views/admin-menu.jsp"
			class="btn-back">管理者メニューに戻る</a>
	</div>

	</div>
</body>
</html>