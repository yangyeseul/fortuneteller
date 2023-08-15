<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="com.member.MemberDAO" />
<%
String id = request.getParameter("id");
boolean check = dao.idCheck(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 확인</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/regForm_sytle.css">
</head>
<body bgcolor="#FFFAE6">
	<div align="center" class="idCheckPlace">
		<strong><%=id%></strong>
		<%
		if(check) {
			out.println("는 이미 존재하는 아이디 입니다.");
		} else {
			out.println("는 사용 가능한 아이디 입니다.");
		}
		%>
		<br><br>
		<a href="javascript:this.close()">닫기</a>
	</div>
</body>
</html>