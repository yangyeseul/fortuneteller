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
    	
    	// ★ 로그인하면 원래 페이지로 갈 수 있또록 원래 페이지 파라미터 값 받아옴
    	String referer = request.getParameter("page");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	if(check == 1) { //로그인 성공 
		session.setAttribute("loginID", id);
		
		if(referer.equals("login.jsp")) { //
			// ★ 로그인하면 메인으로 이동
			response.sendRedirect("/fortuneteller/index.jsp");
		} else if(referer != null) {
			// ★ 로그인하면 원래 페이지로 이동
			response.sendRedirect("/fortuneteller/index.jsp?page=" + referer);
		} 
	} else if(check == 0){ //비밀번호 다름 
	%>
	<script type="text/javascript">
		alert("비밀번호가 다릅니다.");
		history.go(-1);
	</script>
	
	<%
	} else if (check == -1){ //아이디 존재X 
	%>
	<script type="text/javascript">
		alert("아이디가 존재하지 않습니다.");
		history.go(-1);
	</script>
	<%
	} // else {
	%>
</body>
</html>