package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class ProductDetailAction extends Action {
	
	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		String productIdStr = request.getParameter("productId");
		
		if(productIdStr != null && !productIdStr.isEmpty()) {
			int productId = Integer.parseInt(productIdStr);
			
			ProductDAO dao = new ProductDAO();
			ProductBeans product = dao.getProductById(productId);
			
			request.setAttribute("product", product);
		}
		
		return "/views/product-detail.jsp";
	}

}
