<%@page import="java.sql.Timestamp"%>
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
    /* String imgSrc = "/fortuneteller/crystal/constellationImg/.png"; */
    String testName = "수정구슬에게 물어봐";
    String testPage="/fortuneteller/index.jsp?page=crystalMain.jsp";
%>
  
<!DOCTYPE html>
<html>
<head>
<% if(id!=null){ 
	vo.setId(id);%>
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=crystalChat.jsp"/>
	<!-- /* response.sendRedirect(""); */ -->
<title></title>
</head>
<body>
 
	
<%}else{
%>
	  	<script type="text/javascript">
		alert("로그인이 필요한 서비스 입니다.");
		window.location=('/fortuneteller/index.jsp?page=login.jsp');
	</script>
  	<%
}
%>
</body>
</html>