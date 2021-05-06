<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
</head>
<body>
	<%
		String userID = null;
		String userName =null;
		
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
			userName = (String) session.getAttribute("userName");
		}

	%>
	<nav class="navbar navbar-default">
		<div class = "navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
				<span class = "icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp"><img src="images/logo.png" style="width:120px; margin:-13px 0px 0px -5px;"></a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-center">
				<li class = "active main_active"><a href="main.jsp">Main</a></li>
				<li class = "active bbs_active"><a href="bbs.jsp">CONTACT</a></li>
				<li class = "active product_active"><a href="item.jsp">SHOP</a></li>
				<li class = "active visit_active"><a href="visit.jsp">VISIT</a></li>
			</ul>
			<%
			if(userID==null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp" style="font-size: 12px;">SignIn</a></li>
				<li class="dropdown">
					<a href='#' class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="faluse">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인/회원가입</a></li>
					</ul>
				</li>
			</ul>	
			
			<%
				} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href='#' class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="faluse">회원정보<span class="caret"></span></a>
					<ul class="dropdown-menu">
					<%
						UserDAO userDAO = new UserDAO();
						User list = userDAO.getUserDATA(userID);
					%>
						<li><a href="#"><%=list.getUserName() %> </a></li>
						<li><a href="#"><%= userID %> </a></li>
						<hr style="margin:2px">
						<li><a href="cart_list.jsp"> 장바구니 </a></li>
						<li><a href="mybbs.jsp">내 문의내역 </a></li>
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
</body>
</html>