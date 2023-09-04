<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import="com.member.MemberDAO" %> 
<%@ page import="com.member.MemberVO" %>    

<jsp:useBean id="dao" class="com.member.MemberDAO"/>
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	request.setCharacterEncoding("utf-8");
	String id=(String) session.getAttribute("loginID");
	System.out.println(id);
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정구슬에게 물어봐</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/crystal/crystalCSS/crystal_style.css">
</head>
<body>

		<div class="crystal_text" align="center"><span>수정구슬에게 물어봐</span></div><br><br>

		
		<div class="crystal_Text">
			공부,취업,연애,사업 등으로 고민이 있다고?<br>
			일상 속 갈팡질팡 순간들에 좋은 글귀가 필요할 때!<br><br>
		</div><br>

		<div>
		<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_Main.png"></img><br><br>
		</div>

		<div class="start_btn">
			<a href="/fortuneteller/index.jsp?page=crystalCheck.jsp">
			<img align="center" width="350" input type="button" src="/fortuneteller/crystal/crystalImg/crystal_Main_btn.png"></a><br><br>
		</div>

		<br>
		
			

<script type="text/javascript">

	document.querySelector(".button").onclick = function() {
		var text = document.querySelector(".constellText");
		text.classList.toggle("more");
	}
	
</script>

</body>

</html>