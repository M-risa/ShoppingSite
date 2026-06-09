<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="jp.co.aforce.beans.UserBeans" %>
 <%
 	UserBeans loginUser = (UserBeans) session.getAttribute("user");
 	String myPageUrl = request.getContextPath() + "/views/user-menu.jsp";
 	
 	if(loginUser != null && loginUser.getRole() == 1){
 		myPageUrl = request.getContextPath() + "/views/admin-menu.jsp";
 	}
 %>

<header class = "site-header">
	<a href = "${pageContext.request.contextPath}/views/login-in.jsp" class="header-logo">shoppingSite</a>
		
		<nav class = "header-nav">
		<a href="<%= myPageUrl %>">マイページ</a>
		<a href = "#">お気に入り</a>
		<a href = "#">カート</a>
		<a href = "#" class = "nav-menu-btn">メニュー</a>
		</nav>
		
</header>
		
