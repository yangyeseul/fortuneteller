<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    request.setCharacterEncoding("utf-8");
    String check = request.getParameter("check");
    String id = (String)session.getAttribute("loginID");
    %>
   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="zodiac/zodiac.css">
<meta charset="UTF-8">
<% if(check.equals("today")&&id != null){%>
<meta http-equiv="refresh" content="3; url=/fortuneteller/index.jsp?page=todayResult.jsp"/>
	<%
}else if(check.equals("tomorrow")&&id != null){%>
<meta http-equiv="refresh" content="3; url=/fortuneteller/index.jsp?page=tomorrowResult.jsp"/>
	<%
}else if(check.equals("week")&&id != null){%>
<meta http-equiv="refresh" content="3; url=/fortuneteller/index.jsp?page=weekResult.jsp"/>
	<% 
}else if(check.equals("nweek")&&id != null){
%>
<meta http-equiv="refresh" content="3; url=/fortuneteller/index.jsp?page=nweekResult.jsp"/>
<%} %>
<title>FortuneTeller</title>
</head>
<body>
<div class="imgLoading">
<img alt="Loading" src="/fortuneteller/zodiac/img/Loading1.gif" align="center" style="border-radius: 25px;">
<br>
<div align="center" style="font-size: 20px">아이가 당신의 <h4>운세를</h4> 불러오고 있습니다!!
맛테 쿠다사이!
</div>
</body>
</html>