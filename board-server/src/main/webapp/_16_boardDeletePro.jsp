<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deletePro</title>
</head>
<body>
	<%
	BoardDAO dao = BoardDAO.getInstance();
		int no = dao.getLists().get(dao.status).getNo();	
		dao.deleteBoard(no);
		response.sendRedirect("_8_boardList.jsp");
	%>
</body>
</html>