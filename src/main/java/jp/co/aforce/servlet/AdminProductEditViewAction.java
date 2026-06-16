package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class AdminProductEditViewAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		//ラジオボタンの値を受け取る
		String productIdStr = request.getParameter("selectProductId");
		
		if(productIdStr == null || productIdStr.trim().isEmpty()) {
			return "AdminProductList.action";
		}
		
		int productId = Integer.parseInt(productIdStr);
		
		ProductDAO dao = new ProductDAO();
		ProductBeans product= dao.searchProductById(productId);
		
		if(product == null) {
			return "adminProductList.action";
		}
		
		//JSPで現在の値を表示
		request.setAttribute("product", product);
		return "/views/admin-product-edit.jsp";
	}

}
