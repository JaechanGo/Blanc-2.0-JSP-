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
<%

	String amount = request.getParameter("amount");
	Integer Qnt = Integer.parseInt(amount);
	String goodsCode = request.getParameter("goodsCode");	// 선택되어진 코드값 객체에 저장
	String username = (String)session.getAttribute("id");		// 세션 유저 정보 가져오기
	Product productDao = new Product();		// 어레이 리스트 사용할 객체 생성
	ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	
	// GoodsDAO 클래스의 값 중에서 이전에 선택되어진 값만 goods객체에 가지고 있기
	Product product = new Product();
	for(int i = 0; i < listOfProducts.size(); i++){	
		product =  listOfProducts.get(i);
		if(product.getProductId().equals(goodsCode)){  // 기존에 선택된 상품이면 빠져나가기
			break;
		}
	}
	
	// 선택한 상품 넣을 리스트 초기화 한번하기
	ArrayList<Product> list_Pr = (ArrayList<Product>)session.getAttribute("cartlist");	
	if(list_Pr == null) {		// 데이터가 없으면 객체 생성 / 데이터가 있으면 객체 생성안한다.
		list_Pr = new ArrayList<Product>();
		session.setAttribute("cartlist",list_Pr);
	}
	
	// 선택한 상품이 중복이면 수량 증가시키기
	int cnt=0;
	Product productQnt = new Product();
	for(int i = 0; i < list_Pr.size(); i++){	
		productQnt =  list_Pr.get(i);
		if(productQnt.getProductId().equals(goodsCode)){ 
			cnt++ ;
			int orderQnt = productQnt.getOrderQnt()+Qnt;
			product.setOrderQnt(orderQnt);
		}
	}
	if(cnt == 0){  // 선택한 상품이 중복이 아니닌 처음이면 처음한번만 리스트값 생성
		product.setOrderQnt(Qnt);
		list_Pr.add(product);
	}
	
	
%>    
<html>
<head>
<title>cart add</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%
	UserDAO userDAO = new UserDAO();
	User list = userDAO.getUserDATA(userID);
	%>
	
      		<div class="left_area" >
					<br><br><img src="<%=product.getImage()%>" class="itemimg_product pro pro_cart" >	
			</div>		
<div class="container">
	<div class="row">
	<div class="right_area pro_text">
		<div class="col-md-6 pro_cart_text">
		
<%= list.getUserName() %> 님 안녕하세요!! <br>   <!--  선택되어진 이름 -->
추가된 상품은 다음과 같습니다.<br>
<hr class ="hr_cart">
<%=product.getProductId() %><br>	<!--  선택되어진 코드 출력 -->
<%=product.getPname() %><br>	<!--  선택되어진 상품명 출력 -->
총 : <fmt:formatNumber value="<%=product.getUnitPrice() * product.getOrderQnt() %>" pattern="#,###"/> 원 (1개 : <fmt:formatNumber value="<%=product.getUnitPrice()%>" pattern="#,###"/>원)<br>	<!--  선택되어진 상품가격 출력 -->
<%=product.getOrderQnt() %> 개<br>

<p><a href="add.jsp" class="btn btn-secondary"><button class="btn btn-info" style="background-color:#666666; border-color:#666666; margin-left:-10px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매하기&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;            &raquo;</button></a> 
<p><a href="cart_list.jsp" ><button class="btn btn-info" style=" margin-left:2px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;장바구니 확인 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &raquo;</button></a><a	href="item.jsp" class="btn btn-secondary"><button class="btn btn-info" style=" margin-left:-5px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 상품 목록 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &raquo;</button></a><input type="text" value="" name="goodsCode" style="display:none;'"/></form>
			</div>
				</div>
		</div>
</body>
	<div class="footer footer_cart">
	<%@ include file="footer.jsp"%>
	</div>
</html>