<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.review.ReviewDAO" %>
<%@ page import="com.review.ReviewVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %> 

<%! 
// 한 페이지에 보여줄 게시물 수를 지정
int pageSize = 10;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<% 
request.setCharacterEncoding("UTF-8");

String pageNum = request.getParameter("pageNum");

if(pageNum == null) {
	pageNum = "1";
} 

String category = "수정구슬";

int currentPage = Integer.parseInt(pageNum);

// 시작행
int startRow = (currentPage - 1) * pageSize + 1;
// 마지막행
int endRow = currentPage * pageSize;

int count = 0;
int searchCount = 0;

// 검색 값 가져오기
String searchCondition = request.getParameter("searchCondition");
String searchKeyword = request.getParameter("searchKeyword");

List<ReviewVO> articleList = null;
List<ReviewVO> searchArticleList = null;

ReviewDAO dbPro = ReviewDAO.getInstance();

// 게시판 전체 글 수
int totalCount = dbPro.getArticleCount(); 

// 카테고리 전체 글 수
count = dbPro.getCategoryCount(category);

// 검색 글 수
searchCount = dbPro.getCategorySearchCount(searchCondition, searchKeyword, category);

if(count > 0 && searchKeyword == null) {
	articleList = dbPro.getCategoryArticles(startRow, endRow, category);
}

if(searchCount > 0) {
	searchArticleList = dbPro.getCategorySearchList(startRow, endRow, searchCondition, searchKeyword, category);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FortuneTeller</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/review/css/style_review.css?ver=1.3">
<script type="text/javascript" src="/fortuneteller/review/script.js"></script>
</head>
<body>
	<div class="review_text">
		<span>R E V I E W</span>
	</div>
	
	<div class="list_button_write">
		<select name="category" id="category" class="select_category" onchange="location.href=this.value">
			<option name="category" value="/fortuneteller/index.jsp?page=review.jsp">모두 보기: <%= totalCount %></option>
			<option name="category" value="/fortuneteller/index.jsp?page=reviewOotd.jsp">오늘의 행운룩</option>
			<option name="category" value="/fortuneteller/index.jsp?page=reviewCrystal.jsp" selected>수정구슬</option>
			<option name="category" value="/fortuneteller/index.jsp?page=reviewStarsign.jsp">별자리 운세</option>
			<option name="category" value="/fortuneteller/index.jsp?page=reviewZodiac.jsp">띠 운세</option>
		</select>
		
		<%
		    String loginID = (String) session.getAttribute("loginID");
        
		    if(loginID != null) {
		%>
		<a href="/fortuneteller/index.jsp?page=reviewWriteForm.jsp">WRITE</a>
		<% } %>
		
	</div>
	
	<div class="list_container">
		<form class="list_form">
			<table class="list_table_03">
			<% if(count == 0) { // 글이 없을 때 %>
				<tr height="40" colspan="6">
					<td align="center" height="40"><div class="nocontents">게시판에 저장된 글이 없습니다.</td>
				</tr>
			<% } else { // 글이 있을 때 
					if(count > 0 && searchCount == 0 && searchKeyword == null) {
						int number = count - (currentPage - 1) * pageSize;
			%>
				<tr height="40">
					<th class="list_table_03_td" align="center" width="50" height="40">번호</th>
					<th class="list_table_03_td" align="center" width="110">카테고리</th>
					<th class="list_table_03_td" align="center" width="420">제목</th>
					<th class="list_table_03_td" align="center" width="80">작성자</th>
					<th class="list_table_03_td" align="center" width="90">작성일</th>
					<th class="list_table_03_td" align="center" width="50">조회</th>
				</tr>
				
				<%
						for(int i = 0; i < articleList.size(); i++) {
							ReviewVO article = (ReviewVO)articleList.get(i);	
				%>
				
				<tr height="40" height="40">
					<td class="list_table_03_td" width="50" align="center">
						<%= number-- %>
					</td>
					<td class="list_table_03_td, list_category" width="110" align="center">
						<%= article.getCategory() %>
					</td>
					<td align="left" class="list_table_03_td" width="420">
						&nbsp;&nbsp;&nbsp;	
						<a href="/fortuneteller/index.jsp?page=content.jsp?num=<%=article.getNum()%>&pageNum=<%= currentPage %>">
							<%= article.getTitle() %>
						</a>
	
						<% if(article.getReadcount() >= 5) { %>
							<img alt="" src="img/hot.gif" border="0" height="16">
						<% } %>	
					</td>
					<td align="center" class="list_table_03_td" width="80">
						<%= article.getWriter() %>
					</td>
					<td align="center" class="list_table_03_td, list_date" width="90">
						<%= sdf.format(article.getPostdate()) %>
					</td>
					<td align="center" class="list_table_03_td" width="50">
						<%= article.getReadcount() %>
					</td>
				</tr>
				<% 
						}
					} else if(count > 0 && searchCount != 0) { // 검색한 데이터가 있으면
						int number = searchCount - (currentPage - 1) * pageSize;
				%>
				
				<tr height="40">
					<th class="list_table_03_td" align="center" width="50" height="40">번호</th>
					<th class="list_table_03_td" align="center" width="110">카테고리</th>
					<th class="list_table_03_td" align="center" width="420">제목</th>
					<th class="list_table_03_td" align="center" width="80">작성자</th>
					<th class="list_table_03_td" align="center" width="90">작성일</th>
					<th class="list_table_03_td" align="center" width="50">조회</th>
				</tr>
				
				<%
						for(int i = 0; i < searchArticleList.size(); i++) {
							ReviewVO article = (ReviewVO)searchArticleList.get(i);
				%>
				
				<tr height="40" height="40">
					<td class="list_table_03_td" width="50" align="center">
						<%= number-- %>
					</td>
					<td class="list_table_03_td, list_category" width="110" align="center">
						<%= article.getCategory() %>
					</td>
					<td align="left" class="list_table_03_td" width="420">
						&nbsp;&nbsp;&nbsp;	
						<a href="/fortuneteller/index.jsp?page=content.jsp?num=<%=article.getNum()%>&pageNum=<%= currentPage %>&searchCondition=<%= searchCondition %>&searchKeyword=<%= searchKeyword %>">
							<%= article.getTitle() %>
						</a>
	
						<% if(article.getReadcount() >= 5) { %>
							<img alt="" src="img/hot.gif" border="0" height="16">
						<% } %>	
					</td>
					<td align="center" class="list_table_03_td" width="80">
						<%= article.getWriter() %>
					</td>
					<td align="center" class="list_table_03_td, list_date" width="90">
						<%= sdf.format(article.getPostdate()) %>
					</td>
					<td align="center" class="list_table_03_td" width="50">
						<%= article.getReadcount() %>
					</td>
				</tr>
				<% 
						}
					} else { // 검색한 글이 없으면
				%>
				<tr height="40"  colspan="6">
					<td align="center" height="40"><div class="nocontents">검색어에 해당하는 글이 없습니다.</td>
				</tr>
				<%  } %>
			</table>
			<% } %>
			<div class="list_bottom_div">
	<% 
		if(count > 0 && searchCount == 0 && searchKeyword == null) { // 페이징 처리
			int pageBlock = 5; // 페이지 목록 넘기는 버튼 갯수
			int imsi = count % pageSize == 0 ? 0: 1; // 0이면 페이지가 딱 떨어짐 1이면 남은게 다음페이지로 넘어감
			int pageCount = count / pageSize + imsi;
			
			int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > pageBlock) {
	%>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%= startPage - pageBlock %>">[prev]&nbsp;</a>
		<%  }
			
			for(int i = startPage; i <= endPage; i++) {
				if(currentPage == i) {
		%>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%= i %>" class="currentpage"><%= i %></a>&nbsp;
			<%  } else { %>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%= i %>"><%= i %></a>&nbsp;
			<%  } %>
				
		<%	}
			
			if(endPage < pageCount) {
		%>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%= startPage + pageBlock %>">&nbsp;[next]</a>
		<%		
			}
		} else if(searchCount > 0) { // 검색 결과 페이징 처리
			int pageBlock = 5; // 페이지 목록 넘기는 버튼 갯수
			int imsi = searchCount % pageSize == 0 ? 0: 1; // 0이면 페이지가 딱 떨어짐 1이면 남은게 다음페이지로 넘어감
			int pageCount = searchCount / pageSize + imsi;
			
			int startPage = (int)((currentPage - 1) / pageBlock) * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			
			if(endPage > pageCount) {
				endPage = pageCount;
			}
			
			if(startPage > pageBlock) {
	%>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%=startPage - pageBlock %>&searchCondition=<%= searchCondition %>&searchKeyword=<%=searchKeyword%>">[prev]&nbsp;</a>
		<%  }
			
			for(int i = startPage; i <= endPage; i++) {
				if(currentPage == i) {
		%>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%= i %>&searchCondition=<%= searchCondition %>&searchKeyword=<%=searchKeyword%>" class="currentpage"><%= i %></a>&nbsp;
			<%  } else { %>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=<%= i %>&searchCondition=<%= searchCondition %>&searchKeyword=<%=searchKeyword%>"><%= i %></a>&nbsp;
			<%  } %>
				
		<%	}
			
			if(endPage < pageCount) {
		%>
				<a href="/fortuneteller/index.jsp?page=reviewCrystal.jsp?pageNum=%=startPage + pageBlock %>&searchCondition=<%= searchCondition %>&searchKeyword=<%=searchKeyword%>">&nbsp;[next]</a>
		<%		
			}
		}
		%>
			</div>
		</form>
		
		<form method="post" class="list_form2" name="searchForm">
			<select name="searchCondition" class="select">
				<option name="searchCondition" value="writer">작성자</option>
				<option name="searchCondition" value="title">제목</option>
				<option name="searchCondition" value="content">내용</option>
			</select>
			&nbsp;&nbsp;
			<input type="text" class="searchbar" name="searchKeyword" align="center">&nbsp;&nbsp;
			<input type="submit" value="Search" onclick="searchWord()" name="searchButton" class="searchbutton">
		</form>
	</div>
</body>
</html>