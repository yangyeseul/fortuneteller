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
<% if(check.equals("today")&&id != null){
	//response.setHeader("Refresh", "3; /fortuneteller/index.jsp?page=todayResult.jsp");%>
<meta http-equiv="refresh" content="3; url=/fortuneteller/index.jsp?page=todayResult.jsp"/>
	<%
}else if(check.equals("tomorrow")&&id != null){
	//response.setHeader("Refresh", "3; /fortuneteller/index.jsp?page=tomorrowResult.jsp");%>
<meta http-equiv="refresh" content="3; url=/fortuneteller/index.jsp?page=tomorrowResult.jsp"/>
	<%
}else{// 로그인이 안되어 있을때  %>
<script type="text/javascript">
alert("로그인 후 이용해 주세요");
window.location='index.jsp?page=login.jsp';
</script>
<% } %>
<title>FortuneTeller</title>
</head>
<body>
<div class="imgLoading">
<img alt="" src="/fortuneteller/zodiac/img/loading.gif">&nbsp;
<img src="/fortuneteller/zodiac/img/아이.jpg" width="200px" align="right"></div>
<div align="center" style="font-size: 20px">아이가 당신의 운세를 불러오고 있습니다</div>
</body>
</html>