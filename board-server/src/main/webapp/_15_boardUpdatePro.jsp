<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updatePro</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	BoardDAO dao = BoardDAO.getInstance();
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String pw = request.getParameter("password");
	int num = dao.getLists().get(dao.status).getNo();			
	dao.updateBoard(pw, title, content, num);
	
	response.sendRedirect("_8_boardList.jsp");
	%>
</body>
</html>