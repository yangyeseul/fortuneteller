<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.announceboard.AnnounceBoardVO" %>
<%@ page import="com.announceboard.AnnounceBoardDAO" %>
<%@ page import="java.sql.*" %>
 
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("loginID");
	String num = request.getParameter("num");
	AnnounceBoardDAO dao = AnnounceBoardDAO.getInstance();
	AnnounceBoardVO vo = new AnnounceBoardVO();
	
	vo = dao.getBoard(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="announceBoard/announceCss/announce.css">
</head>
<body>
	<div class="notice_title">
		<span>N O T I C E</span>
	</div>
	
	<div class="review_div">
		<form action="/fortuneteller/index.jsp?page=announceUpdateProc.jsp" name="UpdateForm" method="post" class="review_form">
		
			<table class="review_table">
				<tr class="review_table_tr">
					<td align="center">작성자</td>
					<td colspan="3" style="font-size: 20px"><%= id %>&nbsp;(관리자)</td>
				</tr>
		
				<tr class="review_table_tr">
					<td align="center">제목</td>
					<td colspan="2">	
						<input type="text" size="80" maxlength="50" name="nt_subject" value="<%= vo.getNt_subject() %>">
					</td>
				</tr>
				
				<tr class="review_table_tr">
					<td align="center">내용</td>
					<td colspan="3">
						<textarea rows="13" cols="50" name="nt_content"><%= vo.getNt_content() %></textarea>
					</td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=vo.getNt_num()%>">
			<table class="review_table2">	
				<tr class="review_table2_tr">
					<td align="center" colspan="3">
						<input type="submit" value="글수정">&nbsp;&nbsp;
						<input type="reset" value="지우기">&nbsp;&nbsp;
						<input type="button" value="목록으로 돌아가기" onclick="window.location='/fortuneteller/index.jsp?page=announceBoardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>