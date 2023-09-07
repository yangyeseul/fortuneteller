<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">

<%
	request.setCharacterEncoding("UTF-8");

	String pagefile = request.getParameter("page");

	if(pagefile == null) {
		pagefile = "main.jsp";		
	} else if(pagefile.equals("siteGuide.jsp")){ 
		pagefile = "/fortuneteller/siteguide/" + pagefile;
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
	} else if(pagefile.contains("announceBoardList.jsp")){ // 공지사항 관련
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.contains("announceBoard.jsp")){
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.contains("announceWriteForm.jsp")){
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.contains("announceWriteProc.jsp")){
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.contains("announceDeleteProc.jsp")){
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.contains("announceUpdateForm.jsp")){
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.contains("announceUpdateProc.jsp")){
		pagefile = "/fortuneteller/announceBoard/" + pagefile;
	} else if(pagefile.equals("qnaBoardList.jsp")){ // qna 관련
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaBoard.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaUpdateForm.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaUpdateProc.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaWriteForm.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaWriteProc.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaDeleteProc.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("qnaComProc.jsp")){
		pagefile = "/fortuneteller/qnaBoard/" + pagefile;
	} else if(pagefile.equals("ootd.jsp")) { // 오늘의 행운룩 관련
		pagefile = "/fortuneteller/ootd/" + pagefile;
	} else if(pagefile.contains("ootdMain.jsp")) { 
		pagefile = "/fortuneteller/ootd/" + pagefile;
	} else if(pagefile.contains("ootdTest.jsp")) { 
		pagefile = "/fortuneteller/ootd/" + pagefile;
	} else if(pagefile.contains("ootdResult.jsp")) { 
		pagefile = "/fortuneteller/ootd/" + pagefile;
	} else if(pagefile.equals("constellationMain.jsp")) { // 별자리 운세 관련
		pagefile ="/fortuneteller/constellation/" + pagefile;
	} else if(pagefile.equals("constellationCheck.jsp")) { 
		pagefile ="/fortuneteller/constellation/" + pagefile;
	} else if(pagefile.equals("constellationTest.jsp")) { 
		pagefile ="/fortuneteller/constellation/" + pagefile;
	} else if(pagefile.equals("constellationTestResult.jsp")) { 
		pagefile ="/fortuneteller/constellation/" + pagefile;
	} else if(pagefile.equals("ZodiacTestView.jsp")){ // 띠별 운세
		pagefile = "/fortuneteller/zodiac/" + pagefile;
	} else if(pagefile.equals("ZodiacCheck.jsp")){
		pagefile = "/fortuneteller/zodiac/" + pagefile;
	} else if(pagefile.equals("todayResult.jsp")){
		pagefile = "/fortuneteller/zodiac/" + pagefile;
	} else if(pagefile.equals("tomorrowResult.jsp")){
		pagefile = "/fortuneteller/zodiac/" + pagefile;
	} else if(pagefile.equals("nweekResult.jsp")){
		pagefile = "/fortuneteller/zodiac/" + pagefile;
	} else if(pagefile.equals("weekResult.jsp")){
		pagefile = "/fortuneteller/zodiac/" + pagefile;
	} else if(pagefile.equals("crystalMain.jsp")){		//수정구슬 (시작)
		pagefile = "/fortuneteller/crystal/" + pagefile;
	}else if(pagefile.equals("crystalCheck.jsp")){		
		pagefile = "/fortuneteller/crystal/" + pagefile;
	}else if(pagefile.equals("crystalChat.jsp")){		
		pagefile = "/fortuneteller/crystal/" + pagefile;
	}else if(pagefile.equals("crystalKeyword.jsp")){	
		pagefile = "/fortuneteller/crystal/" + pagefile;
	}else if(pagefile.contains("crystalLoading.jsp")){	
		pagefile = "/fortuneteller/crystal/" + pagefile;
	}else if(pagefile.contains("crystalResult.jsp")){	
		pagefile = "/fortuneteller/crystal/" + pagefile;
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