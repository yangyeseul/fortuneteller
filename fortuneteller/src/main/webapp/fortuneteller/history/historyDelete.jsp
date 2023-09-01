<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%request.setCharacterEncoding("utf-8"); %>
    <%@ page import="com.history.*" %>
    <jsp:useBean id="dao" class="com.history.HistoryDAO" /> 
    <%
    	int num =Integer.parseInt(request.getParameter("num"));
    	String pageNum = request.getParameter("pageNum");
    	dao.historyDelete(num);
    %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<script type="text/javascript">
	window.location="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=pageNum%>";
</script>
</body>
</html>