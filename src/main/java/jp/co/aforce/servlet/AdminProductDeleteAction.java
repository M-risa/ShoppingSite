package jp.co.aforce.servlet;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jp.co.aforce.dao.ProductDAO;
import jp.co.aforce.tool.Action;

public class AdminProductDeleteAction extends Action{
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response
			) throws Exception {
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			String productIdStr = request.getParameter("selectProductId");
			
			if(productIdStr == null || productIdStr.trim().isEmpty()) {
				response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("error: IDが空です");
                return null;
			}
			
			int productId = Integer.parseInt(productIdStr);
			
			ProductDAO dao = new ProductDAO();
			int result = dao.deleteProduct(productId);
			
			if(result > 0) {
				out.write("success");
			} else {
				response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				out.write("error: 削除対象が見つかりません");
			}
		} catch(Exception e) {
			e.printStackTrace();
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			out.write("error: " + e.getMessage());
		}
		
		return null;
	}

}
