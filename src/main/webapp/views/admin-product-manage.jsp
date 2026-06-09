<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>
</head>
<body id="admin-body"><%@include file="header.jsp"%>

	<div class="adminProductContainer">
		<h2>商品管理</h2>

		<div class="tableContainer">
			<table class="productTable">
				<thead>
					<tr>
						<th>選択</th>
						<th>商品ID</th>
						<th>商品名</th>
						<th>カテゴリー</th>
						<th>価格</th>
						<th>在庫数</th>
					</tr>
				</thead>
				<tbody>
					<%
						List<ProductBeans> productList = (List<ProductBeans>) request.getAttribute("productList");
						if(productList != null && !productList.isEmpty()){
							for(ProductBeans product : productList){
								String catDisplay = "その他周辺機器";
								if("monitor".equals(product.getCategory()))){
									catDisplay = "モニター";
								} else if("keyboard".equals(product.getCategory()))){
									catDisplay = "キーボード";
								} else if("mouse".equals(product.getCategory()))){
									catDisplay = "マウス";
								}
					%>
					<tr>
						<td><input type="radio" name="serectProductId"
							value="<%= product.getProductId() %>"></td>
						<td><%= product.getProductId() %></td>
						<td style="color: #ffffff; font-weight: bold;"><%= product.getProductName() %></td>
						<td><%= catDisplay %></td>
						<td>¥<%= String.format("%,d", product.getPrice()) %></td>
						<td><%= product.getStock() %> 個</td>
					</tr>
					<%
							}
						} else{
				%>
					<tr>
						<td colspan="6"
							style="text-align: center; padding: 40px 0; color: #888888;">
							登録されている商品がありません。下の「登録」ボタンから商品を追加してください。</td>
					</tr>
					<%
						}
				%>
				</tbody>
			</table>
		</div>


		<div class="actionButtonsContainer">
			<a href="${pageContext.request.contextPath}/views/admin-product-register.jsp"
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