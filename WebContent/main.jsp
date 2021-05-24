<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/custom.css">

<style>
.main_active{
  font-weight:bold;
  font-size:20px;
  text-decoration: underline;
}
</style>
<title>BLANC. </title>
</head>
<body>
	<%@ include file="menu.jsp"%>
		<div class="jumbotron">
			<div class="container">
				<span style="font-size: 7vh;"><u>About Blanc</u><br> </span> 
					<p>
						<div style="font-size: 2vh; line-height: 1.5;"> 
					커피의 수확부터 한 잔의 커피에 이르기까지, 수많은 과정을 거칩니다. 커피와 그 한 잔을 즐기는 사람이 전부인
						공간. 블랑은 오직 커피만을 위한 과정에 참여하려 합니다. 매년 직접 산지를 방문하여 생두를 선별하고, 가장 절정의 맛을 담습니다.<br>
						블랑은 프로페셔널 그린빈바이어<em>greenbean buyer</em>, 커퍼<em>cupper</em>, 로스터<em>roaster</em>, 바리스타<em>barista</em>의 퀄리티 컨트롤을 통해 최상의 스페셜티 커피를 제공합니다.<br><br>
						우리는 서로가 만족할 수 있는 커피, 하나의 문화로 남을 수 있는 커피를 제공하기 위해 추출 교육과 퀄리티 컨트롤에 시간을 쏟아냅니다. 각 생두의 잠재적 특성을 끌어내기 위한 최적의 온도, 로스팅 시간, 열량 조절을 찾아내어 프로파일을 구축해냅니다. 
						이 모든 일련의 과정을 통해 블랑 커피 로스터스는 타협하지 않는 품질 관리와 모두가 공감할 수 있는 구체적인 결과물을 만들어 냅니다.<br><br>다양한 실험을 통해 표면적이지 않고, 또 다른 사고의 지점을 건드리는 행위. 
						이는 곧 작은 세계에 대한 표현이자 어떤 커피를 어떻게 내어놓을까라는 가장 원초적인 목표입니다.
						<br>블랑은 매일 커피를 볶아내는 작업이 이루어지며 신선한 커피를 위해 노력합니다. 이러한 우리의 태도는 카페, 레스토랑, 기타 업체 등 어느 곳에서든 체험하실 수 있으며,
						<br>우리는 모두가 함께 즐길 수 있는 한 잔의 커피를 약속합니다.
						</div>
						<p>
					<a class = "btn btn-primary btn-pull" href="item.jsp" role="button" style="margin-top:20px; color: #fff;"> 상품 보기</a></p>
			</div>
		</div>
		
				<div id="mylocal" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators" >
				<li data-target="#mylocal" data-slide-to="0"></li>
				<li data-target="#mylocal" data-slide-to="1"></li>
				<li data-target="#mylocal" data-slide-to="2"></li>
				<li data-target="#mylocal" data-slide-to="3"></li>
				<li data-target="#mylocal" data-slide-to="4"></li>
				<li data-target="#mylocal" data-slide-to="5"></li>
				<li data-target="#mylocal" data-slide-to="6"></li>
				<li data-target="#mylocal" data-slide-to="7" class="active"></li>
				<li data-target="#mylocal" data-slide-to="8"></li>
			</ol>
			<div class="carousel-inner"> <!-- .carousel-inner > .item > a > img -->
				<div class="item" style="background-color: #fff;">
					<img class="main_item" src="images/local_img/sangji_01.jpeg" >
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/sangji_02.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/sangji_03.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/hannam_01.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/hannam_02.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/hannam_03.jpeg">
				</div>
				<div class="item active">
					<img class="main_item" src="images/local_img/seoul_01.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/seoul_02.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/seoul_03.jpeg">
				</div>
			</div>		
		</div>
		<div style="margin:30px 0px 30px 0px;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<!-- .carousel-inner > .item > a > img -->
				<div class="item active" style="background-color: #fff;">
					<a href="product.jsp?id=No.1"><img class="main_item"
						src="images/item1.jpg"></a>
				</div>
				<div class="item">
					<a href="product.jsp?id=No.2"><img class="main_item"
						src="images/item2.jpg"></a>
				</div>
				<div class="item">
					<a href="product.jsp?id=No.3"><img class="main_item"
						src="images/item3.jpg"></a>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span>
			</a>
		</div>
	</div>
	<div class="footer">
	<%@ include file="footer.jsp"%>
	</div>
</body>
</html>