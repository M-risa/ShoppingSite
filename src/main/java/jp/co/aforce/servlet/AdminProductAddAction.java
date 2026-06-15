package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.tool.Action;

public class AdminProductAddAction extends Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {

		String productName = request.getParameter("productName");
		String priceStr = request.getParameter("price");
		String category = request.getParameter("category");
		String spec = request.getParameter("spec");
		String stockStr = request.getParameter("stock");
		String imageUrl = request.getParameter("imageUrl");
		
		//ストックのその他の入力情報を取得
		String stockCustomStr = request.getParameter("stock_custom");
		String finalStockStr = stockStr;
		
		if("other".equals(stockStr)) {
			finalStockStr = stockCustomStr;
		}

		request.setAttribute("productName", productName);
		request.setAttribute("price", priceStr);
		request.setAttribute("category", category);
		request.setAttribute("spec", spec);
		request.setAttribute("stock", finalStockStr);
		request.setAttribute("imageUrl", imageUrl);

		boolean hasError = false;

		if(productName == null || productName.isEmpty()||
				priceStr == null || priceStr.isEmpty() ||
				category == null || category.isEmpty() ||
				stockStr == null || finalStockStr.isEmpty()) {

			request.setAttribute("error", "必須項目をすべて入力・選択してください。");
			hasError = true;
		}

		if (priceStr != null && !priceStr.isEmpty()) {
			if (!priceStr.matches("^[0-9]+$")) {
				request.setAttribute("priceError", "価格は半角数字のみで入力してください。");
				hasError = true;
			}
		
		if(finalStockStr != null && !finalStockStr.isEmpty()) {
			if(!finalStockStr.matches("^[0-9]+$")) {
				request.setAttribute("stockError", "在庫数は半角数字のみで入力してください。");
				hasError = true;
			}
		}
		}
		
		if(hasError) {
			return "/views/admin-product-add.jsp";
		}
		return "/views/admin-product-add-confirm.jsp";


	}
}
