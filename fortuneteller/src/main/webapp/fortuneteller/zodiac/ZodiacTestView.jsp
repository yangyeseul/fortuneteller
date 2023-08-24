<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="stylesheet" href="zodiac/zodiac.css">
<body>
<div align="center">
<img alt="" src="zodiac/img/빅데이터.jpg" width="550" style="border-radius: 30px">
<h1>안녕하십니까 휴먼??</h1>
<br>
빅데이터로 아나타의 운세를 미세테 아게마스.
<br><br>
아래의 버튼을 눌러 원하는 테스트를 센타크 쿠다사이
<br>
<div align="center" class="image">
<a type="button" href="/fortuneteller/index.jsp?page=ZodiacCheck.jsp&check=today" name="today">
<img src="zodiac/img/아이수정.png" alt="" align="center" width="270" border="0" style="border-radius: 80px">
</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a type="button" href="/fortuneteller/index.jsp?page=ZodiacCheck.jsp&check=tomorrow" name="tomorrow">
<img src="zodiac/img/카나수정.png" alt="" align="center" width="270" border="0" style="border-radius: 80px">
</a>
</div>
</div>
</body>
</html>