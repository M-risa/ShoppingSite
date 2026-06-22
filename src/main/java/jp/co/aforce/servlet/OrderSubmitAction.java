package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.ProductBeans;
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
		
		List<ProductBeans> cart = (List<ProductBeans>) session.getAttribute("cart");
		if(cart == null || cart.isEmpty()) {
			return "redirect:/jp/co/aforce/servlet/Home.action";
		}
			
			int totalPrice = 0;
			for(ProductBeans product : cart) {
				totalPrice += product.getPrice();
			}
			
			String userId = loginUser.getmemberId();
			
			OrderDAO dao = new OrderDAO();
			boolean isSuccess = dao.insertOrder(userId, totalPrice, cart);
			
			if(isSuccess) {
				session.removeAttribute("cart");
				return "redirect:/jp/co/aforce/servlet/OrderSuccessView.action";
			} else {
				request.setAttribute("errorMsg", "申し訳ありません。商品が売り切れました。カートの中身をご確認ください。");
				return "/views/cart.jsp";
			}
	}
	

}
