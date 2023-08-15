<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<script type="text/javascript" src="script.js"></script>
</head>

<%
	//검색 값 가져오기
	String searchCondition = request.getParameter("searchCondition");
	String searchKeyword = request.getParameter("searchKeyword");

	// list.jsp 제목 td에 잇는,,, ?num, &pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	try {
		ReviewDAO dbPro = ReviewDAO.getInstance();
		ReviewVO article = dbPro.getArticle(num);

%>

<body>
	<div class="review_text">
		<span>R E V I E W</span>
	</div>
	
	<div class="review_div">
		<form action="" class="review_form">
			<table class="review_table">
				<tr class="review_table_tr_content">
					<th>카테고리</th>
					<td colspan="3"><%= article.getCategory() %></td>
				</tr>
				
				<tr class="review_table_tr_content">
					<th>조회</th>
					<td colspan="3"><%= article.getReadcount() %></td>
				</tr>
				
				<tr class="review_table_tr_content">
					<th>작성일</th>
					<td colspan="3"><%= sdf.format(article.getPostdate()) %></td>
				</tr>
				
				<tr class="review_table_tr_content">
					<th>작성자</th>
					<td colspan="3"><%= article.getWriter() %></td>
				</tr>
				
				<tr class="review_table_tr_content">
					<th>제목</th>
					<td colspan="3"><%= article.getTitle() %></td>
				</tr>
				
				<tr class="review_table_tr_content">
					<th>내용</th>
					<td colspan="3" style="padding:15px 0px;">
						<pre><%= article.getContent() %></pre>
					</td>
				</tr>
			</table>
			
			<table class="review_table2">	
				<tr class="review_table2_tr">
					<td align="center" colspan="4">
					<%
					    String loginID = (String) session.getAttribute("loginID");
			        
					    if(loginID != null) { // 아이디가 일치하면 (으로 수정해야됨)
					%>
						<%
							if(searchCondition == null && searchKeyword == null) { // 검색을 하지 않았을 때
						%>
						<input type="button" value="MODIFY" onclick="document.location.href='/fortuneteller/index.jsp?page=reviewUpdateForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'">
						&nbsp;&nbsp;
						
						<input type="button" value="DELETE" onclick="document.location.href='/fortuneteller/index.jsp?page=reviewDeleteForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>'">
						&nbsp;&nbsp;
						
						<input type="button" value="LIST" onclick="history.back()">
						&nbsp;
						<%		
							} else { // 검색 기능을 사용하였을 때
						%>
						<input type="button" value="MODIFY" onclick="document.location.href='/fortuneteller/index.jsp?page=reviewUpdateForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>&searchCondition=<%= searchCondition %>&searchKeyword=<%= searchKeyword %>'">
						&nbsp;&nbsp;
						
						<input type="button" value="DELETE" onclick="document.location.href='/fortuneteller/index.jsp?page=reviewDeleteForm.jsp?num=<%= article.getNum() %>&pageNum=<%= pageNum %>&searchCondition=<%= searchCondition %>&searchKeyword=<%= searchKeyword %>'">
						&nbsp;&nbsp;
						
						<input type="button" value="LIST" onclick="history.back()">
						&nbsp;
						<%	} %>
					<%  } else { // 아이디가 일치하지 않으면 %>
						<input type="button" value="LIST" onclick="history.back()">
					<%	} %>
					</td>
				</tr>
			</table>
<%
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
		</form>
	</div>
</body>
</html>