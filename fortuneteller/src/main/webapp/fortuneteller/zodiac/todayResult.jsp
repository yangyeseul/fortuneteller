<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.zodiactest.ZodiacDAO" %>
    <%@ page import="com.zodiactest.ZodiacTestVO" %>
    <%@ page import="com.member.MemberVO" %>
    
    <% 
    request.setCharacterEncoding("utf-8");
    
    ZodiacDAO.getInstance();
    ZodiacDAO zDao = new ZodiacDAO();
    ZodiacTestVO zVo = new ZodiacTestVO();
    MemberVO mVo = new MemberVO();
    
    String id = (String)session.getAttribute("loginID");
    if(id != null){
    mVo = zDao.setMember(id);
    int year = mVo.getYear();
    zVo = zDao.todayZodiac(year);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="stylesheet" href="zodiac/zodiac.css">
<body>
<div align="center" style="font-size:20px" style="font:나눔고딕">
<p style="font-size:50px" style="font-style:red">아나타와<br>
<img alt="" src="<%= zVo.getZc_zodiac() %>" width="300" style="border-radius:90px"><br>
로군요...<br></p>
<%= zVo.getZc_today() %>
<% } %>
<br>
<br>
</div>
<div align="right" class="image2">'
<a href="index.jsp?page=ZodiacTestView.jsp" name="home">
<img src="zodiac/img/페페돌아가기.png" width="150" border="0" style="border-radius: 80px">
</a>
</div>
</body>
</html>