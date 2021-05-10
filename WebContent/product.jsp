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
<!-- 금액 단위 컴마 '테그라이브러리' -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/bootstrap.css">

<title>상품 상세 정보</title>
<script>
	function cartAdd(goodsCode,PoductName){		
		document.form.goodsCode.value = goodsCode;	// 버튼 선택되면 텍스트필드에 출력
		document.form.submit;	// 장바구니 목록으로 전송
		alert(PoductName+'추가');	// 어떤것이 전송되는지 출력
		
		
	}
</script>

<style>
.product_active{
  font-weight:bold;
  font-size:20px;
  text-decoration: underline;
}
</style>
</head>
<body onload="init();">



<%@ include file="menu.jsp"%>
<%
if(session.getAttribute("userID") != null){
	userID = (String) session.getAttribute("userID");
}
if(userID == null){
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('로그인을 하세요')");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
}	
%>
<%
	request.setCharacterEncoding("UTF-8"); // euc-kr		// UTF-8로 설정
	
	// 세션에서 username가 없으면 새로 셋팅, 한번만 실행됨.
	if(session.getAttribute(userID) == null){		
		session.setAttribute(userID,request.getParameter(userID));
	}
	
	// 상품리스트 정보값이 들어있는 자바클래스 객체 생성
	Product productDao = new Product();	
	
	// 상품리스트 객체를 리스트에 저장할 객체 생성
	ArrayList<Product> ProductsList = productDAO.getProductsList();
%>
<script language="JavaScript">

<!--
var sell_price;
var amount;

function init () {
	sell_price = document.form.sell_price.value;
	amount = document.form.amount.value;
	document.form.sum.value = sell_price;
	change();
}

function add () {
	hm = document.form.amount;
	sum = document.form.sum;
	hm.value ++ ;

	sum.value = parseInt(hm.value) * sell_price;
}

function del () {
	hm = document.form.amount;
	sum = document.form.sum;
		if (hm.value > 1) {
			hm.value -- ;
			sum.value = parseInt(hm.value) * sell_price;
		}
}

function change () {
	hm = document.form.amount;
	sum = document.form.sum;

		if (hm.value < 0) {
			hm.value = 0;
		}
	sum.value = parseInt(hm.value) * sell_price;
	
 function inputNumberFormat(obj) {
     obj.value = comma(uncomma(obj.value));
 }

	
}  
//-->
</script>
	<%
		String id = request.getParameter("id");
		Product product = productDAO.getProductById(id);
	%>
      		<div class="left_area" >
					<br><br><img src="<%=product.getImage()%>" class="itemimg_product pro">		
			</div>		
	<div class="container">
		<div class="row">
			<div class="right_area pro_text">
				<div class="col-md-6 ">
			
				
					<p><span class="badge badge-danger"> <%=product.getProductId()%></span>
					<p><h3>상품명 : <%=product.getPname()%> <%=product.getGram()%>g</h3>
					<p><%=product.getDescription()%>
					<p>제조사 : <%=product.getNotice()%>
					<p>분류 : <%=product.getCoffee()%>
					<h4><fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/>원</h4>
					
							<form name="form" method="post" action="cart.jsp?id=<%=product.getProductId()%>">
							<p>수량 : <input type="text" name="amount" value="1" size="3" onchange="change();">&nbsp;&nbsp;<input type="button" value=" + " onclick="add();"> &nbsp; <input type="button" value=" - " onclick="del();"><input type="hidden" name="sell_price" value="<%=product.getUnitPrice()%>" style="display:none">
							<p>금액 : <input type="text" name="sum" size="11" readonly >원
							
					<p><button class="btn btn-info" onclick="cartAdd('<%=product.getProductId()%>','<%=product.getPname()%>')">장바구니 &raquo;</button><input type="text" value="" name="goodsCode" style="display:none;'"/> <a	href="add.jsp" class="btn btn-secondary"> 구매하기 &raquo;</a> <a	href="item.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a></form>
				</div>
			</div>
		</div>
			
		<br><br>
					<div id="myCarousel" class="carousel slide" data-ride="carousel" style="float:left; margin-top:-270px;">
						<ol class="carousel-indicators ad">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner ad" style=" width:500px;"> <!-- .carousel-inner > .item > a > img -->
							<div class="item active">
								<a href="./product.jsp?id=<%=product.getProductId()%>"><img class="main_item"src="images/item1.jpg" style="height:180px; width:150px; margin-top:40px;" ></a>
							</div>
							<div class="item">
								<img class="main_item" src="images/item2.jpg" style="height:180px; width:150px; margin-top:40px;" >
							</div>
							<div class="item">
								<img class="main_item" src="images/item3.jpg" style="height:180px; width:150px; margin-top:40px;" >
							</div>
						</div>
						<a class="left carousel-control ad" href="#myCarousel" data-slide="prev">
							<span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a class="right carousel-control ad" href="#myCarousel" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"></span>
						</a>			
					</div>
	</div>	
		
<div class="footer" style="height:60px;">
	<%@ include file="footer.jsp"%>
</div>
</body>
</html>
