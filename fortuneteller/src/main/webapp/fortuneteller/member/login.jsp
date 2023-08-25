<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
//★ 본인 테스트 페이지에서 page 파라미터 값 받아옴
String referer = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/loginForm_sytle.css">
</head>
<body>
	<%-- //★ 본인 테스트 페이지의 page값과 함께 loginProc로 넘겨줌 --%>
	<%
	if(referer == null) {
	%>
	<form action="member/loginProc.jsp" method="post" name="loginForm" id="loginForm">
		<script type="text/javascript" src="script.js"></script>
	
			<div class="login_text">
				<span>로그인</span> 후 다양한 테스트를<br> 이용해 보실 수 있습니다.
			</div>
			<table cellpadding="10" cellspacing="15">
	
				<tr id="loginId">
					<td>아이디</td>
					<td>
						<div class="form">
							<input type="text" name="id">
						</div>
					</td>
				</tr>
				<tr id="loginPass">
					<td>비밀번호</td>
					<td>
						<div class="form">
							<input type="password" name="pass">
						</div>
					</td>
				</tr>
	
				<tr>
					<td colspan="2">
						<div class="form" id="LoginBtn">
							<input type="button" value="로그인" onclick="loginCheck()" class="loginBtn">
						</div>
					</td>
				</tr>
			</table>
		</form>
	<% } else { %>
	<form action="member/loginProc.jsp?page=<%= referer %>" method="post" name="loginForm" id="loginForm">
		<script type="text/javascript" src="script.js"></script>

		<div class="login_text">
			<span>로그인</span> 후 다양한 테스트를<br> 이용해 보실 수 있습니다.
		</div>
		<table cellpadding="10" cellspacing="15">

			<tr id="loginId">
				<td>아이디</td>
				<td>
					<div class="form">
						<input type="text" name="id">
					</div>
				</td>
			</tr>
			<tr id="loginPass">
				<td>비밀번호</td>
				<td>
					<div class="form">
						<input type="password" name="pass">
					</div>
				</td>
			</tr>

			<tr>
				<td colspan="2">
					<div class="form" id="LoginBtn">
						<input type="button" value="로그인" onclick="loginCheck()" class="loginBtn">
					</div>
				</td>
			</tr>
		</table>
	</form>
	<%
	}
	
	System.out.println(referer);
	%>
</body>
</html>