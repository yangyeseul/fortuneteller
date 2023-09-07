<%-- <%@page import="sun.security.jca.GetInstance"%> --%>
<%@page import="com.crystal.CrystalDAO"%>
<%@page import="com.crystal.CrystalVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.member.MemberDAO" %> 
<%@ page import="com.member.MemberVO" %>    

<jsp:useBean id="dao" class="com.crystal.CrystalDAO"/>
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:useBean id="cVO" class="com.crystal.CrystalVO"/>

<jsp:setProperty property="*" name="vo"/>

</jsp:useBean>


<%
	request.setCharacterEncoding("utf-8");
	String id=(String) session.getAttribute("loginID");
	System.out.println(id);
	String crystalResult = request.getParameter("crystalResult");
	
	// db 연결	 
	CrystalDAO crystalDAO = CrystalDAO.getInstance();
	CrystalVO resultVO = new CrystalVO(); 
	
	CrystalVO vo1=crystalDAO.getName(id);
	CrystalVO cVO = crystalDAO.getResult(crystalResult);
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
		
		
		
		
		<div id="crystal_result_wrap">

			<div class="resultName"><%=vo1.getName()%></div>

			<div class="resultimage"><img src="/fortuneteller/crystal/crystalImgresult/<%=cVO.getImage()%>"></div>

			<div class="square">
				<div class="resultcontent"><%= cVO.getContent()%></div>
			</div>

		
		

			<div class="exit_btn">
				<a href="/fortuneteller/index.jsp?page=main.jsp">
				<img width="350" type="button" src="/fortuneteller/crystal/crystalImg/crystal_exit_btn.png"></a><br><br>
			</div>
	
		</div>
	
</body>
</html>