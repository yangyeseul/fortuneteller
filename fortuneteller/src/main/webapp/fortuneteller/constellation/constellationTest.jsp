<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/constellation/constellationCSS/constellation_style.css">
<script type="text/javascript" src="script1.js"></script>
<style type="text/css">

 .parents {
    display: flex;
    flex-direction: column;
  }
  #resultBtn1 {
    order: 2;
  }
  #resultBtn2 {
    order: 1;
  } 

</style>

</head>
<body>
<jsp:include page="constellationIndex.jsp" />
<div class="loader">
        <div class="loading_1"></div>
        <div id="loading_2">결과 추출 중</div>
    </div>

  <br><br>
  
<div class="parents">
	<div align="center" id="resultBtn1"><a href="#"><input type="button" value="결과보기"></a></div>
	<div align="center" id="resultBtn2"><a href="/fortuneteller/constellation/constellationTestResult.jsp"><input type="button" value="결과보기"></a></div>
	<div id="image"><img src="/fortuneteller/constellation/constellationImg/우주인.jpg"><div>
</div>

<!--  -->
</body>
</html>