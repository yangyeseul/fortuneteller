<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.qnaboard.comment.QnaCommentVO" %>
	<%@ page import="com.qnaboard.comment.QnaCommentDAO" %>
	<%@ page import="java.sql.*" %>
	<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("loginID");
	String comment = request.getParameter("qa_comment");
	int num = Integer.parseInt(request.getParameter("num"));
	int readcount = Integer.parseInt(request.getParameter("readcount"));
	
	QnaCommentDAO dao = QnaCommentDAO.getInstance();
	QnaCommentVO vo = new QnaCommentVO();
	
	vo.setCom_writer(id);
	vo.setCom_content(comment);
	vo.setCom_regdate(new Date(System.currentTimeMillis()));
	vo.setCom_num(num);
	
	dao.insertComment(vo);
	
	%>
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=qnaBoard.jsp&num=<%=num %>&readcount=<%=readcount %>"></meta>

