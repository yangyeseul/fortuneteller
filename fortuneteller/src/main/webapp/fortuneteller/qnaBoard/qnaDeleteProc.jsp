<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.qnaboard.QnaBoardVO" %>
<%@ page import="com.qnaboard.QnaBoardDAO" %>
<%
int num = Integer.parseInt(request.getParameter("num"));

QnaBoardDAO dao = QnaBoardDAO.getInstance();
QnaBoardVO vo = new QnaBoardVO();

vo.setQa_num(num);
dao.deleteQna(vo);
%>
<meta http-equiv="refresh" content="0; url=/fortuneteller/index.jsp?page=qnaBoardList.jsp"></meta>