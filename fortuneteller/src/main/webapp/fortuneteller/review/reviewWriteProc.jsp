<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    
<%@ page import = "com.review.ReviewDAO" %>
<%@ page import = "java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="article" class="com.review.ReviewVO" scope="page">
	<jsp:setProperty name="article" property="*" />
</jsp:useBean>

<%
	article.setPostdate(new Timestamp(System.currentTimeMillis()));
	
	ReviewDAO dbPro = ReviewDAO.getInstance();
	dbPro.insertArticle(article);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" http-equiv="Refresh" content="0;url=/fortuneteller/index.jsp?page=review.jsp">
<title></title>
</head>
<body>

</body>
</html>