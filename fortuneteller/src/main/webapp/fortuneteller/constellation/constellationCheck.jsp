<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="com.history.HistoryDAO"></jsp:useBean>
    
    <jsp:useBean id="vo" class="com.history.InfoVO"> 
    <jsp:setProperty property="*" name="vo"/>
    </jsp:useBean>
    
    <%
		request.setCharacterEncoding("utf-8");
    String id =(String) session.getAttribute("loginID");
   	 System.out.println(id);
   	 String imgSrc = "/fortuneteller/constellation/constellationImg/constellationImageCut.png";
   	 String testName = "별자리 운세";
   	 String testPage="/fortuneteller/index.jsp?page=constellationMain.jsp";
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%if(id==null){ %>

<script type="text/javascript">
	alert("로그인이 필요한 서비스 입니다.");
	window.location=('/fortuneteller/index.jsp?page=login.jsp');
</script>

<!--loginProc.jsp 에 sendredirect 해놔서 안넘어가는  -->
<%}else{
	
  	 vo.setId(id);
  	 vo.setRegdate(new Timestamp(System.currentTimeMillis()));
  	 vo.setImage(imgSrc);
  	 vo.setTestName(testName);
  	 vo.setTestPage(testPage);
  	 dao.insertInfo(vo);
  	 response.sendRedirect("/fortuneteller/constellation/constellationTest.jsp");
}
%>
</body>
</html>