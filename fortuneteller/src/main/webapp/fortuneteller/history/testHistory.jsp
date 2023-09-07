<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.history.*,java.util.*,java.text.*" %>
    <jsp:useBean id="dao" class="com.history.HistoryDAO" /> 
    <!--infovo 한군데에 db내용 저장하고 저장한 거불러올거임
    	import 패키지 잘 확인하기 결과 누르기 하면 vo 에 값들 저장하고 dao.insert(vo) 해서 db(history table)에 저장하기
    	constellationCheck page 
      -->
    <%! int pageSize = 8;%>
	<%
		request.setCharacterEncoding("utf-8");
		SimpleDateFormat simpleFormat = new SimpleDateFormat("yyyy. MM. dd");
		String id = (String) session.getAttribute("loginID");
		String pageNum = request.getParameter("pageNum");
		
		String what = request.getParameter("searchWhat");//
		String text = request.getParameter("searchText");
		
	//	List<InfoVO> list  =dao.getInfo(id);
	List<InfoVO> paging =null;	
	
		if(pageNum ==null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		
		
		//시작 행
		int startRow = (currentPage-1) * pageSize +1;//1
		//마지막행
		int endRow = currentPage * pageSize;//4
		
		int count = 0;
		
		
		if(text ==null){
			count = dao.getTestCount(id);//전체 글
			System.out.print(count);
				if(count >0){
					paging = dao.getInfo(startRow,endRow,id);
				}
		}else {//검색이면
					count = dao.getTestCount(what, text ,id);
				if(count >0){
					paging = dao.getInfo(startRow,endRow,what, text ,id);
				}
		}
		
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트 내역</title>
<link type="text/css" rel="stylesheet" href="/fortuneteller/history/testHistory.css">
</head>
<body>

<%if(count==0){ %>
		<span>테스트 내역이 없습니다.</span>

<%}else{ %>
<div class="testHistoryContainer">
	<% 
	for(int i=0;i<paging.size();i++){
		InfoVO vo = (InfoVO) paging.get(i);
	%>
	
	<table  class="testHistoryTable" align="center">
		<tr>
			<td align="center" colspan="2"><a href="<%=vo.getTestPage()%>"><img src="<%=vo.getImage()%>" width="170" height="150" id="historyImg"></a></td>
		</tr>
		<tr>
			<td><a href="<%=vo.getTestPage()%>"><%=vo.getTestName() %></a></td>
		</tr>
		<tr >
			<td id="format"><a href="<%=vo.getTestPage()%>"><%=simpleFormat.format(vo.getRegdate()) %></a></td>
			<td id="historyDelete"><input type="button" value="삭제" onclick="document.location.href='/fortuneteller/history/historyDelete.jsp?num=<%=vo.getNum()%>&pageNum=<%=pageNum%>'"></td>
		</tr>
		
	</table>	
	
	
		<%
	}	
	} %> 
		
</div>


<!-- 페이징 -->
<div class="historyPaging" align="center">
<%if(count>0) {
	
	int pageBlock = 1;//3
	int imsi = count % pageSize ==0 ? 0 : 1;//1일 때는 다음페이지로 0일 때는 딱 떨어짐
	int pageCount = count / pageSize + imsi;
	
	int startPage =(int) ((currentPage -1) / pageBlock) * pageBlock  + 1;
	int endPage = startPage + pageBlock - 1;
	
	if(endPage > pageCount){ 
			endPage = pageCount;
		}
	
	if(startPage > pageBlock) {
		if(text==null){
%>
<a href="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=startPage-pageBlock%>"><&nbsp;&nbsp;</a>

<%}else{%>
<a href="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=startPage-pageBlock%>&searchWhat=<%=what%>&searchText=<%=text%>"><&nbsp;&nbsp;</a>

<%} 
	}
	 	for(int i =startPage; i<=endPage; i++){
	 		if(text==null){
	%>
<a href="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=i%>" id="current_page">&nbsp;<%=i %>&nbsp;</a>

<%}else{ %>
<a href="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=i%>&searchWhat=<%=what%>&searchText=<%=text%>">&nbsp;<%=i %>&nbsp;</a>

<%}
	 	}
	 	
	if(endPage < pageCount){
		if(text==null){
	%>
	<a href="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=startPage+pageBlock%>">&nbsp;&nbsp;></a>
	
	<%}else{ %>
	<a href="/fortuneteller/index.jsp?page=history.jsp&pageNum=<%=startPage+pageBlock%>&searchWhat=<%=what%>&searchText=<%=text%>">&nbsp;&nbsp;></a>
	
<%}
	}
}
	%>
</div>

<div class="historySearch">

		<!--검색폼  -->
	<form action="/fortuneteller/index.jsp?page=history.jsp" method="post" id="historySearchForm" onsubmit="return check()" name="historySearchForm">
		<select name="searchWhat" >
			<!-- <option value="full" align="center">전체보기</option> -->
			<option value="testName" align="center">테스트 이름</option>
			<!-- <option value="regdate"  align="center">날짜</option> -->
		</select>&nbsp; <input type="text" name="searchText" "> &nbsp;<input type="submit" value="Search">
	</form>
	</div>
	
	<script type="text/javascript">
		function check(){
			
			if(document.historySearchForm.searchText.value==""){
				alert("검색어를 입력하세요.");
				document.historySearchForm.searchText.focus();
				return false;
			}
			
		}
	</script>
	
</body>
</html>