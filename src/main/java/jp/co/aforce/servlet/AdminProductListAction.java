package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.beans.UserBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class AdminProductListAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception{
		
		HttpSession session = request.getSession();
		UserBeans loginUser = (UserBeans) session.getAttribute("user");
		
		if(loginUser == null || loginUser.getRole() != 1) {
			return "/views/login-in.jsp";
		}
		
		try {
			ProductDAO dao = new ProductDAO();
			List<ProductBeans> productList = dao.selectAll();
			
			request.setAttribute("productList", productList);
			return "/views/admin-product-manage.jsp";
		
		} catch(Exception e) {
			e.printStackTrace();
			return "/views/admin-menu.jsp";
		}
	}

}
