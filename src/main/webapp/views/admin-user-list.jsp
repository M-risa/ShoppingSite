<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="jp.co.aforce.beans.UserBeans" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者モード</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">

</head>
<body id ="admin-body"><%@include file="header.jsp" %>

		<div class = "adminTableContainer">
			<h2>会員情報管理</h2>
				
			<div class="table-responsive">
				<table class="userTable">
					<thead>
						<tr>
							<th>会員ID</th>
							<th>氏名(姓)</th>
							<th>氏名(名)</th>
							<th>メールアドレス</th>
							<th>権限</th>
							<th>登録日</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<UserBeans> userList = (List<UserBeans>) request.getAttribute("userList");
							if(userList != null){
								for(UserBeans user : userList){
						%>
						<tr>
							<td><%= user.getmemberId() %></td>
							<td><%= user.getlastName() %></td>
							<td><%= user.getfirstName() %></td>
							<td><%= user.getmailAddress() %></td>
							<td><%= user.getRole() == 1? "管理者" : "一般" %></td>
							<td><%= user.getregistDate() %></td>
						</tr>
						<%
								}
							}
						%>
					</tbody>
				</table>
			</div>
					
					<br>
					<input type="button" value="管理者メニューに戻る" class="btn-back"
						onclick="location.href='${pageContext.request.contextPath}/views/admin-menu.jsp'">
			
				
		</div>

</body>
</html>