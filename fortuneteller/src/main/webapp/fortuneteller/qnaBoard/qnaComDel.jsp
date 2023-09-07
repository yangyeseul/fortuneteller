<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.qnaboard.comment.QnaCommentVO" %>
	<%@ page import="com.qnaboard.comment.QnaCommentDAO" %>
	<%@ page import="java.sql.*" %>
	<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("loginID");
	int num = Integer.parseInt(request.getParameter("num"));
	int readcount = Integer.parseInt(request.getParameter("readcount"));
	int rnum = Integer.parseInt(request.getParameter("rnum"));
	int comnum = Integer.parseInt(request.getParameter("comnum"));
	
	QnaCommentDAO dao = QnaCommentDAO.getInstance();
	QnaCommentVO vo = new QnaCommentVO();
	
	vo.setCom_num(comnum);
	
	dao.deleteComment(vo);
	
	%>
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=qnaBoard.jsp&num=<%=num %>&readcount=<%=readcount %>&rnum=<%=rnum%>"></meta>
