package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.OrderDAO;
import jp.co.aforce.tool.Action;

public class OrderSubmitAction extends Action {
	
	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		
		if(loginUser == null) {
			return "/views/login-in.jsp";
		}
		
		List<CartItemBeans> cart = (List<CartItemBeans>) session.getAttribute("cart");
		if(cart == null || cart.isEmpty()) {
			return "redirect:/jp/co/aforce/servlet/Home.action";
		}
			
		int totalPrice = 0;
		for (CartItemBeans item : cart) {
			totalPrice += item.getTaxIncludedSubtotal();
		}
			
			String userId = loginUser.getmemberId();
			
			OrderDAO dao = new OrderDAO();
			int orderId = dao.insertOrder(userId, totalPrice, cart);
			
			if(orderId > 0) {
				java.time.LocalDateTime now = java.time.LocalDateTime.now();
				java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
				String orderDate = now.format(formatter);
				
				session.setAttribute("orderId", orderId);
				session.setAttribute("orderDate", orderDate);
				
				session.setAttribute("lastCart", cart);
				session.removeAttribute("cart");
				return "redirect://jp/co/aforce/servlet/OrderSuccessView.action";
			} else {
				request.setAttribute("errorMsg", "申し訳ありません。商品が売り切れました。カートの中身をご確認ください。");
				return "/views/cart.jsp";
			}
	}
	

}
