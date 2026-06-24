package jp.co.aforce.servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import jp.co.aforce.tool.Action;

@MultipartConfig
public class AdminProductAddAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {

		String productName = request.getParameter("productName");
		String priceStr = request.getParameter("price");
		String category = request.getParameter("category");
		String spec = request.getParameter("spec");
		String stockStr = request.getParameter("stock");
		String stockCustomStr = request.getParameter("stock_custom");

		request.setAttribute("productName", productName);
		request.setAttribute("price", priceStr);
		request.setAttribute("category", category);
		request.setAttribute("spec", spec);
		request.setAttribute("stock", stockStr);
		request.setAttribute("stock_custom", stockCustomStr);
		request.setAttribute("isCustomStock", "other".equals(stockStr));
		

		boolean hasError = false;

		if(productName == null || productName.isEmpty()||
				priceStr == null || priceStr.isEmpty() ||
				category == null || category.isEmpty() ||
			stockStr == null || stockStr.isEmpty()) {

			request.setAttribute("error", "必須項目をすべて入力・選択してください。");
			hasError = true;
		}
		
		//  商品名の空白・文字数チェック
		if (productName == null || productName.strip().isEmpty()) {
		    request.setAttribute("productNameError", "商品名を入力してください。");
		    hasError = true;
		} else if (productName.length() > 100) {
		    request.setAttribute("productNameError", "商品名は100文字以内で入力してください。");
		    hasError = true;
		}
		
		if (priceStr != null && !priceStr.isEmpty()) {
			if (!priceStr.matches("^[0-9]+$")) {
				request.setAttribute("priceError", "価格は半角数字のみで入力してください。");
				hasError = true;
			}
		}
		
		//  スペックの文字数チェック
		if (spec != null && spec.length() > 1000) {
		    request.setAttribute("specError", "スペック詳細は1000文字以内で入力してください。");
		    hasError = true;
		}
		
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
			return "/views/admin-product-add.jsp";
		}

		//  すべてのバリデーションを突破した場合のみ、初めて実際にフォルダへ画像を保存する
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

		// 確認画面（confirm.jsp）に渡す最終的な確定データをセット
		request.setAttribute("stock", finalStockStr);
		request.setAttribute("imageUrl", fileName);
		
		return "/views/admin-product-add-confirm.jsp";


	}
}
