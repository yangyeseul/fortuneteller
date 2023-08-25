<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ page import="com.member.MemberDAO" %> 
<%@ page import="com.member.MemberVO" %>    

<jsp:useBean id="dao" class="com.member.MemberDAO"/>
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
 --%>
<%--
	<%
	request.setCharacterEncoding("utf-8");
	String id=(String) session.getAttribute("loginID");
	System.out.println(id);
%>
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/crystal/crystalCSS/crystal_style.css?after">

<script type="text/javascript">

var i = 1;
function createLine(){
		setTimeout(function(){
			document.getElementById('aa').innerHTML += ("<div class=chat"+i+"><img align=center width=550 src=/fortuneteller/crystal/crystalImg/crystal_chat"+i+".png><br></div>")
		i++;
			if(i < 10){
				createLine();
			}
		}, 1000);
}
window.onload = createLine();

</script>
</head>
<body>
		

		<div id="aa" class="crystal_text" align="center"><span>수정구슬에게 물어봐</span></div><br><br>



			 <img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_Background.png"><br><br>

			<!--
			<div class="chat1">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat1.png"><br><br>
			</div>
			
			<div class="chat2">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat2.png"><br><br>
			</div>
			
			<div class="chat3">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat3.png"><br><br>
			</div>
			
			<div class="chat4"> 
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat4.png"><br><br>
			</div>
			
			<div class="chat5">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat5.png"><br><br>
			</div>
			
			<div class="chat6">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat6.png"><br><br>
			</div>
			
			<div class="chat7">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat7.png"><br><br>
			</div>
			
			<div class="chat8">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat8.png"><br><br>
			</div>
			
			<div class="chat9">
			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_chat9.png"><br><br>
			</div>
			-->
			
			<div class="chat10_btn">
			<a href="/fortuneteller/index.jsp?page=crystalKeyword.jsp">
			<img align="center" width="350" input type="button" src="/fortuneteller/crystal/crystalImg/crystal_chat10_btn.png"><br><br>
			</div>
 

		<br>
		

 
</body>
</html>