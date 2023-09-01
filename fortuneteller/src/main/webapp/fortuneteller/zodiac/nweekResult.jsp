<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.zodiactest.ZodiacDAO" %>
    <%@ page import="com.zodiactest.ZodiacTestVO" %>
    <%@ page import="com.member.MemberVO" %>
    <%@ page import="com.history.HistoryDAO" %>
    <%@ page import="com.history.InfoVO" %>
    <%@ page import="java.sql.Timestamp" %>
    
    <% 
    request.setCharacterEncoding("utf-8");
    
    String id = (String)session.getAttribute("loginID");
    
    ZodiacDAO.getInstance();
    ZodiacDAO zDao = new ZodiacDAO();
    ZodiacTestVO zVo = new ZodiacTestVO();
    MemberVO mVo = new MemberVO();
    HistoryDAO dao = new HistoryDAO();
    InfoVO vo = new InfoVO();
    
    String imgSrc = "/fortuneteller/img/slide04.png";
	 String testName = "띠 운세";
	 String testPage="/fortuneteller/index.jsp?page=ZodiacTestView.jsp";
	 vo.setId(id);
	 vo.setRegdate(new Timestamp(System.currentTimeMillis()));
	 vo.setImage(imgSrc);
	 vo.setTestName(testName);
	 vo.setTestPage(testPage);
	 dao.insertInfo(vo);
	 response.sendRedirect("/fortuneteller/zodiac/ZodiacTestView.jsp");
    
    String zodiac = zVo.getZc_zodiac();
    String week = zVo.getZc_week();
    
    
    if(id != null && zodiac != null){
    mVo = zDao.setMember(id);
    int year = mVo.getYear();
    zVo = zDao.nweekZodiac(year);
    
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
<p style="font-size:30px" style="font-style:red">당신은<img alt="" src="<%= zVo.getZc_zodiac() %>" width="200" style="border-radius:90px">
로군요!?<br></p>
<br><br>
<table>
	<tr>
		<td><%= zVo.getZc_nweek() %></td>
	</tr>
</table>
<% }else if(id != null && zVo.getZc_nweek() == null && zVo.getZc_zodiac() == null){ %>
<div align="center" style="font-size:20px" style="font:나눔고딕">
<p style="font-size:30px" style="font-style:red">당신은 인간이 아닌가요..??</p>
</div>
<% } %>
<div align="right" class="image2">'
<a href="index.jsp?page=ZodiacTestView.jsp" name="home">
<img src="zodiac/img/돌아가기.png" width="200" border="0" style="border-radius: 80px">
</a>
</div>
</body>
</html>