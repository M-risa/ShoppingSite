package jp.co.aforce.servlet;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class CartAddAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		List<ProductBeans> cart = (List<ProductBeans>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<>();
		}
		
		String productIdStr = request.getParameter("productId");
		
		if(productIdStr != null && !productIdStr.isEmpty()) {
			int productId = Integer.parseInt(productIdStr);
			
			ProductDAO dao = new ProductDAO();
			ProductBeans product = dao.getProductById(productId);
			
			if(product != null) {
				cart.add(product);
			}
		}
		
		session.setAttribute("cart", cart);
		
		return "redirect:/jp/co/aforce/servlet/CartView.action";
	}
}