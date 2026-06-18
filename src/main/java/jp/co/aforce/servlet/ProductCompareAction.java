package jp.co.aforce.servlet;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class ProductCompareAction extends Action {
	
	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		String[] productIds = request.getParameterValues("compareProductId");
		
		List<ProductBeans> compareList = new ArrayList<>();
		ProductDAO dao = new ProductDAO();
		
		if(productIds != null) {
			for(String idStr : productIds) {
				int id = Integer.parseInt(idStr);
				ProductBeans product = dao.getProductById(id);
				if(product != null) {
					compareList.add(product);
				}
			}
		}
		
		request.setAttribute("compareList", compareList);
		
		return "/views/product-compare.jsp";
	
	
	}

}
