<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>BLANC. </title>
<style type = "text/css">
	a, a:hover{
		color : #000000;
		text-decoration;
	}
</style>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<br><br>
	<div class='container'>
		<div class="row">
			<table class="table table-striped" style='text-align: center; border : 1px solid #dddddd'>
				<thead>
					<tr>
						<th style='background-color : #eeeeee; text-align: center;'>번호</th>
						<th style='background-color : #eeeeee; text-align: center;'>제목</th>
						<th style='background-color : #eeeeee; text-align: center;'>작성일</th>
						<th style='background-color : #eeeeee; text-align: center;'>내용</th>
					</tr>
				</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getlistMy(userID);
						for (int i = 0; i < list.size();i++){
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getBbsDate().substring(0,11)+list.get(i).getBbsDate().substring(11,13)+"시 "+list.get(i).getBbsDate().substring(14,16)+"분" %></td>
						<td style="min-height:200px;"><%= list.get(i).getBbsContent() %></td>
					</tr>
					<% 		
						}
					%>

				</tbody>
			</table>

			<a href = "write.jsp" class='btn btn-primary pull-right'>글쓰기</a>
		</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<br><br><br><br>
<div class="footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>