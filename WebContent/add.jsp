<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.ArrayList"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String productName = request.getParameter("product");
	
	ArrayList<String> list = (ArrayList<String>) session.getAttribute("productList");
	if(list == null){
		list = new ArrayList<String>();
		session.setAttribute("productList",list);
	}
	list.add(productName);
%>

<script>
	alert("<%= productName %> 추가되었습니다. ");
	history.go(-1);
</script>

</body>
</html>