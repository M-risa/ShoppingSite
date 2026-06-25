<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>【管理者モード】編集内容確認</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/admin-product-add.css">

</head>
<body id="admin-body">

	

	<div class="adminMainContainer">
		<h2>編集内容の確認</h2>
		<p>以下の内容で商品を更新します。</p>

		<form
			action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductEditConfirm.action"
			method="post" class="register-form">
			
			<div class="confirm-group">
				<span class="confirm-label">商品ID：</span>
				<span class="confirm-value" style="font-weight: bold;">${productId}</span>
				<input type="hidden" name="productId" value="${productId}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">商品名：</span>
				<span class="confirm-value">${productName}</span>
				<input type="hidden" name="productName" value="${productName}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">価格 (円)：</span> <span
					class="confirm-value">${price} 円</span> <input type="hidden"
					name="price" value="${price}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">カテゴリー：</span>
				<span class="confirm-value"> 
					
			<%
				 String cat = request.getParameter("category");
				 if ("monitor".equals(cat)) {
				 	out.print("モニター");
				 } else if ("keyboard".equals(cat)) {
				 	out.print("キーボード");
				 } else if ("mouse".equals(cat)) {
				 	out.print("マウス");
				 } else {
				 	out.print("その他周辺機器");
				 }
			 %>
			 
			 
				</span>
				<input type="hidden" name="category" value="${category}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">スペック・仕様詳細：</span>
				<span class="confirm-value">${spec}</span>
				<input type="hidden" name="spec" value="${spec}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">初期在庫数：</span>
				<span class="confirm-value">${stock} 個</span>
				<input type="hidden" name="stock" value="${stock}">
			</div>

			<div class="confirm-group">
				<span class="confirm-label">変更後の画像：</span>
				<div class="confirm-value">
					<img src="${pageContext.request.contextPath}/images/${imageUrl}" alt="プレビュー" class="confirm-preview-img"><br>
					<span style="font-size: 0.85em; color: #666; word-break: break-all;">${imageUrl}</span>
				</div>
				<input type="hidden" name="imageUrl" value="${imageUrl}">
			</div>

			<input type="submit" value="登録" class="btn-edit">
			<input type="button" value="戻る" class="btn-back" onclick="history.back()">
		</form>
	</div>

	<%
	if (request.getAttribute("isSuccess") != null) {
	%>
	<div id="successModal" class="modalOverlay">
		<div class="modalBox">
			<h3>商品更新完了</h3>
			<p>データベースへの更新が正常に完了しました！</p>

			<div class="modalButtons">
				<button type="button" id="btn-manage" class="btn-modal-secondary">商品管理画面に戻る</button>
			</div>
		</div>
	</div>
	<%
	}
	%>

	<script src="${pageContext.request.contextPath}/script/script.js"></script>

</body>
</html>