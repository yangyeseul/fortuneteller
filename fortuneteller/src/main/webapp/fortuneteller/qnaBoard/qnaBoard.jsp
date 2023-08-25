<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.qnaboard.QnaBoardDAO" %>
    <%@ page import="com.qnaboard.QnaBoardVO" %>
    
    <% 
    request.setCharacterEncoding("UTF-8");
    String num = request.getParameter("num");
    String id = (String)session.getAttribute("loginID");
    int readcount = Integer.parseInt(request.getParameter("readcount"));
   
    
    QnaBoardDAO dao = new QnaBoardDAO();
    QnaBoardVO vo = dao.getBoard(num);
    String writer = vo.getQa_writer();
    
    vo.setQa_num(Integer.parseInt(num));
    dao.setViewCount(vo);
    
    String url = request.getParameter("com");
    if(url == null || url.equals("qnaComForm.jsp")){
    	url = "/fortuneteller/qnaBoard/qnaComForm.jsp";
    } else if(url.equals("qnaComProc.jsp")){
    	url = "/fortuneteller/qnaBoard/qnaComProc.jsp";
    }

    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link rel="stylesheet" href="qnaBoard/qnaCss/qna.css">
</head>
<body>
<script type="text/javascript" src="qnaBoard/script.js"></script>
	<div class="qna_title">
	<span>Q & A</span>
	</div>
	<div class="">
		<table class="list_table_03">
			<tr height="40">
				<th class="list_table_03_td" align="center" width="70" height="40">글번호</th>
				<th class="list_table_03_td" align="center" width="440">제목</th>
				<th class="list_table_03_td" align="center" width="100">작성자</th>
				<th class="list_table_03_td" align="center" width="110">작성일</th>
				<th class="list_table_03_td" align="center" width="70">조회</th>
			</tr>
			<tr>
				<td width="100" align="center"><%= vo.getQa_num() %></td>
				<td width="400" align="center"><%= vo.getQa_subject() %></td>
				<td width="150" align="center"><%= vo.getQa_writer() %></td>
				<td width="150" align="center"><%= vo.getQa_regdate() %></td>
				<td width="100" align="center"><%= vo.getQa_readcount() %></td>
			</tr>
		</table>
	</div>
	<br>
<div align="center">
<br>
	<%= vo.getQa_content() %>
</div>
<br><br><br><br><br>
<div class="commentForm">
<jsp:include page="<%=url %>" /><%-- 댓글 입력 폼 --%>
</div>
<div class="buttons">
<% if(id == null){ %>
<table class="review_table2">
	<tr class="review_table2_tr">
		<td align="center" colspan="1">
			<button><a href="/fortuneteller/index.jsp?page=qnaBoardList.jsp" class="return">목록으로 돌아가기</a></button>
		</td>
	</tr>
</table>
</div>
<% }else if(id.equals("admin")){ %>
<div class="buttons">
<table class="review_table2">
	<tr class="review_table2_tr">
		<td align="center" colspan="3">
			<button><a href="/fortuneteller/index.jsp?page=qnaUpdateForm.jsp&num=<%=num %>" class="update">글 수정</a></button>
			<button><a href="#" class="delete" onclick="deleteCheck()">글 삭제</a></button>
			<button><a href="/fortuneteller/index.jsp?page=qnaBoardList.jsp" class="return">목록으로 돌아가기</a></button>
		</td>
	</tr>
</table>
<% } %>
</div>
</body>
</html>