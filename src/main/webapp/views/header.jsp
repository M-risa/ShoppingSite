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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="totalCartCount" value="0" />
<c:forEach var="item" items="${sessionScope.cart}">
	<c:set var="totalCartCount" value="${totalCartCount + item.count}" />
</c:forEach>

<header class = "site-header">
	<a href = "${pageContext.request.contextPath}/jp/co/aforce/servlet/Home.action" class="header-logo">Setup Lab</a>

	<div class="header-search">
		<form action="${pageContext.request.contextPath}/jp/co/aforce/servlet/ProductSearch.action"
			method="get" class="header-search-form" onsubmit="return handleHeaderSearch(event, this)">
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
		
		<a href = "${pageContext.request.contextPath}/jp/co/aforce/servlet/CartView.action" class="header-cart-link">カート<c:if test="${totalCartCount > 0}"><span class="cart-badge">${totalCartCount}</span></c:if></a>
	</nav>
		
		
		<div id="login-modal" class="modalOverlay" style="display: none;">
		<div class="modalBox">
			<h3 style="color: #ff4444; margin-top: 0;">ログインが必要です</h3>
			<p style="margin: 15px 0; color: #cccccc; font-size: 14px; line-height: 1.5;">
				商品の検索機能をご利用いただくには、事前にログインしていただく必要があります。
			</p>
			<div class="modalButtons" style="display: flex; justify-content: center; gap: 15px;">
				<a href="${pageContext.request.contextPath}/views/login-in.jsp" class="btn" style="text-decoration: none;">ログイン画面へ</a>
				<button type="button" class="btn-back" onclick="closeLoginModal()">閉じる</button>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="is-logged-in-flag" value="${not empty sessionScope.user ? 'true' : 'false'}">
	
	
</header>