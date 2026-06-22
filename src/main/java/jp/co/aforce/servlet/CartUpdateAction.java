package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.tool.Action;

public class CartUpdateAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		List<CartItemBeans> cart = (List<CartItemBeans>) session.getAttribute("cart");
		
		String productIdStr = request.getParameter("productId");
		String countStr = request.getParameter("count");
		
		if(cart != null && productIdStr != null && countStr != null) {
			int productId = Integer.parseInt(productIdStr);
			int newCount = Integer.parseInt(countStr);
			
			for(CartItemBeans item : cart) {
				if(item.getProduct().getProductId() == productId) {
					item.setCount(newCount);
					break;
				}
			}
					
		}
		session.setAttribute("cart", cart);
		
		return "/jp/co/aforce/servlet/CartView.action";
		
	}

}
