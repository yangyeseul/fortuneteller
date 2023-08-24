<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.qnaboard.QnaBoardVO" %>
<%@ page import="com.qnaboard.QnaBoardDAO" %>
<%@ page import="java.sql.*" %>
 
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("loginID");
	String num = request.getParameter("num");
	QnaBoardDAO dao = QnaBoardDAO.getInstance();
	QnaBoardVO vo = new QnaBoardVO();
	
	vo = dao.getBoard(num);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="qnaBoard/qnaCss/qna.css">
</head>
<body>
	<div class="qna_title">
		<span>Q & A</span>
	</div>
	
	<div class="review_div">
		<form action="/fortuneteller/index.jsp?page=qnaUpdateProc.jsp" name="UpdateForm" method="post" class="review_form">
		
			<table class="review_table">
				<tr class="review_table_tr">
					<td align="center">작성자</td>
					<td colspan="3" style="font-size: 20px"><%= id %>&nbsp;</td>
				</tr>
		
				<tr class="review_table_tr">
					<td align="center">제목</td>
					<td colspan="2">	
						<input type="text" size="80" maxlength="50" name="qa_subject" value="<%= vo.getQa_subject() %>">
					</td>
				</tr>
				
				<tr class="review_table_tr">
					<td align="center">내용</td>
					<td colspan="3">
						<textarea rows="13" cols="50" name="qa_content"><%= vo.getQa_content() %></textarea>
					</td>
				</tr>
			</table>
			<input type="hidden" name="num" value="<%=vo.getQa_num()%>">
			<table class="review_table2">	
				<tr class="review_table2_tr">
					<td align="center" colspan="3">
						<input type="submit" value="글수정">&nbsp;&nbsp;
						<input type="reset" value="지우기">&nbsp;&nbsp;
						<input type="button" value="목록으로 돌아가기" onclick="window.location='/fortuneteller/index.jsp?page=qnaBoardList.jsp'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>