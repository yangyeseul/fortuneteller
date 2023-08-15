<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="com.member.MemberDAO" />
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/deleteForm_sytle.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
<div class="delete_text">정말 <span>탈퇴</span> 하시겠습니까?</div>
<form action="/fortuneteller/member/deleteProc.jsp" method="post" name="deleteForm" id="deleteForm">
		
		<table cellpadding="10" cellspacing="15">
			<tr id="loginPass">
				<td>비밀번호</td>
				<td>
					<div class="form">
						<input type="password" name="pass">
					</div>
				</td>
			</tr>
			
			<tr id="loginRepass">
				<td>비밀번호 확인</td>
				<td>
					<div class="form">
						<input type="password" name="repass">
					</div>
				</td>
			</tr>
		</table>
		
		<div class="form" id="deleteBtn">
			<input type="button" value="탈퇴하기" onclick="deleteCheck()">
		</div>
	</form>
</body>
</html>