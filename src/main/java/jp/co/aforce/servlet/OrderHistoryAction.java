package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.OrderBeans;
import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.OrderDAO;
import jp.co.aforce.tool.Action;

public class OrderHistoryAction extends Action {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		HttpSession session = request.getSession();

		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		if (loginUser == null) {
			return "/views/login-in.jsp";
		}
		
		OrderDAO dao = new OrderDAO();
		List<OrderBeans> orderHistoryList = dao.getOrderHistory(loginUser.getmemberId());
		
		request.setAttribute("orderHistoryList", orderHistoryList);
		
		return "/views/order-history.jsp";

	}

}
