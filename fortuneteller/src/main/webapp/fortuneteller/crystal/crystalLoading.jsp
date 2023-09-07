<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String crystalResult=request.getParameter("crystalResult");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/crystal/crystalCSS/crystal_style.css">

<!--3초 뒤 crystalResults 페이지로 이동-->
<meta http-equiv="refresh" content="3; http://localhost:9090/fortuneteller/index.jsp?page=crystalResult.jsp?crystalResult=<%= crystalResult %>">

</head>
<body>


		<div class="crystal_text" align="center"><span>수정구슬에게 물어봐</span></div><br><br><br><br>


		<div id="crystal_loading_wrap">
			<div class="crystal_loading_text">
			<img src="/fortuneteller/crystal/crystalImg/crystal_loading_text.png">
			</div>
		</div>

<!-- 
 	<script type="text/javascript">
	window.location='/fortuneteller/index.jsp?page=crystalResults.jsp';
 -->
	
</body>
</html>