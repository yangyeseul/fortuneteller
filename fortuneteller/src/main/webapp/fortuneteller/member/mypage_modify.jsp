<%@page import="com.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="dao" class="com.member.MemberDAO" />
<jsp:useBean id="vo" class="com.member.MemberVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
String loginID = (String) session.getAttribute("loginID");
MemberVO daoPro = dao.getMember(loginID);
String gender = daoPro.getGender();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/modify_sytle.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>

	<div class="check">
		<a href="/fortuneteller/index.jsp?page=mypage_modify.jsp">
			<button class="button" id="memberModify" >회원
				정보 수정</button>
		</a> &nbsp;&nbsp;&nbsp; <a
			href="/fortuneteller/index.jsp?page=history.jsp">
			<button class="button" id="history">이전
				결과 확인</button>
		</a>
	</div>
	
	<form action="member/modifyProc.jsp" method="post" name="modifyForm">
		<table cellpadding="5" cellspacing="15">
			<tr>
				<td >아이디</td>
				<td  width="700" >
					<div class="form">
						<%=loginID %>
					</div>
				</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td>
					<div class="form">
						<input type="password" name="pass" value="<%=daoPro.getPass()%>">
					</div>
				</td>
			</tr>

			<tr>
				<td>비밀번호 확인</td>
				<td>
					<div class="form">
						<input type="password" name="repass">
					</div>
				</td>
			</tr>

			<tr>
				<td>이름</td>
				<td>
					<div class="form">
						<%=daoPro.getName() %>
					</div>
				</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td>
					<div class="form">
						<input type="email" name="email" value="<%=daoPro.getEmail()%>">
					</div>
				</td>
			</tr>
			
			<%-- <%if(gender.equals("male")){ %>
			
			<tr>
			<td>
				성별&nbsp;</td>
				<td>
					<div class="mb-3">
						<div
							class=" row-vh d-flex flex-row justify-content-between">
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
		<%}else{ %>
			<tr>
			<td>
				성별&nbsp;</td>
				<td>
					<div class="mb-3">
						<div
							class=" row-vh d-flex flex-row justify-content-between">
							<div class="form_radio_btn">
								<input id="radio-1" type="radio" name="gender" value="male"> 
								<label for="radio-1">남성</label>
							</div>

							<div class="form_radio_btn radio_female">
								<input id="radio-2" type="radio" name="gender" value="female" checked>
								<label for="radio-2">여성</label>
							</div>
						</div>
					</div>
					</td>
		</tr>
		<%} %> --%>
			<tr>
				<td>생년월일</td>
				<td><select name="year" class="select">
						<option><%=daoPro.getYear()%></option>
				</select>년 
				<select name="month" class="select">
						<%
							if (daoPro.getMonth() < 10) {
						%>
						<option>0<%=daoPro.getMonth()%></option>
						<%
						} else {
						%>
						<option><%=daoPro.getMonth()%></option>
						<%
						}
						%>
				</select>월 
				<select name="day" class="select">
						<%
							if (daoPro.getDay() < 10) {
						%>
						<option>0<%=daoPro.getDay()%></option>
						<%
						} else {
						%>
						<option><%=daoPro.getDay()%></option>
						<%
						}
						%>
						
				</select>일</td>
			</tr>
		</table>
				<div class="modifyBtn">
				<input type="button" value="회원정보 수정하기" onclick="modifyCheck()" id="modifyInputBtn">&nbsp;&nbsp;&nbsp;
				<a href="/fortuneteller/index.jsp?page=deleteForm.jsp" id="deleteInputBtn">회원탈퇴</a>
				</div>
	</form>




</body>
</html>