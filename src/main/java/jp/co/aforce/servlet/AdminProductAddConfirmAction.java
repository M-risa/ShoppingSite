package jp.co.aforce.servlet;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class AdminProductAddConfirmAction extends Action {

	@Override
	public String execute(
			HttpServletRequest request, HttpServletResponse response
			) throws Exception {

		try {
			String productName = request.getParameter("productName");
			int price = Integer.parseInt(request.getParameter("price"));
			String category = request.getParameter("category");
			String spec = request.getParameter("spec");
			int stock = Integer.parseInt(request.getParameter("stock"));
			String imageUrl = request.getParameter("imageUrl");

			ProductBeans product = new ProductBeans();
			product.setProductName(productName);
			product.setPrice(price);
			product.setCategory(category);
			product.setSpec(spec);
			product.setStock(stock);
			product.setImageUrl(imageUrl);

			ProductDAO dao = new ProductDAO();
			int result = dao.insertProduct(product);

			if(result > 0) {
				request.setAttribute("isSuccess", true);
				return "/views/admin-product-add-confirm.jsp";
			} else {
				request.setAttribute("error", "登録に失敗しました。");
				return "/views/admin-product-add.jsp";
			}
		} catch(Exception e) {
			e.printStackTrace();
			
			return "redirect:/views/admin-menu.jsp";
		}
	}
}
