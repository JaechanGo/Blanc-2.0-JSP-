<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="Blance" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="Blance" property="bbsTitle"/>
<jsp:setProperty name="Blance" property="bbsContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>JSP 게시판 웹 사이트 </title>
</head>
<body>
	<%	
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}	else{

			if (Blance.getBbsTitle()== null || Blance.getBbsContent()==null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다. ')");
				script.println("history.back()");
				script.println("</script>");
			} else{
				BbsDAO BlanceDAO =new BbsDAO();
				int result = BlanceDAO.write(Blance.getBbsTitle(), userID, Blance.getBbsContent());
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패하였습니다.')");//데이터베이스 오
					script.println("history.back()");
					script.println("</script>");
				}
				else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
			}
			
		}
	%>
</body>
</html>