<%@page import="com.ootd.OotdDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
    
<jsp:useBean id="dao" class="com.history.HistoryDAO" />
<jsp:useBean id="vo" class="com.history.InfoVO"> 
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
request.setCharacterEncoding("UTF-8");
int resultNum = Integer.parseInt(request.getParameter("result"));

OotdDAO ootdDAO = OotdDAO.getInstance();

String resultCard = ootdDAO.searchCard(resultNum);
String resultLook = ootdDAO.searchLook(resultNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/ootd/css/style_ootd.css?ver=1.3">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="/fortuneteller/ootd/script.js"></script>
</head>
<body>
	<%
	String loginID = (String) session.getAttribute("loginID");
	System.out.println(loginID);
  	String imgSrc = "/fortuneteller/img/slide01.png";
  	String testName = "오늘의 행운룩";
  	String testPage="/fortuneteller/index.jsp?page=ootd.jsp"; 
  	
	if(loginID == null) {
	%>
	<jsp:include page="/fortuneteller/member/login.jsp" />
		
	<%
	} else {
		vo.setId(loginID);
	  	vo.setRegdate(new Timestamp(System.currentTimeMillis()));
	  	vo.setImage(imgSrc);
	  	vo.setTestName(testName);
	  	vo.setTestPage(testPage);
	  	dao.insertInfo(vo);
	%>
	<div class="ootd_text">
		깜박사가 알려주는 <span>오늘의 행운룩</span>
	</div>
	
	<div class="test_result_wrap" style="height:100%;">
		<div class="test_result">
			<div class="test_tarotcard">
				<img src="/fortuneteller/ootd/img/tarot/<%= resultNum %>.png" alt="">
				<img src="/fortuneteller/ootd/img/result/<%= resultNum %>.png" alt="">
			</div>
			<div class="test_question">
				<div class="test_img">
					<img src="/fortuneteller/ootd/img/right_bubble_image.png">
				</div>
				<div class="test_text">
					<div class="test_text_name">깜박사</div>
					<div class="typing-txt"> 
						<ul>
					    	<li><%= resultCard %> 카드가 나왔어!</li>
					    	<li><%= resultLook %></li>
					    	<li>깜박사의 추천 스타일을 함께 참고해 봐</li>
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
		</div>
		
		<div class="test_buttons">
				<input type="button" value="테스트 다시하기" onclick="document.location.href='/fortuneteller/index.jsp?page=ootd.jsp'">&nbsp;&nbsp;
				<!-- <input type="button" value="결과 공유하기" onclick="document.location.href='/fortuneteller/index.jsp?page=ootd.jsp'"> -->
			</div>
	</div>
	
	<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script>
		$(document).ready(function(){
		
			// 옵션 사용하지 않을 경우
			// $('.single-item').slick();
		
			// 옵션 사용할 경우
			$('.slide').slick({
				// 옵션 삽입
				slidesToShow: 8,
				slidesToScroll: 8,
				arrows: false,
				infinite: false,
			});
		  
		});
	</script>
	<%
	} 
	%>
</body>
</html>