<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="product.Product"%>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="session" />       
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
<script src="js/Address_location.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>BLANC. 결제화면</title>

</head>
<style>
.product_active {
	font-weight: bold;
	font-size: 20px;
	text-decoration: underline;
}

input {
	height: 25px;
	margin: 0px;
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

.needpopup p+p {
	margin-top: 10px;
}

.layer1 {
	display: none;
}

.layer2 {
	display: none;
}

.layer3 {
	display: none;
}

.layer4 {
	display: none;
}
}
</style>
<!-- 입력란 빈공간일 경우 오류메시지 팝업창 띄움 -->
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
        if (document.getElementById("Address2").value == "") {
            window.alert("상세주소를 입력하세요.");
            return false;
        }
        if (document.getElementById("Phone1").value == "") {
            window.alert("휴대폰 번호를 선택하시요.");
            return false;
        }
        if (document.getElementById("Phone2").value == "") {
            window.alert("휴대폰 번호를 선택하세요.");
            return false;
        }
        if (document.getElementById("Phone3").value.length != 4) {
            window.alert("가운데 번호는 4자리로 입력하세요");
            return false;
        }
        if (document.getElementById("pay").value === undefined) {
            window.alert("결제 방법을 선택하세요");
            return false;
        }
        return true;
        

    }

</script>
<!-- 결제 선택시 레이어 변경 -->
<script type="text/javascript">
//<!--
    function viewDiv(idx)
    {
        if(idx == 1)
        {
            $(".layer1").css("display","block");
            $(".layer2").css("display","none");
            $(".layer3").css("display","none");
            $(".layer4").css("display","none");
            document.getElementById("pay").value="card";
        }
        else if(idx == 2)
        {
            $(".layer1").css("display","none");
            $(".layer2").css("display","block");
            $(".layer3").css("display","none");
            $(".layer4").css("display","none");
            document.getElementById("pay").value="bankbook";
        }
        else if(idx == 3)
        {
            $(".layer1").css("display","none");
            $(".layer2").css("display","none");
            $(".layer3").css("display","block");
            $(".layer4").css("display","none");
            document.getElementById("pay").value="phone";
        }
        else if(idx == 4)
        {
            $(".layer1").css("display","none");
            $(".layer2").css("display","none");
            $(".layer3").css("display","none");
            $(".layer4").css("display","block");
            document.getElementById("pay").value="pay";
        }
    }
//-->
</script>
<!-- 결제 선택시 border 변경 -->
<script>

	$(function() {
		$("img").click(function() {
			$("img").css("border", "none");
			$(this).css("border", "3px solid blue");
		});
	});
</script>
<body>
<%@ include file="menu.jsp" %>
<%
		request.setCharacterEncoding("UTF-8");

		// 파라미터 정보 가져오기


		/* userID varchar(20),
		userEmail varchar(100),
		userPhone varchar(15),
		itemuser_ID varchar(20),
		itemAdress varchar(70),
		itemPhone varchar(15),
		itemMessage varchar(40),
		pay varchar(10) */


		// JDBC 참조 변수 준비
		Connection con = null; 
		PreparedStatement pstmt = null; 
		String url = "jdbc:mysql://localhost:3306/BLANC?useUnicode=true&characterEncoding=utf8";
		String user = "root", pw = "root";

		// 1) JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");

		// 2) DB연결(DB url, DB id, DB pw)
		con = DriverManager.getConnection(url, user, pw);
		
		String sqldelcart = "DELETE FROM cart WHERE userID = (?)";
		pstmt = con.prepareStatement(sqldelcart);
		pstmt.setString(1, userID);
		pstmt.executeUpdate();
		
		
%>
<img src="images/logo.png" style="width:30%; margin:5% 0% 5% 35% ;">

<% 
	int [] sum ={0,0,0}; //상품 총가격 
	int sumPrice=0;
	char [] productName={};
%>
	<table class="cart cart_table" id="product"
		style="border-left: none; border-right: none;">
		<tr>
			<th class="cart">상품이미지</th>
			<th class="cart">상품명</th>
			<th class="cart cart_qnt">개수</th>
			<th class="cart">총가격</th>
		</tr>
		<%
		// 리스트값이 하나도 없으면 상품없다고 리턴
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
		if (cartList == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('선택한 상품이 없습니다.!!!')");
			script.println("history.back()");
			script.println("</script>");
		} else
			for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
				Product product = cartList.get(i);
				sum[i] = product.getUnitPrice() * product.getOrderQnt(); //총금액 증가 
				sumPrice = sum[0] + sum[1] + sum[2];
				
		%>
		<!-- 상품 -->


		<tr>
			<td class="cart_td cart"><a
				href="./product.jsp?id=<%=product.getProductId()%>"><img
					src="<%=product.getImage()%>" style="width: 100px; height: 120px;"></a></td>
			<td class="cart_td cart" id="productName"><%=product.getPname() %></td>
			<!--<fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/> 원 -->
			<td class="cart_td cart" style="margin-top: 5px; margin-bottom: 5px;">상품
				주문 수량 : <%=product.getOrderQnt()%> <%// 상품 수량%> 개
				<hr>
				<br> 1 개당 : &nbsp;<fmt:formatNumber
					value="<%=product.getUnitPrice()%>" pattern="#,###" /> 원
			</td>
			<td class="cart_td cart">총 가격 : <fmt:formatNumber
					value="<%=product.getUnitPrice() * product.getOrderQnt()%>"
					pattern="#,###" /> 원
			</td>

		</tr>

		<!-- 장바구니 데이터베이스 추가 -->
		<%
		request.setCharacterEncoding("UTF-8");

		// 파라미터 정보 가져오기


		/* userID varchar(20),
		userEmail varchar(100),
		userPhone varchar(15),
		itemuser_ID varchar(20),
		itemAdress varchar(70),
		itemPhone varchar(15),
		itemMessage varchar(40),
		pay varchar(10) */


		// JDBC 참조 변수 준비

		// 1) JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");

		// 2) DB연결(DB url, DB id, DB pw)
		con = DriverManager.getConnection(url, user, pw);		
		
		
		String sql = "INSERT INTO cart VALUES (?, ?, ?, ?, ?)";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userID);
		pstmt.setString(2, product.getProductId());
		pstmt.setString(3, product.getPname());
		pstmt.setInt(4, product.getOrderQnt());
		pstmt.setInt(5, product.getUnitPrice() * product.getOrderQnt());


		pstmt.executeUpdate();

		pstmt.close();
		con.close();
		}
		%>
	</table>
	<br>
	<table class="cart cart_table">
		<tr>
			<td class="cart_td cart" style="text-align: right;"><div>
					<dl>
						<dt style="margin-right: 6px;">상품가격</dt>
						<dt style="font-size: 19px;">
							<fmt:formatNumber value="<%=sumPrice%>" pattern="#,###" /> 원
						</dt>
					</dl>
				</div></td>
			<td class="cart_td cart" style="text-align: center;">+</td>
			<td class="cart_td cart" style="text-align: center;"><dl>
					<dt>배송비</dt>
					<dt style="font-size: 19px;">2,500원</dt>
				</dl></td>
			<td class="cart_td cart" style="text-align: center;">-</td>
			<td class="cart_td cart" style="text-align: left;"><dl>
					<dt style="margin-left: 3px;">할인금액</dt>
					<dt style="color: red; font-size: 19px;">3,000원</dt>
				</dl></td>
			<td class="cart_td cart" style="text-align: right; font-size: 40px;">
				=</td>
			<td class="cart_td cart" style="text-align: center; font-size: 25px;">총
				가격 : <fmt:formatNumber value="<%= sumPrice+2500-3000 %>"
					pattern="#,###" />원
			</td>
		</tr>
	</table>
	<br>
		<div style="text-align: right; margin-right: 100px;">
			<p>
				<br>
				<a href="payment.jsp"><button type="submit" class="btn btn-info">구매하기 &raquo;</button></a>
	</form>
	<a href="item.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
	</div>
	<br>
		<div class="footer">
	<%@ include file="footer.jsp"%>
	</div>
</body>

</html>