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
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/member/memberCSS/modify_sytle.css">
<script type="text/javascript" src="script.js"></script>
</head>
<body>

	<div class="check">
		<a href="/fortuneteller/index.jsp?page=mypage_modify.jsp">
			<button class="button" id="modInputBtn">회원정보 수정</button>
		</a> &nbsp;&nbsp;
		<a href="/fortuneteller/index.jsp?page=testHistory.jsp&pageNum=1">
			<button class="button" id="modInputBtn_before">이전결과 확인</button>
		</a>
	</div>
	
	<form action="member/modifyProc.jsp" method="post" name="modifyForm" class="modifyForm">
		<table cellpadding="5" class="regForm_text"cellspacing="15" width="500">
			<!-- <div class="reg_text"><span>회원정보</span>를 입력해 주세요</div> -->
			<tr>
				<td align="center">아이디</td>
				
				<td align="center">
					<div class="form" id="idForm">
						<%=loginID %>
					</div>
				</td>
			</tr>

			<tr>
				<td>비밀번호</td>
				<td align="center">
					<div class="form">
						<input type="password" name="pass" value="<%=daoPro.getPass()%>">
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
				<td align="center">
					<div class="form" id="nameForm">
						<%=daoPro.getName() %>
					</div>
				</td>
			</tr>

			<tr>
				<td>이메일</td>
				<td align="right">
					<div class="form">
						<input type="email" name="email" value="<%=daoPro.getEmail()%>">
					</div>
				</td>
			</tr>
			<%if(gender.equals("남자")){ %>
			<tr>
				<td>성별</td>
				<td>
					<div class="mb-3">
						<div class=" row-vh d-flex flex-row justify-content-between">
							<div class="form_radio_btn">
								<input id="radio-1" type="radio" name="gender" value="남자" checked> 
								<label for="radio-1">남성</label>
							</div>

							<div class="form_radio_btn radio_female">
								<input id="radio-2" type="radio" name="gender" value="여자" onclick="return(false);">
								<label for="radio-2">여성</label>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<%}else{ %>
			<tr>
				<td>성별</td>
				<td>
					<div class="mb-3">
						<div class=" row-vh d-flex flex-row justify-content-between">
							<div class="form_radio_btn">
								<input id="radio-1" type="radio" name="gender" value="남자" onclick="return(false);"> 
								<label for="radio-1">남성</label>
							</div>
<!--아니  -->
							<div class="form_radio_btn radio_female">
								<input id="radio-2" type="radio" name="gender" value="여자" checked>
								<label for="radio-2">여성</label>
							</div>
						</div>
					</div>
				</td>
			</tr>
			<%} %>
			<tr>
				<td>생년월일</td>
				<td align="right"><select name="year" class="select">
						<option><%=daoPro.getYear()%></option>
				</select>&nbsp;&nbsp;년 
				&nbsp;&nbsp;&nbsp;&nbsp;
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
				</select>&nbsp;&nbsp;월 
				&nbsp;&nbsp;&nbsp;&nbsp;
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
				</select>&nbsp;&nbsp;일</td>
			</tr>
		</table>
		
		<div class="modifyBtn">
			<input type="button" value="MODIFY" onclick="modifyCheck()" id="modifyBtn">&nbsp;&nbsp;&nbsp;
			<button>
				<a href="/fortuneteller/index.jsp?page=deleteForm.jsp">DELETE</a>
			</button>
			
		</div>
	</form>
</body>
</html>