<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.announceboard.AnnounceBoardVO" %>
	<%@ page import="com.announceboard.AnnounceBoardDAO" %>
	<%@ page import="java.sql.*" %>
	<% 
	request.setCharacterEncoding("UTF-8");

	String id = (String)session.getAttribute("loginID");
	String subject = request.getParameter("nt_subject");
	String content = request.getParameter("nt_content");
	int num = Integer.parseInt(request.getParameter("num"));
	
	
	AnnounceBoardDAO dao = AnnounceBoardDAO.getInstance();
	AnnounceBoardVO vo = new AnnounceBoardVO();
	
	vo.setNt_writer(id);
	vo.setNt_subject(subject);
	vo.setNt_content(content);
	vo.setNt_adjudate(new Date(System.currentTimeMillis()));
	vo.setNt_num(num);
	
	dao.updateAnnounce(vo);
	%>
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=announceBoardList.jsp"></meta>