<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="product.Product"%>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<style>
.product_active{
  font-weight:bold;
  font-size:20px;
  text-decoration: underline;
}
</style>
<title>BLANC. </title>
</head>
<body>
	<%@ include file="menu.jsp"%>
		<%
		ArrayList<Product> listOfProducts = productDAO.getAllProducts();
		%>
   	<div class="shop_pr01">
			<%
				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
			%>
   		<a href="./product.jsp?id=<%=product.getProductId()%>">
      		<div class="left_area">
					<br><br><img src="<%=product.getImage()%>" class="itemimg">
			</div>	
			<div class="right_area" style="width:100%;">
			<%=product.getProductId()%><br>
			Name		: <%=product.getPname()%><br>
			Notice		: <%=product.getNotice()%><br>
			Coffee		: <%=product.getCoffee()%><br>
			Description	: <%=product.getDescription()%><br>
			Price 		:  <fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/>원 (<%=product.getGram()%>g)
			</div>
		</a>
			<div class="shop_pr02"></div>
	</div>
				

				<%
				}
			%>
<div class="footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>