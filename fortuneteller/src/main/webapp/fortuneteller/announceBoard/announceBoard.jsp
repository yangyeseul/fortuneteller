<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.announceboard.AnnounceBoardVO" %>
    <%@ page import="com.announceboard.AnnounceBoardDAO" %>
    
    <% request.setCharacterEncoding("UTF-8");
    String num = request.getParameter("num");
    String id = (String)session.getAttribute("loginID");
    int readcount = Integer.parseInt(request.getParameter("readcount"));
    int rnum = Integer.parseInt(request.getParameter("rnum"));
    
    AnnounceBoardDAO dao = new AnnounceBoardDAO();
    AnnounceBoardVO vo = dao.getBoard(num);
    vo.setNt_num(Integer.parseInt(num));
    dao.setViewCount(vo);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<link rel="stylesheet" href="announceBoard/announceCss/announce.css">
</head>
<body>
<script type="text/javascript" src="announceBoard/script.js"></script>
	<div class="notice_title">
	<span>N O T I C E</span>
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
				<td width="100" align="center"><%= rnum+1 %></td>
				<td width="400" align="center"><%= vo.getNt_subject() %></td>
				<td width="150" align="center"><%= vo.getNt_writer() %></td>
				<td width="150" align="center"><%= vo.getNt_regdate() %></td>
				<td width="100" align="center"><%= vo.getNt_readcount() %></td>
			</tr>
		</table>
	</div>
	<br>
<div align="center">
	<%= vo.getNt_content() %>
</div>
<br><br><br><br><br>
<div class="buttons">
<% if(id == null || !id.equals("jhj93")){ %>
<table class="review_table2">
	<tr class="review_table2_tr">
		<td align="center" colspan="1">
			<button><a href="/fortuneteller/index.jsp?page=announceBoardList.jsp" class="return">목록으로 돌아가기</a></button>
		</td>
	</tr>
</table>
<% }else if(id.equals("jhj93")){ %>
<table class="review_table2">
	<tr class="review_table2_tr">
		<td align="center" colspan="4">
			<button><a href="/fortuneteller/index.jsp?page=announceUpdateForm.jsp&num=<%=num %>" class="update">글 수정</a></button>
			<button><a href="#" class="delete" onclick="deleteCheck()">글 삭제</a></button>
			<button><a href="/fortuneteller/index.jsp?page=announceBoardList.jsp" class="return">목록으로 돌아가기</a></button>
		</td>
	</tr>
</table>
<% } %>
</div>
</body>
</html>