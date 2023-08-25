<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("utf-8");
    String id = (String)session.getAttribute("loginID");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="stylesheet" href="zodiac/zodiac.css">
<body>
<% if(id == null){ %>
<script type="text/javascript">
alert("로그인 후 이용해 주세요");
window.location='index.jsp?page=login.jsp';
</script>
<% }else if(id != null){ %>
<div align="center">
<img alt="" src="zodiac/img/테스트 배너.png" width="550" style="border-radius: 30px">
<div align="center" style="font-size: 17px"><br>
별의 아이들이 너의 <h3 style="color: EB3535">운세를</h3>알아봐 줄게!<br>
아래의 버튼을 눌러 원하는 <h3 style="display: inline">테스트를</h3> 선택해줘!</div>
<div align="center" class="image">
<a type="button" href="/fortuneteller/index.jsp?page=ZodiacCheck.jsp&check=today" name="today">
<img src="zodiac/img/아이.png" alt="" align="center" width="200" border="0" style="border-radius: 80px">
</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a type="button" href="/fortuneteller/index.jsp?page=ZodiacCheck.jsp&check=tomorrow" name="tomorrow">
<img src="zodiac/img/카나.png" alt="" align="center" width="200" border="0" style="border-radius: 80px">
</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a type="button" href="/fortuneteller/index.jsp?page=ZodiacCheck.jsp&check=week" name="week">
<img src="zodiac/img/루비.png" alt="" align="center" width="200" border="0" style="border-radius: 80px">
</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a type="button" href="/fortuneteller/index.jsp?page=ZodiacCheck.jsp&check=nweek" name="nweek">
<img src="zodiac/img/아쿠아.png" alt="" align="center" width="200" border="0" style="border-radius: 80px">
</a>
</div>
</div>
<%} %>
</body>
</html>