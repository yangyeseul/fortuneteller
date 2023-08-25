<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="css/style_index.css">
</head>
<body>
	<div class="main_text">
		<span>포츈텔러</span>의 <span>다양한 테스트</span>를<br>직접 이용해 보세요!
	</div>
	
	<ul class="main_slide_hashtag">
		<li><a href="/fortuneteller/index.jsp?page=ootdTest.jsp">#오늘의행운룩</a></li>
		<li><a href="#">#수정구슬</a></li>
		<li><a href="#">#별자리운세</a></li>
		<li><a href="#">#띠별운세</a></li>
	</ul>
			
	<div class="main_wrap">
		<div class="main_content">
			<div class="main_slide">
				<a href="/fortuneteller/index.jsp?page=ootdTest.jsp"><img src="/fortuneteller/img/slide01.png"></a>
			</div>

			<div class="main_slide">
				<a href="#"><img src="/fortuneteller/img/slide02.png"></a>
			</div>
			
			<div class="main_slide">
				<a href="/fortuneteller/index.jsp?page=constellationMain.jsp"><img src="/fortuneteller/constellation/constellationImg/constellationMainImage.png"></a>
			</div>
			
			<div class="main_slide">
				<a href="#"><img src="/fortuneteller/img/slide04.png"></a>
			</div>
		</div>
		
		<a href="#" class="prevArrow"><img src="/fortuneteller/img/left.png"></a>
		<a href="#" class="nextArrow"><img src="/fortuneteller/img/right.png"></a>
	</div>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.js"></script>
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
		$(document).ready(function(){
		
			// 옵션 사용하지 않을 경우
			// $('.single-item').slick();
		
			// 옵션 사용할 경우
			$('.main_content').slick({
				// 옵션 삽입
				autoplay : true,
				autoplaySpeed : 3000,
				// 지정한 클래스에 맞게 값을 지정한다.
				prevArrow : $('.prevArrow'), 
				nextArrow : $('.nextArrow'), 
			});
		  
		});
	</script>
</body>
</html>