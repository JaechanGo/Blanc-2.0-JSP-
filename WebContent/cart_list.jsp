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
<link rel="stylesheet" href="css/needpopup.css">
<script src="js/location_cart.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<title>cart list</title>

</head>
<style>
.product_active{
  font-weight:bold;
  font-size:20px;
  text-decoration: underline;
}
input{
height:25px;
margin:0px;
}
p {
	font-size: 1.2em;
	line-height: 1.4;
	color: #343638;
	margin: 20px 0;
}

.needpopup {
	border-radius: 6px;
	box-shadow: 0 1px 5px 1px rgba(0, 0, 0, 1);
}

.needpopup p {
	margin: 0;
}
.needpopup p + p {
	margin-top: 10px;
}
}
</style>
<script language="javascript" type="text/javascript" >

    function onlyNumber() {
        if ((event.keyCode < 48) || (event.keyCode > 57))
            event.returnValue = false;
    }
    function CheckForm() {
        if (document.getElementById("Name").value == "") {
            window.alert("성함을 입력하세요.");
            return false;
        }
        if (document.getElementById("Email").value == "") {
            window.alert("이메일을 입력하세요.");
            return false;
        }
        if (document.getElementById("Address1").value == "") {
            window.alert("주소를 입력하세요.");
            return false;
        }
        if (document.getElementById("Phone2").value == "") {
            window.alert("휴대폰 번호를 선택하시요.");
            return false;
        }
        if (document.getElementById("Phone2").value == "") {
            window.alert("휴대폰 번호를 선택하세요.");
            return false;
        }
        if (document.getElementById("Phone3").value.length != 4) {
            window.alert("가운데 번호는 4자리로 입력하세요");
        }
    }

</script>
<body>
<%@ include file="menu.jsp" %>
<img src="images/logo.png" style="width:30%; margin:5% 0% 5% 35% ;">

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
			<td class="cart_td cart"><a href="./product.jsp?id=<%=product.getProductId()%>"><img src="<%=product.getImage()%>" style="width:100px;height:120px;"></a></td>
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
<tr><td style="height:15px; border-top:1px solid white;"></td></tr>
		<tr >
			<td class="cart_delivery_index">성함 <a style="color:red;">*</a></td>
			<td class="cart_delivery_td "><input type="text" id="Name" size="40" value="<%=list.getUserName() %>" placeholder="<%=list.getUserName() %>"></td>
			<td class="cart_delivery_td cart_delivery_index"></td>		
			<td class="cart_delivery_td cart_delivery_index"></td>

		</tr>
		<tr>
			<td class="cart_delivery_index">이메일 <a style="color:red;">*</a></td>
			<td class="cart_delivery_td"> <input type="text" id="Email" size="40" value="<%=list.getUserEmail() %>" placeholder="<%=list.getUserEmail() %>">  </td>
			<td class="cart_delivery_td cart_delivery_index"></td>		
			<td class="cart_delivery_td cart_delivery_index"></td>

		</tr>		
		<tr>
			<td class="cart_delivery_index">배송지 <a style="color:red;">*</a></td>
			<td class="cart_delivery_td">  <input type="text" name="zipcode" size="8" id="postcode" placeholder="우편번호"> <input type="button" class="btn btn-primary btn-sm" value="우편번호찾기" onclick="execDaumPostcode()">
			<td></td>
			<td></td>
		<tr>		
			<td></td>
			<td class="cart_delivery_td "> 	<input type="text" name="Address1" size="40" id="Address1" placeholder="주소"></td>
   			<td class="cart_delivery_td"> <input type="text" name="Address2" size="40" id="Address2" placeholder="상세주소"></td>
   			<td></td>
   		</tr>
		<tr>		
			<td class="cart_delivery_index">연락처 <a style="color:red;">*</a></td>
			<td class="cart_delivery_td">
			<select id="Phone1">
			    <option value="">  선택  </option>
			    <option value="011">011</option>
			    <option value="016">016</option>
			    <option value="017">017</option>
			    <option value="019">019</option>
			    <option value="010">010</option>
			</select>
			<input type="tel" name="Phone2" size="4" maxlength="4" max="9999" id="Phone2" placeholder="1234" onkeypress="onlyNumber();"> - <input type="tel" name="Phone3" size="4" id="Phone3" maxlength="4" placeholder="5678" onkeypress="onlyNumber();"> </td>
   			<td class="cart_delivery_td"></td>
   			<td></td>
   		</tr>
		<tr>		
			<td class="cart_delivery_index">배송시 요청사항</td>
			<td class="cart_delivery_td "> 	<input type="text" name="text" size="40" id="text" placeholder="배송시 요청사항을 입력하세요"></td>
   			<td class="cart_delivery_td"></td>
   			<td></td>
   		</tr>
   		   				
</table>
<div style="text-align:right; margin-right:100px;">

<input type="button" value="가입" onclick="CheckForm();" />
<p><button class="btn btn-info" onclick="CheckForm();">구매하기 &raquo;</button> <a	href="item.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
</div>
<br>
</body>
<%@ include file="footer.jsp"%>
</html>