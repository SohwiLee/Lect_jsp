<%@page import="board.BoardDTO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="user.UserDAO"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WritePro</title>
</head>
<body>

	<%
		request.setCharacterEncoding("UTF-8");
		
		String user = String.valueOf(session.getAttribute("log"));
		String pw = request.getParameter("password");
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		UserDAO uDao = UserDAO.getInstance();
		BoardDAO bDao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO(user,pw,title,content,new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		
	
		if(bDao.status==-1 && bDao.addList(board)!=-1){
			response.sendRedirect("_8_boardList.jsp");
		} else if(bDao.status!=-1){
			System.out.println("수정입니다.");
		}
	%>
</body>
</html>