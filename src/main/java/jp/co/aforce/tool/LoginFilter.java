package jp.co.aforce.tool;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	public void init(FilterConfig filterConfig) throws ServletException{}
	public void doFilter(ServletRequest request, ServletResponse response , FilterChain chain)
	throws IOException, ServletException{
		
		
		HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
      //キャッシュ禁止
        res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);
        
        //セッションチェック
        if(session == null || session.getAttribute("user") == null) {
        	res.sendRedirect(req.getContextPath() + "/views/login-in.jsp");
        	return;
        }
        
        chain.doFilter(request, response);
	}
	
	public void destroy() {}

}
