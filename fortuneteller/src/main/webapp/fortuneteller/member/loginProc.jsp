<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="com.member.MemberDAO" />
    <jsp:useBean id="vo" class="com.member.MemberVO">
    <jsp:setProperty property="*" name="vo"/>
    </jsp:useBean>
    
    <%
    	String id = request.getParameter("id");
    	String pass = request.getParameter("pass");
    	int check = dao.loginCheck(id, pass);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%if(check == 1) { //로그인 성공 
		session.setAttribute("loginID", id);
		response.sendRedirect("/fortuneteller/index.jsp");
	%>
	
	<%}else if(check == 0){ //비밀번호 다름 %>
	<script type="text/javascript">
		alert("비밀번호가 다릅니다.");
		history.go(-1);
	</script>
	
	<%}else if (check == -1){ //아이디 존재X %>
	<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
	<%} %>
</body>
</html>