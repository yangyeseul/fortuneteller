<%@page import="com.ootd.OotdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 

<%
request.setCharacterEncoding("UTF-8");

String loginID = (String) session.getAttribute("loginID");
OotdDAO ootdDAO = OotdDAO.getInstance();
String userName = ootdDAO.searchName(loginID);
String userGender = ootdDAO.searchGender(loginID);
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
	<%
	if(loginID == null) {
	%>
	
	<%-- login.jsp에 page 파라미터 값 넘겨주기 (로그인 후 원래 페이지로 이동하려면 원래 페이지 주소를 기억하고 있어야함.,, --%>
	<jsp:include page="/fortuneteller/member/login.jsp">
		<jsp:param name="page" value="ootdMain.jsp" />
	</jsp:include>
	
	<%
	} else {
	%>
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
				    	<li>먼저, 이름과 성별을 확인할게!</li>
				    	<li>이름은 <%= userName %>, 성별은 <%= userGender %> 맞아?</li>
				    	<li>참고로 지금은 여자 행운룩만 준비되어 있어&#128549;</li>
				    	<li>그래도 계속 테스트해 볼래?</li>
					</ul>
				</div> 
				<div class="typing">
			    	<ul>
			    		<li></li>
			    		<li></li>
			    		<li></li>
			    		<li></li>
			    	</ul>
				</div> 
			</div>
		</div>
		
		<div class="test_answer">
			<input type="button" value="응. 해 볼게" onclick="document.location.href='/fortuneteller/index.jsp?page=ootdTest.jsp?answer=yes'">
			&nbsp;&nbsp;
			<input type="button" value="아니. 그냥 안 할래" onclick="document.location.href='/fortuneteller/index.jsp?page=ootdTest.jsp?answer=no'">
		</div>
	</div>
	<%
	}
	%>
	
	<script type="text/javascript">
	/* 딜레이 후 버튼 생성 */
	setTimeout(function(){
	  document.querySelector('.test_answer').style.display = "block";
	}, 6000);
	</script>
</body>
</html>