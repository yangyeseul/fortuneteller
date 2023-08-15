<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="dao" class="com.member.MemberDAO" />
    <jsp:useBean id="vo" class="com.member.MemberVO" >
    <jsp:setProperty property="*" name="vo"/>
    </jsp:useBean>
    <%
    boolean member = dao.memberInsert(vo);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/loginForm_sytle.css">
</head>
<body>
	<div align="center" class="loginBtn">
		<%if(member){ %>
		<script type="text/javascript">
			alert("회원가입이 완료 되었습니다.");
			window.location='/fortuneteller/index.jsp?page=login.jsp';
		</script>
		
		<%}else{ %>
		<script type="text/javascript">
			alert("회원가입에 실패하였습니다.");
			history.go(-1);
		</script>
		<%} %>
	
	</div>
</body>
</html>