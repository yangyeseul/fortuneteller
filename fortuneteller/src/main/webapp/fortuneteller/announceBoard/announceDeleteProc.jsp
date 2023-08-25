<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.announceboard.AnnounceBoardVO" %>
<%@ page import="com.announceboard.AnnounceBoardDAO" %>
<%
int num = Integer.parseInt(request.getParameter("num"));

AnnounceBoardDAO dao = AnnounceBoardDAO.getInstance();
AnnounceBoardVO vo = new AnnounceBoardVO();

vo.setNt_num(num);
dao.deleteAnnounce(vo);
%>
	
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=announceBoardList.jsp"></meta>