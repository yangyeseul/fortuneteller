<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="com.member.MemberDAO" />
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
String loginID = (String) session.getAttribute("loginID");
String pass = request.getParameter("pass");
System.out.print(pass);
int check = dao.deleteMember(loginID, pass);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%if(check==1){ session.invalidate();%>
	<script type="text/javascript">
		alert("탈퇴 되었습니다.");
		window.location='/fortuneteller/index.jsp';
	</script>
	<%}else if(check==0){%>
	<script type="text/javascript">
		alert("비밀번호가 다릅니다.");
		history.go(-1);
	</script>
	<%}else{ %>
	<script type="text/javascript">
		alert("존재하는 아이디가 아닙니다.");
		history.go(-1);
	</script>
	<%} %>
</body>
</html>