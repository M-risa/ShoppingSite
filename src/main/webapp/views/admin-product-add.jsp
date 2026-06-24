<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規商品登録</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product-add.css">

</head>
<body id="admin-body">

	<div class="adminMainContainer">
		<h2>新規商品登録</h2>
		
			<c:if test="${not empty error}">
				<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
					<c:out value="${error}" />
				</p>
			</c:if>
		
		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductAdd.action"
			method="post" class="register-form" enctype="multipart/form-data">

			<div class="form-group">
				<label for="productName">商品名</label>
					<c:if test="${not empty productNameError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;"><c:out value="${productNameError}" /></p>
					</c:if>
				<input type="text" id="productName" name="productName"
					placeholder="例: ROG Swift 4K ゲーミングモニター" value="${not empty productName ? productName : ''}" required>
			</div>

			<div class="form-group">
				<label for="price">価格 (円)</label>
					<c:if test="${not empty priceError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${priceError}" />
						</p>
					</c:if>
				<input type="text" id="price" name="price" placeholder="例: 148000"
					value="${not empty price ? price : ''}" required>
			</div>

			<div class="form-group">
				<label>カテゴリー</label>
				<div class="radio-group">
					<label><input type="radio" name="category" value="monitor" ${(empty category || category == 'monitor') ? 'checked' : ''}> モニター</label>
					<label><input type="radio" name="category" value="keyboard" ${category == 'keyboard' ? 'checked' : ''}> キーボード</label> 
					<label><input type="radio" name="category" value="mouse" ${category == 'mouse' ? 'checked' : ''}> マウス</label>
					<label><input type="radio" name="category" value="other" ${category == 'other' ? 'checked' : ''}> その他周辺機器</label>
				</div>
			</div>

			<div class="form-group">
				<label for="spec">スペック・仕様詳細</label>
					<c:if test="${not empty specError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${specError}" />
						</p>
					</c:if>
				<textarea id="spec" name="spec" rows="5"
					placeholder="例:&#10;解像度: 3840x2160 (4K)&#10;リフレッシュレート: 240Hz">${not empty spec ? spec : ''}</textarea>
			</div>

			<div class="form-group">
				<label>初期在庫数（ストック）</label>
					<c:if test="${not empty stockError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;">
							<c:out value="${stockError}" />
						</p>
					</c:if>
				<div class="radio-group">
					<label><input type="radio" name="stock" value="5" ${(empty stock || stock == '5') ? 'checked' : ''}>5個</label>
					<label><input type="radio" name="stock" value="10" ${stock == '10' ? 'checked' : ''}>10個</label>
					<label><input type="radio" name="stock" value="20" ${stock == '20' ? 'checked' : ''}>20個</label>
					<label><input type="radio" name="stock" value="50" ${stock == '50' ? 'checked' : ''}>50個</label>
					<label class="other-option">
						<input type="radio" name="stock" value="other" id="stock-other" ${isCustomStock ? 'checked' : ''}>その他
						<input type="number" name="stock_custom" id="stockCustomInput" placeholder="例：100" value="${isCustomStock ? stock_custom : ''}">個
					</label>
				</div>
			</div>

			<div class="form-group">
				<label for="imageFile">商品画像アップロード</label>
					<c:if test="${not empty imageError}">
						<p style="color: #ff4444; font-weight: bold; margin-bottom: 5px;"><c:out value="${imageError}" /></p>
					</c:if>
				<input type="file" id="imageFile" name="imageFile" accept="image/*">
			</div>

			<input type="submit" value="確認" class="btn-edit">
		</form>

		<input type="button" value="商品管理画面に戻る" class="btn-back"
			onclick="location.href='${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductList.action'">

	</div>

</body>
</html>