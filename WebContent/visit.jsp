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
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBDfuWo-U9wAH82s_wyvWViH7oZIO53usI&callback=initMap"
type="text/javascript"></script>
<script src="js/local.js"></script>

<meta name='viewport' content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/custom.css">
<link rel="stylesheet" href="css/needpopup.css">
<link rel="stylesheet" href="css/map.css">



<style>
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
.visit_active{
	font-weight:bold;
	font-size:20px;
	text-decoration: underline;
}
</style>

        

<title>BLANC. 브랜딩 위치</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	
	<!-- 본점 --> 
		<div class="jumbotron">
			<div class="container">
				<span style="font-size: 7vh;"><u>Seoul Blanc .</u><br> </span> 
					<p>
						<div style="font-size: 2vh; line-height: 1.5;"> 
						서울 합정동 당인리 화력발전소 옆 오래된 신발공장은 블랑의 시작점입니다.<br>
						우리는 이 공간을 보존하며 커피로 채워내는 것에 집중했습니다. 내부의 조도를 낮추고 시간의 명암을 만들었고,<br>
						실험적 경험을 통해 커피에 대한 태도를 확립할 수 있었습니다. 시작점은 어떤 시간이든 내제해내는 힘이 있다고 생각합니다.<br>
						다양한 변화를 통해 계속 지켜나가고 있는 중이며, 블랑의 모든 시간을 담은 가장 검고 흰 부분이라고 할 수 있는 ‘첫’ 공간입니다.<br>
						<br>
							<div style="font-size:1.6vh; line-height: 2;">
								블랑 서울본점.<br>

								서울시 용산구 이태원로 240 1층 – 3층    T. 02-797-7508<br>
	
								월 - 목 09:00 - 22:00 / 금 09:00 - 23:00 / 토,일 10:00 - 23:00<br>
							</div>
						</div>
					
					<a class = "btn btn-primary btn-pull" href="#" data-needpopup-show="#big-popup" role="button" style="margin-top:20px; color: #fff;"> 위치 </a><br><br>
						<div id='big-popup' class="needpopup">
						
    						<div id="map_canvas_01" class="itemimg2" ></div><br><br><br>
                            <div id="page-wrap">		   
                                    <ul id="locations">
                            		<li data-geo-lat="37.497891" data-geo-long="127.028575">             
	                                </li>
	                                </ul> 
	                             
                                    <h2 class="state"> ● 블랑커피 강남점(본점)</h2><br>
                                    <p class="state2">서울특별시 강남구 역삼동 강남대로 390 <br>Tel : 02-567-1234</p><br>
									<div class="state3"> 
									서울 합정동 당인리 화력발전소 옆 오래된 신발공장은 블랑의 시작점입니다.<br>
									우리는 이 공간을 보존하며 커피로 채워내는 것에 집중했습니다. 내부의 조도를 낮추고 시간의 명암을 만들었고,<br>
									실험적 경험을 통해 커피에 대한 태도를 확립할 수 있었습니다. 시작점은 어떤 시간이든 내제해내는 힘이 있다고 생각합니다.<br>
									다양한 변화를 통해 계속 지켜나가고 있는 중이며, 블랑의 모든 시간을 담은 가장 검고 흰 부분이라고 할 수 있는 ‘첫’ 공간입니다.<br>
									<br>
										<div class="state4">
										블랑 서울본점.<br>
		
										서울시 용산구 이태원로 240 1층 – 3층    T. 02-797-7508<br>
			
										월 - 목 09:00 - 22:00 / 금 09:00 - 23:00 / 토,일 10:00 - 23:00<br>
										</div>
									</div>	
                           </div>
						
						</div>
					
			</div>
		</div>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators" >
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner"> <!-- .carousel-inner > .item > a > img -->
				<div class="item active" style="background-color: #fff;">
					<img class="main_item" src="images/local_img/seoul_01.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/seoul_02.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/seoul_03.jpeg">
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#myCarousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>			
		</div>
		<br><br><br><br>
		
<!-- 상지점 --> 		
		<div class="jumbotron">
			<div class="container">
				<span style="font-size: 7vh;"><u>Hannam Blanc .</u><br> </span> 
					<p>
						<div style="font-size: 2vh; line-height: 1.5;"> 
						서울 한남동에 위치한 이 장소는 처음부터 우리의 공간으로 만들겠다는 확신이 있었습니다. <br>
						오래된 건물의 큰 창을 모두 열 수 있게 만들어 그것을 하나의 통로로 만들었습니다. <br>
						이곳을 통해 듣는 음악 그리고 커피의 맛과 향 모두 또 다른 문화를 만들어낼 수 있습니다. 우리는 비현실적 새로운 방향을 모색하며, <br>
						그것을 커피로 어떻게 전달할 지를 고민하고 변화를 추구합니다. 지역적 특색을 고려하여 짧고 강렬한 시간을 담아내는 블랑의 가장 실험적인 공간입니다.<br>
						<br><br>
							<div style="font-size:1.6vh; line-height: 2;">
								블랑 한남점.<br>

								서울시 용산구 이태원로 240 1층 – 3층    T. 02-797-7508<br>
	
								월 - 목 09:00 - 22:00 / 금 09:00 - 23:00 / 토,일 10:00 - 23:00<br>
							</div>
						</div>
					<a class = "btn btn-primary btn-pull" href="#" data-needpopup-show="#hannam"  role="button" style="margin-top:20px; color: #fff;"> 위치 </a><br><br>
					
						<div id='hannam' class="needpopup">
						
    						<div id="map_canvas_02" class="itemimg2" ></div></br>
                            <div id="page-wrap">		   
                                    <ul id="locations">
                            		<li data-geo-lat="37.53613134083442" data-geo-long="127.00018034179216">  
	                                </li>
	                                </ul> 
                                    <h2 class="state"> ● 블랑커피 한남점 </h2>
                                    <p class="state2">서울시 용산구 이태원로 240 <br>Tel : 02-797-7508</p><br>
									<div class="state3"> 
									서울 합정동 당인리 화력발전소 옆 오래된 신발공장은 블랑의 시작점입니다.<br>
									우리는 이 공간을 보존하며 커피로 채워내는 것에 집중했습니다. 내부의 조도를 낮추고 시간의 명암을 만들었고,<br>
									실험적 경험을 통해 커피에 대한 태도를 확립할 수 있었습니다. 시작점은 어떤 시간이든 내제해내는 힘이 있다고 생각합니다.<br>
									다양한 변화를 통해 계속 지켜나가고 있는 중이며, 블랑의 모든 시간을 담은 가장 검고 흰 부분이라고 할 수 있는 ‘첫’ 공간입니다.<br>
									<br>
										<div class="state4">
										블랑 서울본점.<br>
		
										서울시 용산구 이태원로 240 1층 – 3층    T. 02-797-7508<br>
			
										월 - 목 09:00 - 22:00 / 금 09:00 - 23:00 / 토,일 10:00 - 23:00<br>
										</div>
									</div>	
                           </div>
						
						</div>					
					
			</div>
		</div>
		
		<div id="hannam_img" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators" >
				<li data-target="#hannam_img" data-slide-to="0" class="active"></li>
				<li data-target="#hannam_img" data-slide-to="1"></li>
				<li data-target="#hannam_img" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner"> <!-- .carousel-inner > .item > a > img -->
				<div class="item active" style="background-color: #fff;">
					<img class="main_item" src="images/local_img/hannam_01.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/hannam_02.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/hannam_03.jpeg">
				</div>
			</div>
			<a class="left carousel-control" href="#hannam_img" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#hannam_img" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>			
		</div>
		<br><br><br><br>
<!-- 상지점 --> 	
		
		<div class="jumbotron">
			<div class="container">
				<span style="font-size: 7vh;"><u>Sangji Blanc. </u><br> </span> 
					<p>
						<div style="font-size: 2vh; line-height: 1.5;"> 
						강원도 상지대에 위치한 이 장소는 처음부터 우리의 공간으로 만들겠다는 확신이 있었습니다. 오래된 건물의 큰 창을 모두 열 수 있게 만들어 그것을 하나의 통로로 만들었습니다. 
						이곳을 통해 듣는 음악 그리고 커피의 맛과 향 모두 또 다른 문화를 만들어낼 수 있습니다. 우리는 비현실적 새로운 방향을 모색하며, 
						그것을 커피로 어떻게 전달할 지를 고민하고 변화를 추구합니다. 지역적 특색을 고려하여 짧고 강렬한 시간을 담아내는 블랑의 가장 실험적인 공간입니다.
						<br><br>
							<div style="font-size:1.6vh; line-height: 2;">
								블랑 상지점.<br>

								강원도 원주시 우산동 상지대 민주관 1층 – 3층    T. 033-797-7508<br>
	
								월 - 목 09:00 - 22:00 / 금 09:00 - 23:00 / 토,일 10:00 - 23:00<br>
							</div>
						</div>

					<a class = "btn btn-primary btn-pull" href="#" data-needpopup-show="#sangji"  role="button" style="margin-top:20px; color: #fff;"> 위치 </a><br><br>
						<div id='sangji' class="needpopup">
						
    						<div id="map_canvas_03" class="itemimg2" ></div></br>
                            <div id="page-wrap">		   
                                    <ul id="locations">
                            		<li data-geo-lat="37.370350" data-geo-long="127.928746">            
	                                </li>
	                                </ul>                            
                                    <h2 class="state"> ● 블랑커피 상지점</h2>
                                    <p class="state2">강원도 원주시 우산동 상지대길 민주관 <br>Tel : 033-730-0480</p><br>

									<div class="state3"> 
									강원도 상지대에 위치한 이 장소는 처음부터 우리의 공간으로 만들겠다는 확신이 있었습니다. 오래된 건물의 큰 창을 모두 열 수 있게 만들어 그것을 하나의 통로로 만들었습니다. 
									이곳을 통해 듣는 음악 그리고 커피의 맛과 향 모두 또 다른 문화를 만들어낼 수 있습니다. 우리는 비현실적 새로운 방향을 모색하며, 
									그것을 커피로 어떻게 전달할 지를 고민하고 변화를 추구합니다. 지역적 특색을 고려하여 짧고 강렬한 시간을 담아내는 블랑의 가장 실험적인 공간입니다.
									<br>
										<div class="state4">
										블랑 상지대점.<br>
		
										강원도 원주시 우산동 상지대길 민주관    T. 033-730-0480<br>
			
										월 - 목 09:00 - 22:00 / 금 09:00 - 23:00 / 토,일 10:00 - 23:00<br>
										</div>
									</div>	
                           </div>
						
						</div>			
			</div>
		</div>
		<div id="sangji_img" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators" >
				<li data-target="#sangji_img" data-slide-to="0" class="active"></li>
				<li data-target="#sangji_img" data-slide-to="1"></li>
				<li data-target="#sangji_img" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner"> <!-- .carousel-inner > .item > a > img -->
				<div class="item active" style="background-color: #fff;">
					<img class="main_item" src="images/local_img/sangji_01.jpeg" >
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/sangji_02.jpeg">
				</div>
				<div class="item">
					<img class="main_item" src="images/local_img/sangji_03.jpeg">
				</div>
			</div>
			<a class="left carousel-control" href="#sangji_img" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
			</a>
			<a class="right carousel-control" href="#sangji_img" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
			</a>			
		</div>
		
		
	<br><br><br><br>				

	<script>  
		needPopup.config.custom = {
			'removerPlace': 'outside',
			'closeOnOutside': false,
			onShow: function() {
				console.log('needPopup is shown');
			},
			onHide: function() {
				console.log('needPopup is hidden');
			}
		};
		needPopup.init();
	</script>
	
	<div class="footer">
	<%@ include file="footer.jsp"%>
	</div>
</body>
</html>