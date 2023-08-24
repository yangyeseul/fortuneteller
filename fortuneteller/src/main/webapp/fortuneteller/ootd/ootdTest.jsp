<%@page import="com.ootd.OotdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%
request.setCharacterEncoding("UTF-8");
String answer = request.getParameter("answer");
int resultNum = 0;
int rNums[] = new int[78];
String loginID = (String) session.getAttribute("loginID");
OotdDAO ootdDAO = OotdDAO.getInstance();
String userName = ootdDAO.searchName(loginID);
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
	if(loginID == null) {
	%>
	<jsp:include page="/fortuneteller/member/login.jsp" />
		
	<% 
	} else { 
	%>
	<div class="ootd_text">
		깜박사가 알려주는 <span>오늘의 행운룩</span>
	</div>
	
		<%
		if(answer.equals("yes")) {
		%>
	<div class="test_wrap" style="height:280px;">
		<div class="test_question">
			<div class="test_img">
				<img src="/fortuneteller/ootd/img/right_bubble_image.png">
			</div>
			<div class="test_text">
				<div class="test_text_name">깜박사</div>
				<div class="typing-txt"> 
					<ul>
				    	<li>그럼, 아래 타로 카드 중에서</li>
				    	<li><%= userName %>의 마음에 드는 카드를 한 장만 골라 봐</li>
				    	<li>오늘의 행운을 높이기 위해서 집중해 줘!</li>
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
		
		<div class="test_deck">
			<div class="slide">
			<%
			for(int i = 1; i <= 22; i++) { // 78개임 원래
				resultNum = (int) (Math.random() * 22 + 1); // 77
				
				for(int j = 1; j <= 22; j++) { // 78
					if(resultNum != rNums[j]) {
						rNums[i] = resultNum;
					} else {
						break;
					}
				}
			%>
				<div class="card_slide">
					<a href="/fortuneteller/index.jsp?page=ootdResult.jsp?result=<%= rNums[i] %>">
						<span><%= i %></span>
						<img src="/fortuneteller/ootd/img/tarot/80.png">
					</a>
				</div>
			<%
			}
			%>
			</div>
		</div>
	</div>
		<%
		} else {
		%>
	<div class="test_wrap">
		<div class="test_question">
			<div class="test_img">
				<img src="/fortuneteller/ootd/img/right_bubble_image.png">
			</div>
			<div class="test_text">
				<div class="test_text_name">깜박사</div>
				<div class="typing-txt"> 
					<ul>
				    	<li>아쉽다!</li>
				    	<li>오늘의 행운룩이 궁금하면 언제든지 찾아줘</li>
				    	<li>안녕~</li>
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
		
		<div class="test_answer test_replay">
			<input type="button" value="테스트 다시하기" onclick="document.location.href='/fortuneteller/index.jsp?page=ootd.jsp'">
		</div>
		<%
		}
		%>
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
	<script type="text/javascript">
	/* 딜레이 후 버튼 생성 */
	setTimeout(function(){
	  document.querySelector('.test_replay').style.display = "block";
	}, 6000);
	</script>
	<%
	}
	%>
</body>
</html>