package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class ProductSearchAction extends Action {
	
	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		
		try {
			ProductDAO dao = new ProductDAO();
			List<ProductBeans> productList = dao.searchProduct(keyword, category);
			
			request.setAttribute("productList", productList);
			return "/views/product-list.jsp";
		} catch (Exception e) {
            e.printStackTrace();
            return "/views/home.jsp";
        }
	}

}
