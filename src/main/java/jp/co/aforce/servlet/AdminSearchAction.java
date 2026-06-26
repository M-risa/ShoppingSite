package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class AdminSearchAction extends Action {
	
	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			return "redirect:/views/login-in.jsp";
		}
		
		String keyword = null;
		String category = request.getParameter("category");
		String sort = request.getParameter("sort");
				if(sort == null || sort.isEmpty()) {
					sort = "default";
				}
		
		try {
			ProductDAO dao = new ProductDAO();
			List<ProductBeans> productList = dao.searchProduct(keyword, category, sort);
			
			request.setAttribute("productList", productList);
			return "/views/admin-product-manage.jsp";
		} catch (Exception e) {
            e.printStackTrace();
            return "/views/admin-menu.jsp";
        }
	}

}
