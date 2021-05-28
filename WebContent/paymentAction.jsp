<!-- insertPro.jsp -->
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="product.Product"%>
<jsp:useBean id="productDAO" class="product.ProductDAO" scope="session" />
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제</title>
</head>
<body>
<%
// POST 방식의 한글처리
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

int [] sum ={0,0,0}; //상품 총가격 
int sumPrice=0;
char [] productName={};

String userID = request.getParameter("userID");
String userEmail = request.getParameter("Email");
String userPhone = request.getParameter("Phone1") + "-" + request.getParameter("Phone2") + "-" + request.getParameter("Phone3");
String itemuser_ID = request.getParameter("Name2");
String itemAdress = request.getParameter("zipcode") + " / " + request.getParameter("Address1") + " / " + request.getParameter("Address2");
String itemPhone = request.getParameter("itemPhone1") + "-" + request.getParameter("itemPhone2") + "-" + request.getParameter("itemPhone3");
String itemMessage = request.getParameter("itemMessage");
String pay = request.getParameter("pay");


// JDBC 참조 변수 준비
Connection con = null; 
PreparedStatement pstmt = null; 
String url = "jdbc:mysql://localhost:3306/BLANC";
String user = "root", pw = "root";

// 1) JDBC 드라이버 로딩
Class.forName("com.mysql.jdbc.Driver");

// 2) DB연결(DB url, DB id, DB pw)
con = DriverManager.getConnection(url, user, pw);


/* userID varchar(20),
userEmail varchar(100),
userPhone varchar(15),
itemuser_ID varchar(20),
itemAdress varchar(70),
itemPhone varchar(15),
itemMessage varchar(40),
pay varchar(10) */

// 3) SQL문 준비
String sql = "INSERT INTO payment(userID,userEmail,userPhone,itemuser_ID,itemAdress,itemPhone,itemMessage,pay,date,state) VALUES (?, ?, ?, ?, ?, ?, ?, ?,now(), ?)";

pstmt = con.prepareStatement(sql);
pstmt.setString(1, userID);
pstmt.setString(2, userEmail);
pstmt.setString(3, userPhone);
pstmt.setString(4, itemuser_ID);
pstmt.setString(5, itemAdress);
pstmt.setString(6, itemPhone);
pstmt.setString(7, itemMessage);
pstmt.setString(8, pay);
pstmt.setString(9, "배송준비");
pstmt.executeUpdate();

String sqlcart = "INSERT INTO payment_cart SELECT  B.id, A.userID, A.ProductID, A.ProductQnt,  B.userEmail, B.userPhone, B.itemuser_ID, B.itemAdress, B.itemPhone, B.itemMessage, B.date, B.state, B.pay FROM cart A INNER JOIN payment B ON A.userID = B.userID";
pstmt = con.prepareStatement(sqlcart);
pstmt.executeUpdate();

//구매 정보 삭제
String sqldelpayment = "DELETE FROM payment WHERE userID = (?)";
pstmt = con.prepareStatement(sqldelpayment);
pstmt.setString(1, userID);
pstmt.executeUpdate();

//장바구니 삭제
String sqldelcart = "DELETE FROM cart WHERE userID = (?)";
pstmt = con.prepareStatement(sqldelcart);
pstmt.setString(1, userID);
pstmt.executeUpdate();
//4) 실행

// JDBC 자원 닫기
pstmt.close();
con.close();
%>

 
<%
//세션 초기화부분
session.removeAttribute("cartlist");
session.removeAttribute("id");
%>
<script>
alert("구매 성공!");
location.href = 'main.jsp';
</script>

</body>
</html>