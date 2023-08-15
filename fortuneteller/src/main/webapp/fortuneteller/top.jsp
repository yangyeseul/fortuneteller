<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="css/style_index.css">
</head>
<body>
	<div class="top_wrap">
		<div class="top_logo">
			<a href="index.jsp"><img src="/fortuneteller/img/logo.png"></a>
		</div>
		
        
		
		<div class="top_buttons">
		<%
		    String loginID = (String) session.getAttribute("loginID");
        
		    if(loginID == null) {
		%>
			<button><a href="/fortuneteller/index.jsp?page=login.jsp">LOGIN</a></button>
			<button><a href="/fortuneteller/index.jsp?page=regForm.jsp">JOIN</a></button>
		<%}else{ %>
			<button><a href="/fortuneteller/index.jsp?page=mypage_modify.jsp">MYPAGE</a></button>&nbsp;&nbsp;
			<button><a href="member/logout.jsp">LOGOUT</a></button>
		<%} %>	
		
		</div>
	</div>
	
	
</body>
</html>