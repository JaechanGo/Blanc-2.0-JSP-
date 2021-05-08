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

<%@ page import="cart.*" %>         
<%@ page import="java.util.*" %>    
<!-- 금액 단위 컴마 '테그라이브러리' -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>    
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/style.css">
<title>cart list</title>
</head>
<style>
.product_active{
  font-weight:bold;
  font-size:20px;
  text-decoration: underline;
}
</style>
<body>
<%@ include file="menu.jsp" %>

<%! 
	int [] sum ={0,0,0}; //상품 총가격 
	int sumPrice=0;
	%>
	    <table class="cart cart_table" style="border-left:none;border-right:none;">
        <tr>
            <th class="cart">상품이미지</th>
            <th class="cart">상품명</th>
            <th class="cart cart_qnt">개수</th>
            <th class="cart">총가격</th>
        </tr>
<%
	// 리스트값이 하나도 없으면 상품없다고 리턴
	ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
	if(cartList == null) {
		out.println("선택한 상품이 없습니다.!!!");
	}else
		for(int i = 0 ; i < cartList.size(); i++){		// 상품리스트 하나씩 출력하기
		Product product = cartList.get(i);
		sum[i] = product.getUnitPrice()*product.getOrderQnt(); //총금액 증가 
		sumPrice=sum[0]+sum[1]+sum[2];
	%>

	

		<tr>
			<td class="cart_td cart"><img src="<%=product.getImage()%>" style="width:100px;height:120px;"></td>
			<td class="cart_td cart"><%=product.getPname() %></td><!--<fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/> 원 -->
			<td class="cart_td cart" style="margin-top:5px; margin-bottom:5px;">상품 주문 수량 : <%=product.getOrderQnt() %> 	 <%// 상품 수량%> 개 <hr><br> 1 개당 : &nbsp;<fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/> 원</td>		
			<td class="cart_td cart">총 가격 : <fmt:formatNumber value="<%=product.getUnitPrice()*product.getOrderQnt()%>" pattern="#,###"/> 원</td>

		</tr>

	
	<%	
	}
	%>
	</table>
<br>
<table class="cart cart_table">
<tr>	
	<td class="cart_td cart" style="text-align:right;"><div><dl><dt style="margin-right:6px;">상품가격</dt><dt style="font-size:19px;"><fmt:formatNumber value="<%= sumPrice %>" pattern="#,###"/> 원</dt></dl></div> </td>
	<td class="cart_td cart" style="text-align:center;"> + </td>
	<td class="cart_td cart" style="text-align:center;"><dl><dt>배송비</dt><dt style="font-size:19px;">2,500원</dt></dl></td> 
	<td class="cart_td cart" style="text-align:center;"> - </td>
	<td class="cart_td cart" style="text-align:left;"><dl><dt style="margin-left:3px;">할인금액</dt><dt style="color:red;font-size:19px;">3,000원</dt></dl></td>
	<td class="cart_td cart" style="text-align:right; font-size:40px;"> = </td>
	<td class="cart_td cart" style="text-align:center; font-size:25px;">총 가격 : <fmt:formatNumber value="<%= sumPrice+2500 %>" pattern="#,###"/>원  </td>
</tr>
</table>
<br>
<%
	UserDAO userDAO = new UserDAO();
	User list = userDAO.getUserDATA(userID);
%>
<table class="cart_delivery cart_delivery_table">
		<tr>
			<td class="cart_delivery_index">성함</td>
			<td class="cart_delivery_td cart_delivery"><input type="text" id="name" size="20" value="<%=list.getUserName() %>" placeholder="<%=list.getUserName() %>"></td>
			<td class="cart_delivery_td cart_delivery">ㅎ</td>		

		</tr>
		<tr>
			<td class="cart_delivery_index">배송지</td>
			<td class="cart_delivery_td cart_delivery"> <input type="text" id="ex_input" placeholder="상세 주소를 입력하세요">  </td>
			<td class="cart_delivery_td cart_delivery">ㅎ</td>		

		</tr>
		<tr>
			<td class="cart_delivery_index cart_delivery">배송지</td>
			<td class="cart_delivery_td cart_delivery">반가워</td>
			<td class="cart_delivery_td cart_delivery">ㅎ</td>	
		</tr>				
</table>
<div style="text-align:right; margin-right:100px;">
<p><a	href="add.jsp" class="btn btn-secondary"> <button class="btn btn-info">구매하기 &raquo;</button></a> <a	href="item.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
</div>
<br>
</body>

<%@ include file="footer.jsp"%>
</html>