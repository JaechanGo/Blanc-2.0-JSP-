<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<style>
.product_active{
  color: #555;
  background-color: #e7e7e7;
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
			<div class="right_area">
			<%=product.getProductId()%><br>
			Name		: <%=product.getPname()%><br>
			Notice		: <%=product.getNotice()%><br>
			Coffee		: <%=product.getCoffee()%><br>
			Description	: <%=product.getDescription()%><br>
			Price 		: <%=product.getUnitPrice()%>원 (<%=product.getGram()%>g)
			</div>
		</a>
			<div class="shop_pr02"></div>
	</div>
				

				<%
				}
			%>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
<div class="footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>