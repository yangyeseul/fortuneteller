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
<link type="text/css" rel="stylesheet" href="/fortuneteller/crystal/crystalCSS/crystal_style.css">
</head>
<body>
		

		<div class="crystal_text" align="center"><span>수정구슬에게 물어봐</span></div><br><br>


			<div class="resultName" align="center"><%=vo.getName() %> 님</div>

			<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_results.png"><br><br>
			

	</div>
	
</body>
</html>