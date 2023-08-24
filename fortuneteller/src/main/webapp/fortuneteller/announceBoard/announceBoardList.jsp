<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.announceboard.AnnounceBoardVO" %>
<%@ page import="com.announceboard.AnnounceBoardDAO" %>
<%@ page import="java.util.List" %>
 
<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("loginID");
	AnnounceBoardDAO dao = AnnounceBoardDAO.getInstance();
	AnnounceBoardVO vo = new AnnounceBoardVO();
	
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null) {
		pageNum = "1";
	} 
	int count = 0;
	int number = 0;
	
	int pageSize = 10;
	
	int currentPage = Integer.parseInt(pageNum); // null 일때 pageNum = 1 current = 1
	
	// 시작행
	int startRow = (currentPage - 1) * pageSize + 1; // 1
	// 마지막행
	int endRow = currentPage * pageSize; // 10
	
	String keyword = request.getParameter("selectbox");
	String search = request.getParameter("search");
	List<AnnounceBoardVO> list = null;
	
	// 프로젝트로 받아온 값을 한글로 변환 처리
	/* if(search != null){
		search = new String(search.getBytes("utf-8"),"utf-8");
		search = request.getParameter("search");
	} */
	
	if(search == null){// 검색이 아닐때
		count = dao.getBoardCount();
		if(count > 0)
		list = dao.getBoardList(startRow, endRow);
	}else if(search != null){// 검색일때
		count = dao.getBoardCount(keyword, search);
		if(count > 0)
		list = dao.getBoardList(keyword, search, startRow, endRow);
	}
	number = count - (currentPage-1)*pageSize;
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
	<% if(id == null || !id.equals("jhj93")){ %>
	<% }else if(id.equals("jhj93")){ %>
	<div class="list_write">
		<a href="/fortuneteller/index.jsp?page=announceWriteForm.jsp">WRITE</a>
	</div>
	<% } %>
	<div class="list_container">
		<form class="list_form" >
	<% 
		if(count == 0) { // 글이 없을 때 
	%>
			<table class="list_table_03">
				<tr height="40">
					<td align="center" height="40"><div class="nocontents">게시판에 저장된 글이 없습니다.</td>
				</tr>
			</table>
	<% 
		} else { // 글이 있을 때 
	%>
			<table class="list_table_03">
				<tr height="40">
					<th class="list_table_03_td" align="center" width="70" height="40">글번호</th>
					<th class="list_table_03_td" align="center" width="440">제목</th>
					<th class="list_table_03_td" align="center" width="100">작성자</th>
					<th class="list_table_03_td" align="center" width="110">작성일</th>
					<th class="list_table_03_td" align="center" width="70">조회</th>
				</tr>
		<%
			for(int i = 0; i < list.size(); i++) {
				vo = (AnnounceBoardVO)list.get(i);
		%>
				<tr height="40" height="40">
					<td class="list_table_03_td" width="70" align="center">
					<%= number-- %>
					</td>
					<td class="list_table_03_td" width="440" align="center">
					<a href="/fortuneteller/index.jsp?page=announceBoard.jsp&num=<%=vo.getNt_num()%>&readcount=<%=vo.getNt_readcount()%>&rnum=<%= number%>">
						<%= vo.getNt_subject() %></a>
						<% if(vo.getNt_readcount() >= 10) { %>
							<img alt="" src="announceBoard/img/hot.gif" border="0" height="16">
						<% } %>	
					</td>
					<td align="left" class="list_table_03_td" width="100">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<%= vo.getNt_writer() %>
					</td>
					<td align="center" class="list_table_03_td, list_date" width="110">
						<%= vo.getNt_regdate() %>
					</td>
					<td align="center" class="list_table_03_td" width="70">
						<%= vo.getNt_readcount() %>
					</td>
				</tr>
		<%
			}
		%>
			</table>
	<% 
		} 
	%>
			<div class="list_bottom_div">
	<%
		// 페이징 처리
		if(count > 0) {
			int pageBlock = 5;
			int imsi = count % pageSize == 0 ? 0: 1;
			int pageCount = count / pageSize + imsi;
			
			int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			if(startPage > pageBlock) {
				if(search == null){// 검색 아닐때
	%>
				<a href="/fortuneteller/index.jsp?page=announceBoardList.jsp&pageNum=<%= startPage - pageBlock %>">[prev]&nbsp;</a>
	<%			}else{// 검색 일때
		%>
				<a href="/fortuneteller/index.jsp?page=announceBoardList.jsp&pageNum=<%= startPage - pageBlock %>&keyword=<%=keyword%>&search=<%=search%>">[prev]&nbsp;</a>
	<%
				}
			}
			for(int i = startPage; i <= endPage; i++) {
			if(search == null){
	%>
				<a href="/fortuneteller/index.jsp?page=announceBoardList.jsp&pageNum=<%= i %>"><%= i %></a>
	<%		}else{%>
				<a href="/fortuneteller/index.jsp?page=announceBoardList.jsp&pageNum=<%= i %>&keyword=<%=keyword%>&search=<%=search%>"><%= i %></a>
			<% }
			}
			if(endPage < pageCount) {
				if(search == null){
				%>
				<a href="/fortuneteller/index.jsp?page=announceBoardList.jsp&pageNum=<%= startPage + pageBlock %>">&nbsp;[next]</a>
	<%		
			}else{%>
				<a href="/fortuneteller/index.jsp?page=announceBoardList.jsp&pageNum=<%= startPage + pageBlock %>&keyword=<%=keyword%>&search=<%=search%>">&nbsp;[next]</a>
			<% 
					}
				}
		}
	%>
			</div>
		</form>
		<form action="/fortuneteller/index.jsp?page=announceBoardList.jsp" method="post" class="list_form2" name="listForm2">
			<select name="selectbox" class="select">
				<option value="0">---</option>
				<option value="nt_writer">작성자</option>
				<option value="nt_subject">제목</option>
			</select>
			&nbsp;&nbsp;
			<input type="text" name="search" class="searchbar" align="center">&nbsp;&nbsp;
			<input type="submit" value="Search" name="searchButton" class="searchbutton">
		</form>
	</div>
</body>
</html>