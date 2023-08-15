<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Board</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/review/css/style_review.css?ver=1.3">
<script type="text/javascript" src="/fortuneteller/review/script.js"></script>
</head>
<body>
	<div class="review_text">
		<span>R E V I E W</span>
	</div>
	
	<br>
	
	<form action="/fortuneteller/index.jsp?page=reviewDeleteProc.jsp?pageNum=<%= pageNum %>" class="deleteForm_form" method="post" name="delForm" onsubmit="return deleteSave()">	
		<div class="deleteForm_text">
			비밀번호를 입력해 주세요
		</div>
		
		<div class="deleteForm_password">
			<input type="password" name="pass" size="20" class="deleteForm_password_input">
			<input type="hidden" name="num" value="<%= num %>">
		</div>
		
		<div class="deleteForm_buttons">
			<input type="submit" value="DELETE">&nbsp;&nbsp;
			<input type="button" value="LIST" onclick="document.location.href='/fortuneteller/index.jsp?page=review.jsp?pageNum=<%= pageNum %>'"> 
		</div>
	</form>
</body>
</html>