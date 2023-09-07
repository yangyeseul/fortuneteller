<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ page import="com.member.MemberDAO" %> 
<%@ page import="com.member.MemberVO" %>    

<jsp:useBean id="dao" class="com.member.MemberDAO"/>
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
 --%>
<%--
	<%
	request.setCharacterEncoding("utf-8");
	String id=(String) session.getAttribute("loginID");
	System.out.println(id);
%>
--%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/crystal/crystalCSS/crystal_style.css">
</head>
<body>
		

		<div class="crystal_text"><span>수정구슬에게 물어봐</span></div><br><br>

		<div id="crystal_keyword_wrap">

			<img align="center" src="/fortuneteller/crystal/crystalImg/crystal_keyword0.png"><br><br>
		

			<div class="keyword_effect" align="center">
			
			<!-- 연애 -->
			<div class="keyword1">
				<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_love">
					<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword1.png" >
				</a><br><br>
			</div>
		
			<!-- 재회 -->
			<div class="keyword2">
				<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_re">
					<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword2.png">
				</a><br><br>
			</div>
	
			<!-- 인생 -->
			<div class="keyword3">
				<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_life">
					<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword3.png">
				</a><br><br>
			</div>
	
			<!-- 친구 -->		
			<div class="keyword4">
				<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_friend">
					<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword4.png">
				</a><br><br>
			</div>	
		
			<!-- 사업 -->
			<div class="keyword5">
			<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_busi">
			<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword5.png">
			</a><br><br>
			</div>
	
			<!-- 취업 -->		
			<div class="keyword6">
			<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_job">
			<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword6.png">
			</a><br><br>
			</div>
		
			<!-- 취미 -->
			<div class="keyword7">
			<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_hobby">
			<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword7.png">
			</a><br><br>
			</div>
		
			<!-- 공부 -->			
			<div class="keyword8">
			<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_study">
			<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword8.png">
			</a><br><br>
			</div>


			<!-- 식사메뉴추천 -->			
			<div class="keyword9">
			<a href="/fortuneteller/index.jsp?page=crystalLoading.jsp?crystalResult=c_food">
			<input type="image" src="/fortuneteller/crystal/crystalImg/crystal_keyword9.png">
			</a><br><br>
			</div>
			
		</div>
			
	</div>
	
</body>
</html>