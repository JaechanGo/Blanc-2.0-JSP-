<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/join.css">
<link rel="stylesheet" href="css/custom.css">
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content="width=device-width", initial-scale="1">

<title>BLANC. </title>
</head>
<body>
<%@ include file="menu.jsp"%>

<section class="container">
		    <article class="half">
			        <h1>BLANC.</h1>
			        <div class="tabs">
				            <span class="tab signin active"><a href="#signin">Sign in</a></span>
				            <span class="tab signup"><a href="#signup">Sign up</a></span>
			        </div>
			        
			        <div class="content">
				            <div class="signin-cont cont">
					                <form action="loginAction.jsp" method="post">
						                    <input type="text" name="userID" class="inpt" required="required" placeholder="Your ID">
						                    <label for="userID">Your ID</label>
						                    <input type="password" name="userPassword" class="inpt" required="required" placeholder="Your password">
                						    <label for="password">Your password</label>
						                    <input type="checkbox" id="remember" class="checkbox" checked>
						                    <label for="remember">Remember me</label>
						                    <div class="submit-wrap">
						                	<input type="submit" value="Sign in" class="submit">
					                       	<a href="#" class="more">Forgot your password?</a>
						                    </div>
        					        </form>
    				        </div>
    				        <div class="signup-cont cont">
                					<form action="joinAction.jsp" method="post">
                					
						                    <input type="text" name="userName" class="inpt" required="required" placeholder="Your name">
						                    <label for="name">Your name</label>
						                    
                    						<input type="text" name="userID" class="inpt" required="required" placeholder="Your ID">
                    						<label for="userID">Your ID</label>
                    						
						                    <input type="password" name="userPassword" class="inpt" required="required" placeholder="Your password">
						                    <label for="password">Your password</label>
						                    
                						    <input type="email" name="userEmail" class="inpt" required="required" placeholder="Your email">
                						    <label for="email">Your email</label>
                						    
						                    <div class="submit-wrap">
							                        <input type="submit" value="Sign up" class="submit">
							                        <a href="#" class="more">Terms and conditions</a>
						                    </div>
        					        </form>
            				</div>
			        </div>
		    </article>
		    <div class="half bg"></div>
	</section>
	<br><br><br><br><br><br><br><br><br><br>
<div class="footer">
	<%@ include file="footer.jsp"%>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">
$('.tabs .tab').click(function(){
    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signin-cont').show();
    } 
    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        $('.signup-cont').show();
    }
});
$('.container .bg').mousemove(function(e){
    var amountMovedX = (e.pageX * -1 / 30);
    var amountMovedY = (e.pageY * -1 / 9);
    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');
});
</script>

</html>