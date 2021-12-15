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
	int num =dao.getLists().get(dao.status).getLikes();
	//dao.getLists().get(dao.status).setLikes(num+1);
	dao.setLikeCount(dao.status);
	
	response.sendRedirect("_13_boardView.jsp?idx="+dao.status);
	System.out.println("IDX:"+dao.status);
	%>
</body>
</html>