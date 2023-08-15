<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/regForm_sytle.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>
	<form action="member/regProc.jsp" method="post" name="regForm">
		<table cellpadding="5" class="regForm_text"cellspacing="15" width="500">
		<div class="reg_text"><span>회원정보</span>를 입력해 주세요</div>
			<tr>
				<td align="center">아이디</td>
				
				<td align="right">
					<div class="form" id="idForm">
						<input type="text" name="id">
						<input type="button" value="CHECK" onclick="idCheck(this.form.id.value)" id="idCheckBtn">
					</div>
				</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td align="right">
					<div class="form">
						<input type="password" name="pass">
					</div>
				</td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td align="right">
					<div class="form">
						<input type="password" name="repass">
					</div>
				</td>
			</tr>

			<tr>
				<td>이름</td>
				<td align="right">
					<div class="form" id="nameForm">
						<input type="text" name="name">
					</div>
				</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td align="right">
					<div class="form">
						<input type="email" name="email">
					</div>
				</td>
			</tr>
			
			<tr>
			<td>
				성별&nbsp;</td>
				<td align="right">
					<div class="mb-3">
						<div
							class="form_toggle row-vh d-flex flex-row justify-content-between">
							<div class="form_radio_btn">
								<input id="radio-1" type="radio" name="gender" value="male"
									checked> <label for="radio-1">남성</label>
							</div>

							<div class="form_radio_btn radio_female">
								<input id="radio-2" type="radio" name="gender" value="female">
								<label for="radio-2">여성</label>
							</div>
						</div>
					</div>
					</td>
		</tr>
			<tr>
				<td>생년월일</td>
				<td align="right"><select name="year" class="select">
						<%
						for (int i = 2023; i >= 1920; i--) {
						%>
						<option><%=i%></option>
						<%
						}
						%>
				</select>&nbsp;&nbsp;년 
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="month" class="select">
						<%
						for (int i = 1; i < 13; i++) {
							if (i < 10) {
						%>
						<option>0<%=i%></option>
						<%
						} else {
						%>
						<option><%=i%></option>
						<%
						}
						}
						%>
				</select>&nbsp;&nbsp;월 
				&nbsp;&nbsp;&nbsp;&nbsp;
				<select name="day" class="select">
						<c:forEach begin="1" end="31" var="num">
							<c:if test="${num<10}">
								<option>0${num}</option>
							</c:if>
							<c:if test="${num>9}">
								<option>${num}</option>
							</c:if>
						</c:forEach>
				</select>&nbsp;&nbsp;일</td>
			</tr>
			<tr>
				<td colspan="2"><div class="regBtn"><input type="button" value="JOIN"
					onclick="inputCheck()" id="regInputBtn"></div></td>
			</tr>

		</table>
	</form>




</body>
</html>