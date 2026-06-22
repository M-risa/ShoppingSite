package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class HomeAction extends Action {
	
	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			return "redirect:/views/login-in.jsp";
		}
		
		try {
			ProductDAO dao = new ProductDAO();
            List<ProductBeans> productList = dao.selectAll();
            
            request.setAttribute("productList", productList);
            
            return "/views/home.jsp";
		} catch (Exception e){
            e.printStackTrace();
            request.setAttribute("error", "データの取得に失敗しました。");
            return "/views/login-in.jsp";
        }
		
	}

}
