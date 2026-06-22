package jp.co.aforce.servlet;

import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jp.co.aforce.beans.CartItemBeans;
import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class CartAddAction extends Action {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		List<CartItemBeans> cart = (List<CartItemBeans>) session.getAttribute("cart");
		if(cart == null) {
			cart = new ArrayList<>();
		}
		
		String productIdStr = request.getParameter("productId");
		String countStr = request.getParameter("count");
		int count = (countStr != null && !countStr.isEmpty()) ? Integer.parseInt(countStr) : 1;
		
		if(productIdStr != null && !productIdStr.isEmpty()) {
			int productId = Integer.parseInt(productIdStr);
			
			ProductDAO dao = new ProductDAO();
			ProductBeans product = dao.getProductById(productId);
			
			if(product != null) {
				if(product.getStock() <= 0) {
					request.setAttribute("errorMsg", "申し訳ありません。この商品は売り切れのためカートに追加できません。");
					return "ProductDetail.action?productId=" + productId;
				}
				//カート内に同じ商品があるかチェック
				boolean exists = false;
				for(CartItemBeans item : cart) {
					if(item.getProduct().getProductId() == productId) {
						//あったら数量を増加
						item.setCount(item.getCount() + count);
						exists = true;
						break;
					}
				}
				if(!exists) {
					cart.add(new CartItemBeans(product, count));
				}
			}
		}
		
		session.setAttribute("cart", cart);
		
		return "redirect:/jp/co/aforce/servlet/CartView.action";
	}
}