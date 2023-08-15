<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="com.member.MemberDAO" />
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
String loginID = (String) session.getAttribute("loginID");
vo.setId(loginID);
dao.updateStudent(vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<script type="text/javascript">
		alert("수정 되었습니다.");
		window.location='/fortuneteller/index.jsp';
	</script>
</body>
</html>