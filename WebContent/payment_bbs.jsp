<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="payment.PaymentDAO" %>
<%@ page import="payment.payment" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ include file="menu.jsp"%>
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
.Blance_active{
	font-weight:bold;
	font-size:20px;
	text-decoration: underline;
}
</style>
</head>
<script>
	function message(){		
		alert('변경되었습니다');	// 어떤것이 전송되는지 출력
	}
</script>
<body>

	<%
		int pageNumber = 1;
		if (request.getParameter("pageNumber")!= null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<br><br>
			<table class="table table-striped" style='paddin:0px0px0px0px; margin:0px0px0px0px; width:100%; text-align: center; border : 1px solid #dddddd;'>
				<thead>
					<tr style="font-size:10px; margin:0px0px0px0px;">
						<th style='background-color : #eeeeee; text-align: center;'>인덱스</th>
						<th style='background-color : #eeeeee; text-align: center;'>userID</th>
						<th style='background-color : #eeeeee; text-align: center;'>상품 NO.</th>
						<th style='background-color : #eeeeee; text-align: center;'>수량</th>
						<th style='background-color : #eeeeee; text-align: center;'>구매자 전화번호</th>
						<th style='background-color : #eeeeee; text-align: center;'>받는분</th>
						<th style='background-color : #eeeeee; text-align: center;'>주소</th>
						<th style='background-color : #eeeeee; text-align: center;'>받는분 전화번호</th>
						<th style='background-color : #eeeeee; text-align: center;'>배달 요청</th>
						<th style='background-color : #eeeeee; text-align: center;'>구매날짜</th>
						<th style='background-color : #eeeeee; text-align: center;'>상태</th>											
					</tr>
				</thead>
				<tbody>
					<%
						PaymentDAO paymentDAO = new PaymentDAO();
						ArrayList<payment> list = paymentDAO.getlist(1);
						for (int i = 0; i < list.size();i++){
					%>
					<tr style="font-size:10px; margin:0px0px0px0px;">
						<td><%= list.get(i).getId() %></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getProductID() %></td>
						<td><%= list.get(i).getProductQnt() %></td>
						<td><%= list.get(i).getUserPhone() %></td>
						<td><%= list.get(i).getItemuser_ID() %></td>
						<td><%= list.get(i).getItemAdress() %></td>
						<td><%= list.get(i).getItemPhone() %></td>
						<td><%= list.get(i).getItemMessage() %></td>
						<td><%= list.get(i).getDate() %></td>
						<td><select id="State" name="State" placeholder="<%= list.get(i).getState() %>">
						<option value="배송준비">배송준비</option>
						<option value="배송중">배송중</option>
						<option value="배송완료">배송완료</option>
						</select>
						
						</td>																	
					</tr>
					<% 		
						}
					%>

				</tbody>
			</table>
			<div style="text-align: right; margin-right: 20px;">
			<button class="btn btn-info" onclick="message()">저장하기 &raquo;</button>
			</div>
			<%
			if(pageNumber != 1){
			%>
				<a href = "bbs.jsp?pageNumber=<%=pageNumber -1%>" class="btn btn-success btn-arraw-left">이전</a>
			<%
				}if(paymentDAO.nextPage(pageNumber+1)){	
			%>
			<a href = "bbs.jsp?pageNumber=<%=pageNumber +1%>" class="btn btn-success btn-arraw-left">다음</a>
			<%
				}
			%>
	
	<br><br><br><br>
<div class="footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>