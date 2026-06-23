<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品管理</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product.css">

<script src="${pageContext.request.contextPath}/script/script.js"
	id="adminScript" data-context-path="${pageContext.request.contextPath}"></script>

</head>
<body id="admin-body">

	<form id="productActionForm" method="post"
		action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductEditView.action">

		<div class="actionButtonsContainer">
			<a href="${pageContext.request.contextPath}/views/admin-product-add.jsp"
				class="btn">登録</a>
			<button type="button" class="btn" onclick="goToEdit()">編集</button>
			<button type="button" class="btn" onclick="deleteOnTheSpot()">削除</button>
		</div>

		<div class="adminProductContainer">
			
			<c:choose>
				
				<c:when test="${not empty productList}">
					
					
					<% String osName = System.getProperty("os.name").toLowerCase(); %>
					
					<c:forEach var="product" items="${productList}">
						<div class="productCard" id="product-${product.productId}">
							
							<div class="productSelectArea">
								<input type="radio" name="selectProductId" value="${product.productId}">
							</div>

							<div class="productImageArea">
								<c:choose>
									
									<c:when test="${not empty product.imageUrl}">
										<c:choose>
											
											<c:when test="<%= osName.contains(\"windows\") %>">
												<img src="${pageContext.request.contextPath}/images/${product.imageUrl}" alt="商品画像">
											</c:when>
											
											<c:otherwise>
												<img src="/shopping_images/${product.imageUrl}" alt="商品画像">
											</c:otherwise>
										</c:choose>
									</c:when>
									
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/images/no-image.png" alt="画像なし">
									</c:otherwise>
								</c:choose>
							</div>

							<div class="productInfoArea">
								<div class="productIdBadge">商品ID：${product.productId}</div>
								
								<h3 class="productName">${product.productName}</h3>
								
								<div class="productCategory-tag">
									<c:choose>
										<c:when test="${product.category == 'monitor'}">モニター</c:when>
										<c:when test="${product.category == 'keyboard'}">キーボード</c:when>
										<c:when test="${product.category == 'mouse'}">マウス</c:when>
										<c:otherwise>その他周辺機器</c:otherwise>
									</c:choose>
								</div>
								
								<div class="productSpacText">
									<c:choose>
										<c:when test="${not empty product.spec}">${product.spec}</c:when>
										<c:otherwise>仕様詳細なし</c:otherwise>
									</c:choose>
								</div>
								
								<div class="productDatesArea">
									<div>登録日：${not empty product.registDate ? fn:replace(product.registDate, '.0', '') : '-'}</div>
									<div>更新日：${not empty product.updateDate ? fn:replace(product.updateDate, '.0', '') : '-'}</div>
								</div>
							</div>

							<div class="product-status-area">
								<p class="productPrice">
									<fmt:formatNumber value="${product.price}" pattern="#,###" /><span>円</span>
								</p>
								<div class="productStockStatus">
									現在庫：${product.stock} 個
								</div>
							</div>

						</div>
					</c:forEach>
				</c:when>
				
				<c:otherwise>
					<div style="text-align: center; padding: 40px 0; color: #888888;">
						登録されている商品がありません。「登録」ボタンから商品を追加してください。
					</div>
				</c:otherwise>
			</c:choose>

		</div>

		<div class="back-button-container">
			<a href="${pageContext.request.contextPath}/views/admin-menu.jsp"
				class="btn-back">管理者メニューに戻る</a>
		</div>

	</form>
	
	<div id="customConfirmModal" class="modalOverlay" style="display: none;">
		<div class="modalBox">
			<h3 id="confirmTitle">確認</h3>
			<p id="confirmMessage">本当に削除しますか？</p>
			<div class="modalButtons">
				<button type="button" id="btn-confirm-yes" class="btn">はい</button>
				<button type="button" id="btn-confirm-no" class="btn-back">いいえ</button>
			</div>
		</div>
	</div>

	<div id="customAlertModal" class="modalOverlay" style="display: none;">
		<div class="modalBox">
			<h3 id="alertTitle">お知らせ</h3>
			<p id="alertMessage">メッセージ</p>
			<div class="modalButtons">
				<button type="button" id="btn-alert-ok" class="btn">OK</button>
			</div>
		</div>
	</div>
	
</body>
</html>