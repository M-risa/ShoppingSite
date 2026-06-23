package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.tool.Action;

public class CartRemoveAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {

		HttpSession session = request.getSession();
		List<CartItemBeans> cart = (List<CartItemBeans>) session.getAttribute("cart");

		String productIdStr = request.getParameter("productId");

		if(cart != null && productIdStr != null && !productIdStr.isEmpty()) {
			int productId = Integer.parseInt(productIdStr);

			cart.removeIf(item -> item.getProduct().getProductId() == productId);
		}

		session.setAttribute("cart", cart);
	
		return "/jp/co/aforce/servlet/CartView.action";
	}

}
