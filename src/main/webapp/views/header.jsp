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
	<a href = "${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action" class="header-logo">Setup Lab</a>

	<div class="header-search">
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action"
			method="get" class="header-search-form">
			<input type="text" name="keyword" placeholder="何をお探しですか？"
				value="${param.keyword}">
			<button type="submit" class="btn-header-search">検索</button>
		</form>
	</div>

	<nav class = "header-nav">
		<%
		if (loginUser != null) {
		%>
		<span class="header-welcome">ようこそ、<%=loginUser.getlastName()%> 様</span>
		<%
		}
		%>
		
		<a href="<%= myPageUrl %>">マイページ</a>
		<a href = "${pageContext.request.contextPath}/jp/co/aforce/servlet/CartView.action">カート</a>
		</nav>
		
</header>
		
