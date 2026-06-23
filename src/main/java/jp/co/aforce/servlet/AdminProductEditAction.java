package jp.co.aforce.servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import jp.co.aforce.tool.Action;

@MultipartConfig
public class AdminProductEditAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		String productIdStr = request.getParameter("productId");
		String productName = request.getParameter("productName");
		String priceStr = request.getParameter("price");
		String category = request.getParameter("category");
		String spec = request.getParameter("spec");
		String stockStr = request.getParameter("stock");
		
		Part filePart = request.getPart("imageFile");
		String fileName = null;
		
		if(filePart != null && filePart.getSize() > 0) {
			// ファイル名を取得し、ブラウザによるフルパス送信対策をする（純粋なファイル名のみ抽出）
			fileName = filePart.getSubmittedFileName();
			fileName = new java.io.File(fileName).getName();
			
			//  OS環境（WindowsかLinuxか）を自動判定して、保存先を切り替える
			String osName = System.getProperty("os.name").toLowerCase();
			String savePath = "";
			
			if (osName.contains("windows")) {
				// ローカル環境（Windows）の場合
				savePath = "C:\\upload_images";
			} else {
				//  AWS環境（Linux）の場合
				savePath = "/var/www/shopping_images/";
			}
			
			//  フォルダが存在しなければ、深い階層（/var/www/...）まで自動で作らせる
			java.io.File uploadDir = new java.io.File(savePath);
			if (!uploadDir.exists()) { 
				uploadDir.mkdirs(); 
			} 
			
			// それぞれの環境に応じた正しいパスで画像を書き込む
			filePart.write(savePath + java.io.File.separator + fileName); 
			System.out.println("【ログ】画像がフォルダに入りました: " + savePath + java.io.File.separator + fileName);
		}
			
		//ストックのその他の入力情報を取得
		String stockCustomStr = request.getParameter("stock_custom");
		String finalStockStr = stockStr;
		
		if("other".equals(stockStr)) {
			finalStockStr = stockCustomStr;
		}

		request.setAttribute("productId", productIdStr);
		request.setAttribute("productName", productName);
		request.setAttribute("price", priceStr);
		request.setAttribute("category", category);
		request.setAttribute("spec", spec);
		request.setAttribute("stock", finalStockStr);
		request.setAttribute("imageUrl", fileName);

		boolean hasError = false;

		if(productName == null || productName.isEmpty()||
				priceStr == null || priceStr.isEmpty() ||
				category == null || category.isEmpty()) {

			request.setAttribute("error", "必須項目をすべて入力・選択してください。");
			hasError = true;
		}

		if (priceStr != null && !priceStr.isEmpty()) {
			if (!priceStr.matches("^[0-9]+$")) {
				request.setAttribute("priceError", "価格は半角数字のみで入力してください。");
				hasError = true;
			}
		}
		
		if(finalStockStr != null && !finalStockStr.isEmpty()) {
			if(!finalStockStr.matches("^[0-9]+$")) {
				request.setAttribute("stockError", "在庫数は半角数字のみで入力してください。");
				hasError = true;
			}
		}
		
		
		if(hasError) {
			return "/views/admin-product-edit.jsp";
		}
		return "/views/admin-product-edit-confirm.jsp";
	}

}
