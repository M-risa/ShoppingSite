package jp.co.aforce.tool;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


//総合窓口、処理の受け渡し役

@WebServlet(urlPatterns={"*.action"})
public class FrontController extends HttpServlet {
	
	public void doPost(
			HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try {
			String path = request.getServletPath().substring(1);
			String name = path.replace(".a", "A").replace('/', '.');
			Action action = (Action)Class.forName(name).
					getDeclaredConstructor().newInstance();
			String url = action.execute(request, response);
			if (url != null && url.startsWith("redirect:")) {
				// 「redirect:」の文字を消して、残りの「/views/〜」を取得
				String targetUrl = url.replace("redirect:", "");
				// ブラウザに対して「URLごと新しく移動してね！」と命令する（リダイレクト）
				response.sendRedirect(request.getContextPath() + targetUrl);
			} else {
				// 今まで通りのフォワード
				request.getRequestDispatcher(url).forward(request, response);
			}
		} catch(Exception e) {
			e.printStackTrace(out);
		}
	}
	
	public void doGet(
			HttpServletRequest request, HttpServletResponse response
			) throws ServletException, IOException {
			doPost(request, response);
	}
	

}
