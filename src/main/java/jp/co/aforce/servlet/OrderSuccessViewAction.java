package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.tool.Action;

public class OrderSuccessViewAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		List<CartItemBeans> lastCart = (List<CartItemBeans>) session.getAttribute("lastCart");
		
		if(lastCart == null) {
			return "redirect://jp/co/aforce/servlet/Home.action";
		}
		
		Object orderId = session.getAttribute("orderId");
		Object orderDate = session.getAttribute("orderDate");
		
		int totalExTax = 0; //税抜合計
		int totalInTax = 0; //税込合計
		
		for(CartItemBeans item : lastCart) {
			totalExTax += item.getSubtotal();
			totalInTax += item.getTaxIncludedSubtotal();
		}
		
		int tax = totalInTax - totalExTax; // 消費税
		
		request.setAttribute("successCart", lastCart);
		request.setAttribute("totalExTax", totalExTax);
		request.setAttribute("tax", tax);
		request.setAttribute("totalPrice", totalInTax);
		request.setAttribute("orderId", orderId);
		request.setAttribute("orderDate", orderDate);
		
		session.removeAttribute("lastCart");
		session.removeAttribute("orderId");
		session.removeAttribute("orderDate");
		
		return "/views/order-success.jsp";
	}

}
