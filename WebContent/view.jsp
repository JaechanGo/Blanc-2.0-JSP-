<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<link rel="stylesheet" href="css/custom.css">
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>BLANC. </title>
<style>
.Blance_active{
	font-weight:bold;
	font-size:20px;
	text-decoration: underline;
}
</style>
</head>
<body>
<%@ include file="menu.jsp"%>
	<%

		int bbsID = 0;
		if(request.getParameter("bbsID") != null){
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID ==0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다. ')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}

		Bbs Blance = new BbsDAO().getBbs(bbsID);
	%>
	
	<div class='container'>
		<div class="row">
				<table class="table table-striped" style='text-align: center; border : 1px solid #dddddd'>
					<thead>
						<tr>
							<th colspan="3" style='background-color : #eeeeee; text-align: center;'>게시판 글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width = 20%;">글 제목</td>
							<td colspan="2"><%= Blance.getBbsTitle().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n", "<br>") %></td>
						</tr>	
						<tr>
							<td>작성자</td>
							<td colspan="2"><%= Blance.getUserID() %></td>
						</tr>
						<tr>
							<td>작성 일자</td>
							<td colspan="2"><%= Blance.getBbsDate().substring(0,11)+Blance.getBbsDate().substring(11,13)+"시 "+Blance.getBbsDate().substring(14,16)+"분" %></td>
						</tr>
						<tr>
							<td>내용</td>
							<td colspan="2" style="min-height:200px; text-align : Left;"><%= Blance.getBbsContent().replaceAll(" ","&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt").replaceAll("\n", "<br>") %></td>
						</tr>
					</tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary" style="color:#fff">목록</a>
				<%
					if(userID != null && userID.equals(Blance.getUserID())){
				%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary" style="color:#fff">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %> " class="btn btn-primary" style="color:#fff">삭제</a>
				<%
					}
				%>
		</div>
	</div>
</body>
</html>