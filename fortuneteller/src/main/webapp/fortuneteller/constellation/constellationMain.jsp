<%@page import="com.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="com.member.MemberDAO"></jsp:useBean>
  
    <jsp:useBean id="vo" class="com.member.MemberVO">
    <jsp:setProperty property="*" name="vo"/>
    </jsp:useBean>
    <%
		request.setCharacterEncoding("utf-8");
    String id =(String) session.getAttribute("loginID");
   	 System.out.println(id);
   	 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이번달 나의 별자리 운세는?</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/constellation/constellationCSS/constellation_style.css">
</head>
<body>

<%if(id==null){ %>

<jsp:include page="/fortuneteller/member/login.jsp" >
	<jsp:param value="constellationMain.jsp" name="page"/>
</jsp:include>

<%}else{ %>
<div class="constellTextImg">

	<div class="constellation_text">이번달 나의 <span>별자리 운세</span></div><br><br>
	
	<img src="/fortuneteller/constellation/constellationImg/constellationImageCut.png"><br><br>
	
		<div class="container">
			<div class="constellText">
					7월 23일부터 9월 4일까지 금성이 사자자리에서 역행합니다.<br>
					금성이 역행하면 사랑과 외모 영역에서 문제가 발생할 수 있습니다.&#128171;&#127775;&#127776;<br>
					연인과 사랑 싸움을 하거나 얼굴이 뒤집힐 수 있겠군요.&#128148;<br>
					과연 금성이 어떤 말썽을 일으킬까요?&#127765;&#128302;<br>
					점성술사 릴리가 무엇을 조심하면 좋을지 알려줄게요!<br>
			</div>
				<input type="checkbox" class="button">
		</div>
	<br>
	
	<hr id="hr1"> 
	<!-- <div id="testBtn"><a href="/fortuneteller/constellation/constellationTest.jsp"><input type="button" value="지금 확인하러 가기"></a></div> -->
	<!-- 
	<div id="testBtn"><input type="button" value="지금 확인하러 가기" onclick="goTest()">
	<input type="hidden" value="이번달 나의 별자리 운세는?" name="testConstell" >
	</div> -->
	
	<div id="testBtn"><a href="/fortuneteller/constellation/constellationCheck.jsp"><input type="button" value="지금 확인하러 가기">
	</a></div>
	
	<hr id="hr2">
	<br> 
	<p  class="constellText2">다른 운세들이 보고싶다면?</p>
	<br>
	<div class="interval">
		<div class="testImgContainer">
			<div class="testImg"><a href="/fortuneteller/index.jsp?page=ootd.jsp"><img src="/fortuneteller/img/slide01.png"></a></div>
		</div>
			<div class="testTitle"><a href="/fortuneteller/index.jsp?page=ootd.jsp">깜박사의 오늘의 행운룩</a></div>
	</div>
		
	<div class="interval">
		<div class="testImgContainer">
			<div class="testImg"><a href="#"><img src="/fortuneteller/img/slide02.png"></a></div>
		</div>
			<div class="testTitle"><a href="#">수정구슬에게 물어봐</a></div>
	</div>
	
	<div class="interval">
		<div class="testImgContainer">
			<div class="testImg"><a href="#"><img src="/fortuneteller/img/slide03.png"></a></div>
		</div>
			<div class="testTitle"><a href="#">띠로 보는 나의 운세</a></div>
	</div>
	
</div>
<script type="text/javascript">

	document.querySelector(".button").onclick = function() {
		var text = document.querySelector(".constellText");
		text.classList.toggle("more");
	}
	
</script>
<%} %>
</body>

</html>
