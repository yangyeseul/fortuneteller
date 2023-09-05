<%-- <%@page import="sun.security.jca.GetInstance"%> --%>
<%@page import="com.crystal.CrystalDAO"%>
<%@page import="com.crystal.CrystalVO"%> 
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.member.MemberDAO" %> 
<%@ page import="com.member.MemberVO" %>    

<jsp:useBean id="dao" class="com.crystal.CrystalDAO"/>


<%
	request.setCharacterEncoding("utf-8");
	String id=(String) session.getAttribute("loginID");
	CrystalVO vo = dao.getName(id);
	System.out.println(id);
	System.out.println(vo.getName());

	String crystalResult = request.getParameter("crystalResult");
	
	// db 연결	
	CrystalDAO crystalDAO = CrystalDAO.getInstance();
	
	CrystalVO crystalContent = crystalDAO.getResult(crystalResult); 
	
	// CrystalVO cVO = (CrystalVO)crystalContent;
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/crystal/crystalCSS/crystal_style.css">
</head>
<body>
		

		<div class="crystal_text" align="center"><span>수정구슬에게 물어봐</span></div><br><br>
		
		<div class="resultName" align="center"><%=vo.getName() %> </div>

		<div class="resultsimage"><img src="/fortuneteller/crystal/crystalPNG/<%= crystalContent.getImageUrl() %>" alt=""></div>

		<div class="resultscontent"><%= crystalContent.getContent() %></div>

		<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/crystal_results.png"><br><br>
	<!-- 		
		<div class="image">
		<img align="center" width="550" src="/fortuneteller/crystal/crystalImg/p시루스1.jpg"><br><br>
		</div> -->
		
		<div class="text_box">
		<img align="center" width="450" src="/fortuneteller/crystal/crystalImg/crystal_results_textbox.png">	
		</div>

		<div class="exit_btn">
		<a href="/fortuneteller/index.jsp?page=main.jsp">
		<img align="center" width="350" type="button" src="/fortuneteller/crystal/crystalImg/crystal_exit_btn.png"></a><br><br>
		</div>
	
		
	
</body>
</html>