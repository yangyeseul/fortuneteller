<%@page import="com.ootd.OotdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%
request.setCharacterEncoding("UTF-8");

String loginID = (String) session.getAttribute("loginID");
OotdDAO ootdDAO = OotdDAO.getInstance();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/ootd/css/style_ootd.css?ver=1.3">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fortuneteller/ootd/script.js"></script>
</head>
<body>
	<div class="ootd_text">
		깜박사가 알려주는 <span>오늘의 행운룩</span>
	</div>
	
	<div class="test_wrap">
		<div class="test_question">
			<div class="test_img">
				<img src="/fortuneteller/ootd/img/right_bubble_image.png">
			</div>
			<div class="test_text">
				<div class="test_text_name">깜박사</div>
				<div class="typing-txt"> 
					<ul>
				    	<li>안녕 난 타로 테스트를 봐 주는 깜박사야&#128054;</li>
				    	<li>오늘의 행운을 높여주는 행운룩을 골라줄게</li>
				    	<li>한 번 해 볼래?</li>
					</ul>
				</div> 
				<div class="typing">
			    	<ul>
			    		<li></li>
			    		<li></li>
			    		<li></li>
			    	</ul>
				</div> 
			</div>
		</div>
		
		<div class="test_answer">
			<input type="button" value="응" onclick="document.location.href='/fortuneteller/index.jsp?page=ootdMain.jsp?answer=yes'">
			&nbsp;&nbsp;
			<input type="button" value="아니" onclick="document.location.href='/fortuneteller/index.jsp?page=ootdMain.jsp?answer=no'">
		</div>
	</div>
	
	<script type="text/javascript">
	/* 딜레이 후 버튼 생성 */
	setTimeout(function(){
	  document.querySelector('.test_answer').style.display = "block";
	}, 4500);
	</script>
</body>
</html>