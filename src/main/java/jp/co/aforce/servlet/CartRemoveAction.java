package jp.co.aforce.servlet;

import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.tool.Action;

public class CartRemoveAction extends Action {

    @SuppressWarnings("unchecked")
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response
    		) throws Exception {
        
        HttpSession session = request.getSession();
        List<ProductBeans> cart = (List<ProductBeans>) session.getAttribute("cart");
        
        String productIdStr = request.getParameter("productId");
        
        if(cart != null && productIdStr != null && !productIdStr.isEmpty()) {
        	int productId = Integer.parseInt(productIdStr);
        	
        	for(int i = 0; i < cart.size(); i++) {
        		if(cart.get(i).getProductId() == productId) {
        			cart.remove(i);
        			break;
        		}
        	}
        }
        
        session.setAttribute("cart", cart);
        
        return "/views/cart.jsp";
    }

}
