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
		
		Part filePart = request.getPart("imageFile");
		String fileName = null;
		
		if(filePart != null && filePart.getSize() > 0) {
			fileName = filePart.getSubmittedFileName();
			
			String savePath = "C:\\upload_images";
			java.io.File uploadDir = new java.io.File(savePath);
			if (!uploadDir.exists()) { uploadDir.mkdir(); } // フォルダがなければ作成
			filePart.write(savePath + java.io.File.separator + fileName); 
			System.out.println("画像がフォルダに入りました: " + fileName);
		}

		
		//ストックのその他の入力情報を取得
		String finalStockStr = "";
		
		if("other".equals(stockStr)) {
			finalStockStr = stockCustomStr;
		} else {
			finalStockStr = stockStr;
		}

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
			return "/views/admin-product-add.jsp";
		}
		return "/views/admin-product-add-confirm.jsp";


	}
}
