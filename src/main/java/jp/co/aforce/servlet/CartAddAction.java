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
		
		int productId = 0;
		
		if(productIdStr != null && !productIdStr.isEmpty()) {
			productId = Integer.parseInt(productIdStr);
			
			ProductDAO dao = new ProductDAO();
			ProductBeans product = dao.getProductById(productId);
			
			if(product != null) {
				if(product.getStock() <= 0) {
					request.setAttribute("errorMsg", "申し訳ありません。この商品は売り切れのためカートに追加できません。");
					request.setAttribute("product", product);
					return "/views/product-detail.jsp";
				}
				//カート内に同じ商品があるかチェック
				boolean exists = false;
				int currentCartCount = 0;
				CartItemBeans existingItem = null;
				
				for(CartItemBeans item : cart) {
					if(item.getProduct().getProductId() == productId) {
						//あったら数量を増加
						currentCartCount = item.getCount();
						existingItem = item;
						exists = true;
						break;
					}
				}
				int targetTotalCount = currentCartCount + count;
				
				if(targetTotalCount > product.getStock()) {
					
					request.setAttribute("errorMsg", "申し訳ありません。この商品は在庫数（" + product.getStock() + "個）を超えてカートに入れることはできません。（現在カートに " + currentCartCount + " 個入っています）");
					
					// 詳細画面を再表示するために必要なデータをリクエストに詰める
					request.setAttribute("product", product);
					return "/views/product-detail.jsp";
				}
				
				if(exists && existingItem != null) {
					existingItem.setCount(targetTotalCount);
				}else {
					cart.add(new CartItemBeans(product, count));
				}
			}
		}
		
		session.setAttribute("cart", cart);
		
		
		return "/jp/co/aforce/servlet/CartView.action";
	}
}