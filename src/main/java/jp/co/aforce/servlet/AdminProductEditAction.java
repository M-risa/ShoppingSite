package jp.co.aforce.servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import jp.co.aforce.tool.Action;

@MultipartConfig
public class AdminProductEditAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String productIdStr = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String priceStr = request.getParameter("price");
		String category = request.getParameter("category");
		String spec = request.getParameter("spec");
		String stockStr = request.getParameter("stock");
		String stockCustomStr = request.getParameter("stock_custom");

		// エラー時にJSPへ入力値をそのまま戻すための処理
		request.setAttribute("productId", productIdStr);
		request.setAttribute("productName", productName);
		request.setAttribute("price", priceStr);
		request.setAttribute("category", category);
		request.setAttribute("spec", spec);
		request.setAttribute("stock", stockStr);
		request.setAttribute("stock_custom", stockCustomStr);
		request.setAttribute("isCustomStock", "other".equals(stockStr));

		boolean hasError = false;

		if (productName == null || productName.isEmpty() ||
				priceStr == null || priceStr.isEmpty() ||
				category == null || category.isEmpty() ||
				stockStr == null || stockStr.isEmpty()) {

			request.setAttribute("error", "必須項目をすべて入力・選択してください。");
			hasError = true;
		}

		//  商品名の空白（全角スペース等）・文字数チェック
		if (productName != null) {
			if (productName.strip().isEmpty()) {
				request.setAttribute("productNameError", "商品名を入力してください（スペースのみ不可）。");
				hasError = true;
			} else if (productName.length() > 100) {
				request.setAttribute("productNameError", "商品名は100文字以内で入力してください。");
				hasError = true;
			}
		}

		//  価格の数値・正の数チェック
		if (priceStr != null && !priceStr.isEmpty()) {
			if (!priceStr.matches("^[0-9]+$")) {
				request.setAttribute("priceError", "価格は半角数字のみで入力してください。");
				hasError = true;
			}
		}

		//  在庫数のチェック
		String finalStockStr = "";
		if ("other".equals(stockStr)) {
			if (stockCustomStr == null || stockCustomStr.isEmpty() || !stockCustomStr.matches("^[0-9]+$")) {
				request.setAttribute("stockError", "その他を選択した場合は、在庫数を半角数字で入力してください。");
				hasError = true;
			} else {
				finalStockStr = stockCustomStr;
			}
		} else {
			finalStockStr = stockStr;
		}

		//  スペック詳細の最大文字数チェック
		if (spec != null && spec.length() > 1000) {
			request.setAttribute("specError", "スペック詳細は1000文字以内で入力してください。");
			hasError = true;
		}

		//  画像ファイルチェック
		Part filePart = request.getPart("imageFile");
		String fileName = null;

		if (filePart != null && filePart.getSize() > 0) {
			// 5MBサイズ制限の例
			if (filePart.getSize() > 5 * 1024 * 1024) {
				request.setAttribute("imageError", "画像サイズは5MB以内にしてください。");
				hasError = true;
			}
			// 拡張子(ContentType)のチェック
			String contentType = filePart.getContentType();
			if (contentType == null || !contentType.startsWith("image/")) {
				request.setAttribute("imageError", "画像ファイル（jpg, png等）を選択してください。");
				hasError = true;
			}
			fileName = filePart.getSubmittedFileName();
			fileName = new java.io.File(fileName).getName();
		}

		//  どこか1箇所でもエラーがあれば、この時点で画像を保存せずにJSPへ戻る！
		if (hasError) {
			return "/views/admin-product-edit.jsp";
		}

		//  すべてのバリデーションを突破した場合のみ、実際にフォルダへ画像を保存する
		if (filePart != null && filePart.getSize() > 0 && fileName != null) {
			String osName = System.getProperty("os.name").toLowerCase();
			String savePath = "";

			if (osName.contains("windows")) {
				savePath = "C:\\upload_images";
			} else {
				savePath = "/var/www/shopping_images/";
			}

			java.io.File uploadDir = new java.io.File(savePath);
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			filePart.write(savePath + java.io.File.separator + fileName);
			System.out.println("【ログ】画像がフォルダに入りました: " + savePath + java.io.File.separator + fileName);
		}

		request.setAttribute("stock", finalStockStr);

		//  画像が変更されなかった場合は、既存の古い画像を維持するか、確認画面側で判定するためのケア
		if (fileName != null) {
			request.setAttribute("imageUrl", fileName);
		} else {
			String existingImage = request.getParameter("existingImage");
			request.setAttribute("imageUrl", existingImage != null ? existingImage : "");
		}
		return "/views/admin-product-edit-confirm.jsp";
	}

}
