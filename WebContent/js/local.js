
        $(function() {
            var Seoul = new google.maps.LatLng(37.3701947,127.928151),  //첫 실행됐을때 위치
                pointToMoveTo, 
                first = true,
                curMarker = new google.maps.Marker({}),
                $el;
                
                var myOptions = {
                    zoom: 17,  //1~20  (숫자가 클수록 zommin)
                    center: Seoul,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
        
        var map = new google.maps.Map($("#map_canvas_01")[0], myOptions);
        
        $("#locations li").mouseenter(function() {
            $el = $(this);
            if (!$el.hasClass("hover")) {
                $("#locations li").removeClass("hover");
                $el.addClass("hover");
        
                if (!first) { 
                    curMarker.setMap(); 
                }
        
                pointToMoveTo = new google.maps.LatLng($el.attr("data-geo-lat"), $el.attr("data-geo-long"));
                map.panTo(pointToMoveTo);
        
                curMarker = new google.maps.Marker({
                position: pointToMoveTo,
                map: map,
                    icon: "images/marker.png"  //마커 이미지 경로
                });
        
        
                google.maps.event.addListener(curMarker, 'click', function() {
                    map.setZoom(14);
                });
            }
        });
        
        $("#locations li:first").trigger("mouseenter");
        });
 
 
        $(function() {
            var Hannam = new google.maps.LatLng(37.5362249,127.0001052),  //첫 실행됐을때 위치
                pointToMoveTo, 
                first = true,
                curMarker = new google.maps.Marker({}),
                $el;
                
                var myOptions_H = {
                    zoom: 17,  //1~20  (숫자가 클수록 zommin)
                    center: Hannam,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
        
        var map = new google.maps.Map($("#map_canvas_02")[0], myOptions_H);
        
        $("#locations li").mouseenter(function() {
            $el = $(this);
            if (!$el.hasClass("hover")) {
                $("#locations li").removeClass("hover");
                $el.addClass("hover");
        
                if (!first) { 
                    curMarker.setMap(); 
                }
        
                pointToMoveTo = new google.maps.LatLng($el.attr("data-geo-lat"), $el.attr("data-geo-long"));
                map.panTo(pointToMoveTo);
        
                curMarker = new google.maps.Marker({
                position: pointToMoveTo,
                map: map,
                    icon: "images/marker.png"  //마커 이미지 경로
                });
        
        
                google.maps.event.addListener(curMarker, 'click', function() {
                    map.setZoom(14);
                });
            }
        });
        
        $("#locations li:first").trigger("mouseenter");
        });       


        $(function() {  
            var Sangji = new google.maps.LatLng(37.370350,127.928746),  //첫 실행됐을때 위치
                pointToMoveTo, 
                first = true,
                curMarker = new google.maps.Marker({}),
                $el;
                
                var myOptions_S = {
                    zoom: 17,  //1~20  (숫자가 클수록 zommin)
                    center: Sangji,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
        
        var map = new google.maps.Map($("#map_canvas_03")[0], myOptions_S);
        
        $("#locations li").mouseenter(function() {
            $el = $(this);
            if (!$el.hasClass("hover")) {
                $("#locations li").removeClass("hover");
                $el.addClass("hover");
        
                if (!first) { 
                    curMarker.setMap(); 
                }
        
                pointToMoveTo = new google.maps.LatLng($el.attr("data-geo-lat"), $el.attr("data-geo-long"));
                map.panTo(pointToMoveTo);
        
                curMarker = new google.maps.Marker({
                position: pointToMoveTo,
                map: map,
                    icon: "images/marker.png"  //마커 이미지 경로
                });
        
        
                google.maps.event.addListener(curMarker, 'click', function() {
                    map.setZoom(14);
                });
            }
        });
        
        $("#locations li:first").trigger("mouseenter");
        });
        
function drawInit() {
	var x = 0, c=0;
	canvasContext.clearRect(0,0,width,height);
		var barWidth = (width/1024)*2.5;
		var barHeight = height/4;
		for (var i =0; i < 1024; i++) {
			canvasContext.fillStyle = 'hsla(' + ((i/2) + Math.floor(c)) + ', ' + 100 + '%,' + 60 + '%,' + (0.5 + barHeight / 512) + ')';
		canvasContext.fillRect(x, (height/2)-(barHeight/2), barWidth,barHeight/2);
		canvasContext.fillStyle = 'hsla(' + ((i/2) + Math.ceil(c)) + ', ' + 80 + '%,' + 60 + '%,' + (0.2)+ ')';
		canvasContext.fillRect(x, (height/2) + (barHeight/2)+5, barWidth, -barHeight/2);
		canvasContext.fill();

		x += barWidth + 1;

		c += 0.5;
		}
}

drawInit();


