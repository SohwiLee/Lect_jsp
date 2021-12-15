<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPro</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		
		if(dao.checkLogin(id, pw)){
			session.setAttribute("log", id);
			response.sendRedirect("_8_boardList.jsp");
		}else{			
			response.sendRedirect("_6_login.jsp");
		}
		
	%>
</body>
</html>