package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.tool.Action;

public class CartViewAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			return "/views/login-in.jsp";
		}

		List<CartItemBeans> cart = (List<CartItemBeans>) session.getAttribute("cart");
		
		
		int totalPriceExcludingTax = 0;
		int taxAmount = 0;
		int totalPriceIncludingTax = 0;

		if (cart != null && !cart.isEmpty()) {
			for(CartItemBeans item : cart) {
				//単価×数量の合計（税別）
				totalPriceExcludingTax += item.getProduct().getPrice() * item.getCount();
				//買う商品の税込み小計の合計
				totalPriceIncludingTax += item.getTaxIncludedSubtotal();
			}
			//消費税（税込合計 - 税別合計）
			taxAmount = totalPriceIncludingTax - totalPriceExcludingTax;
		}
		
		request.setAttribute("totalPriceExcludingTax", totalPriceExcludingTax);
		request.setAttribute("taxAmount", taxAmount);
		request.setAttribute("totalPriceIncludingTax", totalPriceIncludingTax);

		return "/views/cart.jsp";
	}
}
