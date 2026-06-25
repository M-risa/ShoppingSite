package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.tool.Action;

public class ChackoutViewAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		List<CartItemBeans> cart = (List<CartItemBeans>) session.getAttribute("cart");
		
		if(cart == null || cart.isEmpty()) {
			return "redirect://jp/co/aforce/servlet/CartView.action";
		}
		
		int total = 0;
		for (CartItemBeans item : cart) {
			
			total += item.getTaxIncludedSubtotal(); 
			
		}
		
		request.setAttribute("totalPrice", total);
		
		return "/views/checkout.jsp";
	}

}
