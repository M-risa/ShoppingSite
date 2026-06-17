<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body id ="admin-body">

	<div class="adminMainContainer">
		<h2>新規商品登録</h2>
		<%
		if (request.getAttribute("error") != null) {
		%>
		<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
			${error}</p>
		<%
		}
		%>

		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductAdd.action" method="post" class="register-form" enctype="multipart/form-data">
			
				<div class="form-group">
                <label for="productName">商品名</label>
                <input type="text" id="productName" name="productName" placeholder="例: ROG Swift 4K ゲーミングモニター" required>
            </div>

            <div class="form-group">
                <label for="price">価格 (円)</label>
				<%
				if (request.getAttribute("priceError") != null) {
				%>
				<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
					${priceError}</p>
				<%
				}
				%>
				<input type="text" id="price" name="price" placeholder="例: 148000" required>
            </div>

            <div class="form-group">
                <label>カテゴリー</label>
                <div class="radio-group">
                    <label><input type="radio" name="category" value="monitor" checked> モニター</label>
                    <label><input type="radio" name="category" value="keyboard"> キーボード</label>
                    <label><input type="radio" name="category" value="mouse"> マウス</label>
                    <label><input type="radio" name="category" value="other"> その他周辺機器</label>
                </div>
            </div>

            <div class="form-group">
                <label for="spec">スペック・仕様詳細</label>
                <input type="text" id="spec" name="spec" placeholder="例: 解像度: 3840x2160 (4K) | リフレッシュレート: 240Hz">
            </div>

            <div class="form-group">
                <label>初期在庫数（ストック）</label>
				<%
				if (request.getAttribute("stockError") != null) {
				%>
				<p style="color: #ff4444; font-weight: bold; margin-bottom: 15px;">
					${stockError}</p>
				<%
				}
				%>
				<div class="radio-group">
                    <label><input type="radio" name="stock" value="5" checked> 5個</label>
                    <label><input type="radio" name="stock" value="10"> 10個</label>
                    <label><input type="radio" name="stock" value="20"> 20個</label>
                    <label><input type="radio" name="stock" value="50"> 50個</label>
                    <label class="other-option">
                    	<input type="radio" name="stock" value="other" id="stock-other">その他
                    	<input type="number" name="stock_custom" id="stockCustomInput" placeholder="例：100">個
                    </label>
                </div>
            </div>

            <div class="form-group">
				<label for="imageFile">商品画像アップロード</label>
				<input type="file" id="imageFile" name="imageFile" accept="image/*">
			</div>

            <input type="submit" value="確認" class="btn-edit">
			</form>
				
				<input type="button" value="商品管理画面に戻る" class="btn-back"
					onclick="location.href='${pageContext.request.contextPath}/jp/co/aforce/servlet/AdminProductList.action'">
			
    </div>

</body>
</html>