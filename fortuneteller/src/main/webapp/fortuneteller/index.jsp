<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%
	request.setCharacterEncoding("UTF-8");

	String pagefile = request.getParameter("page");

	if(pagefile == null) {
		pagefile = "main.jsp";		
	} else if(pagefile.equals("login.jsp")) { // 회원정보 관련
		pagefile = "/fortuneteller/member/" + pagefile;
	} else if(pagefile.equals("regForm.jsp")) {
		pagefile = "/fortuneteller/member/" + pagefile;
	} else if(pagefile.equals("mypage_modify.jsp")) {
		pagefile = "/fortuneteller/member/" + pagefile;
	} else if(pagefile.equals("history.jsp")) {
		pagefile = "/fortuneteller/member/" + pagefile;
	} else if(pagefile.equals("deleteForm.jsp")) {
		pagefile = "/fortuneteller/member/" + pagefile;
	} else if(pagefile.contains("review.jsp")) { // 리뷰게시판 관련
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("content.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewDeleteForm.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewDeleteProc.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewUpdateForm.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewUpdateProc.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewWriteForm.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewWriteProc.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewOotd.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewCrystal.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewStarsign.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.contains("reviewZodiac.jsp")) {
		pagefile = "/fortuneteller/review/" + pagefile;
	} else if(pagefile.equals("ootd.jsp")) { // 오늘의 행운룩 관련
		pagefile = "/fortuneteller/ootd/" + pagefile;
	}
%>

<link rel="stylesheet" href="css/style_index.css">
<script type="text/javascript" src="member/script.js"></script>
<script type="text/javascript" src="review/script.js"></script>
<title>FortuneTeller</title>
</head>
<body>
	<div class="wrapped">
		<div class="top">
			<jsp:include page="top.jsp" />
		</div>
		
		<div class="section">
			<div class="nav">
				<jsp:include page="nav.jsp" />
			</div>
			
			<div class="content">
				<jsp:include page="<%=pagefile%>" />
			</div>
		</div>
	</div>
</body>
</html>