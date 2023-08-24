<%@page import="com.constellation.ConstellationVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="com.constellation.ConstellationDAO"></jsp:useBean> 
    
     <%
		String sessionId = (String)session.getAttribute("loginID");
   		ConstellationVO vo = dao.getMonth(sessionId);
   		int month=vo.getConstellMonth();
   		
   		 ConstellationVO vo2=dao.getResult(month);
    %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/constellation/constellationCSS/constellation_style.css">
</head>
<body>
<jsp:include page="constellationIndex.jsp" />

<div class="resultImg"><img src="/fortuneteller/constellation/constellationImg/testImg.png"></div>

<div class="resultName" align="center"><%=vo.getName() %> 님</div>

<div class="testText1">
7월 23일부터 9월 4일까지 금성이 사자자리에서 역행할 예정이야. 금성이 역행하는 기간에는 큰 변화를 만들지 않고, 하던 일을 더 꼼꼼하게 확인하는 게 좋단다.<br><br>
그렇다고 너무 겁먹진 마. 이 기간에 당신이 무엇을 조심해야 하는지 릴리가 콕 집어서 알려줄게.<br><br>
<b><%=vo.getName() %>님, 로맨틱 필터를 조심해.</b><br><br>
금성이 역행할 때는 호의를 호감으로 착각하기 쉽단다. 서로 예의를 지켜야 하는 관계에서 사적인 감정을 감추지 못하고 부담을 주는 행동을 할 수도 있지. 직장 상사나 동료, 학교 선배나 동기 등 평소 좋아하던 이성에게 <%=vo.getName() %>님도 모르게 마음을 표현하겠네.<br><br>
사랑에 빠지는 게 죄는 아니라지만, 공과 사는 구분할 필요가 있단다. 회사는 일하는 곳, 학교는 공부하는 곳이잖아. 금성의 장난에 홀려 공사 구분도 못하고 사랑만 좇는다면 후폭풍이 심할 거야. 그러니 연애를 시작하고 싶거든 금성 역행 기간 이후를 노리길 바라!
</div>
<hr id="hr1"><br>
<div class="testText2">
	<div class="costellName" align="center"><%=month%>월 <%=vo.getConstellDay() %>일&nbsp;&nbsp;<span><%=vo2.getConstellName() %></span></div>
	<div class="lucky">행운의 컬러 : <span id="luckyColor"><%=vo2.getColor()%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;행운의 아이템 : <span id="luckyItem"><%=vo2.getItem() %></span> </div>
	<div class="testContent"><%=vo2.getTestContent() %></div>
</div>

<footer>
<div style="margin-left: 913px; margin-top: 10px;">
<a href="/fortuneteller/index.jsp?page=constellationMain.jsp"><input type="button" value="돌아가기"></a>
<!-- <a href="/fortuneteller/constellation/testHistory.jsp"><input type="button" value="돌아가기"></a> -->
</div>
</footer>

</body>
</html>