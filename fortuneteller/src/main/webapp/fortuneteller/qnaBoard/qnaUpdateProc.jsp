<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.qnaboard.QnaBoardVO" %>
	<%@ page import="com.qnaboard.QnaBoardDAO" %>
	<%@ page import="java.sql.*" %>
	<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("loginID");
	String subject = request.getParameter("qa_subject");
	String content = request.getParameter("qa_content");
	int num = Integer.parseInt(request.getParameter("num"));
	
	
	QnaBoardDAO dao = QnaBoardDAO.getInstance();
	QnaBoardVO vo = new QnaBoardVO();
	
	vo.setQa_writer(id);
	vo.setQa_subject(subject);
	vo.setQa_content(content);
	vo.setQa_regdate(new Date(System.currentTimeMillis()));
	vo.setQa_num(num);
	
	dao.updateQna(vo);
	%>
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=qnaBoardList.jsp"></meta>