<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%@ page import="com.review.ReviewDAO" %>
<%@ page import="com.review.ReviewVO" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/review/css/style_review.css?ver=1.3">
<script type="text/javascript" src="/fortuneteller/review/script.js"></script>
</head>

<%
	request.setCharacterEncoding("UTF-8");

	// content의 ?num, &pageNum 에서 넘어옴
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	try{
		ReviewDAO dbPro = ReviewDAO.getInstance();
		ReviewVO article = dbPro.updateGetArticle(num);
%>

<body>
	<!-- 사용자 후기 작성 폼 -->
	<div class="review_text">
		<span>R E V I E W</span>
	</div>
	
	<br>
	
	<div class="review_div">
		<form action="/fortuneteller/index.jsp?page=reviewUpdateProc.jsp?pageNum=<%= pageNum %>" class="review_form" method="post" name="writeForm" onsubmit="return writeSave()">
	
			<table class="review_table">
				<tr class="review_table_tr">
					<td width="100" align="center">카테고리</td>
					<td colspan="3">
						<select name="category" class="select_category_write">
							<option value="0">카테고리를 선택해 주세요.</option>
							<option value="오늘의 행운룩">오늘의 행운룩</option>
							<option value="수정구슬">수정구슬</option>
							<option value="별자리 운세">별자리 운세</option>
							<option value="띠 운세">띠 운세</option>
						</select>	
					</td>
				</tr>
				
				<tr class="review_table_tr">
					<td align="center">작성자</td>
					<td colspan="3">
						<input type="text" size="80" maxlength="12" name="writer" value="<%= article.getWriter() %>">
						<input type="hidden" name="num" value="<%= article.getNum() %>">
					</td>
				</tr>
				
				<tr class="review_table_tr">
					<td align="center">제목</td>
					<td colspan="3">	
						<input type="text" size="80" maxlength="50" name="title" value="<%= article.getTitle() %>">
					</td>
				</tr>
				
				<tr class="review_table_tr">
					<td align="center">내용</td>
					<td colspan="3">
						<textarea rows="13" cols="80" name="content"><%= article.getContent() %></textarea>
					</td>
				</tr>
				
				<tr class="review_table_tr">
					<td align="center">비밀번호</td>
					<td colspan="3">
						<input type="password" size="10" maxlength="10" name="pass">
					</td>
				</tr>
			</table>
		
			<table class="review_table2">	
				<tr class="review_table2_tr">
					<td align="center" colspan="4">
						<input type="submit" value="MORDIFY">&nbsp;&nbsp;
						<input type="reset" value="RESET">&nbsp;&nbsp;
						<input type="button" value="LIST" onclick="window.location='/fortuneteller/index.jsp?page=review.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
</html>