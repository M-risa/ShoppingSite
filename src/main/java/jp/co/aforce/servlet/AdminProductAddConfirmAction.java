package jp.co.aforce.servlet;

import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.beans.ProductBeans;
import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

@MultipartConfig
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
			String fileName = request.getParameter("imageUrl");
			
//			Part filePart = request.getPart("imageFile");
//			String fileName = null;
//
//			if (filePart != null && filePart.getSize() > 0) {
//				fileName = filePart.getSubmittedFileName();
//
//				String savePath = "C:\\upload_images";
//				java.io.File uploadDir = new java.io.File(savePath);
//
//				// フォルダがなければ作成
//				if (!uploadDir.exists()) {
//					uploadDir.mkdir();
//				}
//
//				filePart.write(savePath + java.io.File.separator + fileName);
//				System.out.println("【AddActionで保存成功】画像がフォルダに入りました: " + fileName);
//			} else {
//				// 万が一ファイル本体が空なら、隠しパラメータの文字列を引き継ぐ
//				fileName = request.getParameter("imageUrl");
//			}
			
			ProductBeans product = new ProductBeans();
			product.setProductName(productName);
			product.setPrice(price);
			product.setCategory(category);
			product.setSpec(spec);
			product.setStock(stock);
			product.setImageUrl(fileName);

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
			System.out.println("--- ConfirmActionで深刻なエラーが発生しました ---");
			e.printStackTrace();
			
			return "redirect:/views/admin-menu.jsp";
		}
	}
}
