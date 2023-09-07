<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.qnaboard.comment.QnaCommentDAO" %>
    <%@ page import="com.qnaboard.comment.QnaCommentVO" %>
    <%@ page import="java.util.List" %>
    <%
    String id = (String)session.getAttribute("loginID");
    String num = request.getParameter("num");
    int readcount = Integer.parseInt(request.getParameter("readcount"));
    int rnum = Integer.parseInt(request.getParameter("rnum"));
    
    QnaCommentDAO dao = QnaCommentDAO.getInstance();
    QnaCommentVO vo = new QnaCommentVO();
    
    List<QnaCommentVO> list = null;
    
    int count = dao.getCommentCount(num);
    if(count > 0){
    	list = dao.getCommentList(num);
    }else if(count <= 0){
    	count = 0;
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="qnaBoard/qnaCss/qna2.css">
</head>
<body>
<script type="text/javascript" src="qnaBoard/script.js"></script>

<%if(count > 0 && list != null){ 
	for(int i = 0; i < list.size(); i++){ 
		vo = (QnaCommentVO)list.get(i);
		%>
<div>
	<table class="comment_table">
		<tr class="comment_table_tr">
			<td><h4>ID : <%= vo.getCom_writer() %></h4></td>
			<td style="font-size: 15px;">&nbsp;&nbsp;&nbsp;<%= vo.getCom_regdate() %></td>
			<td></td>
		</tr>
		<tr class="comment_table_tr">
			<td>&nbsp;<%= vo.getCom_content() %></td>
			<% if(id == null){ %>
			<% }else if(id != null && id.equals(vo.getCom_writer())) {%><td>
			<td><a href="/fortuneteller/index.jsp?page=qnaBoard.jsp&com=qnaComDel.jsp&num=
			<%= num %>&rnum=<%= rnum %>&readcount=<%= readcount %>&comnum=<%=vo.getCom_num()%>">
			&nbsp;&nbsp;[삭제]</a></td>
			<%} %>
		</tr>
	</table>
</div>
<hr width="300px">
<%
	}
}else if(count == 0 && list == null){%>

<table class="comment_table">
	<tr height="40">
		<td height="40">등록된 댓글이 없습니다.</td><div class="nocontents">
	</tr>
</table>
<br>

<% }%>
<% if(id == null){%>
<% }else if(id.equals("admin")){ %>
<form name="comment" action="/fortuneteller/index.jsp?page=qnaBoard.jsp&com=qnaComProc.jsp" method="post">
<input type="hidden" value="<%= num %>" name="num">
<input type="hidden" value="<%= rnum %>" name="rnum">
<input type="hidden" value="<%= readcount %>" name="readcount">
	<div class="buttons">
		<table class="comment_table">
			<tr class="comment_table_tr">
				<td>댓글&nbsp;<h4>ID : <%= id %></h4></td>
				<td colspan="3">
					<textarea rows="5" cols="70" name="qa_comment" onclick="if(this.value=='내용을 입력해주세요.'){this.value=''}">내용을 입력해주세요.</textarea><br><br>
					<button><a href="#" class="comment" onclick="javascript:document.comment.submit();">
					Comment</a></button>
				</td>
			</tr>
		</table>
	</div>
<% }%>
</form>
</body>
</html>