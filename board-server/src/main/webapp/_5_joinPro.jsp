<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
	<link rel="icon" type="image/png" sizes="96x96" href="https://favicon-generator.org/favicon-generator/htdocs/favicons/2014-12-19/a387e83fdefca59b0f928f867c0120ee.ico">
<style>
</style>
<title>joinPro</title>
</head>
<body>
joinPro.jsp
	<% 
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// 데이터베이스에 가져온 id,pw등록!
		// 데이터베이스와 소통하기 위한 오브젝트 생성!
		// ㄴ DTO(Data Transfer Object) = Bean, VO(read only), Entity Class
	
		UserDAO dao= UserDAO.getInstance();
		UserDTO user= new UserDTO(id,pw,new Timestamp(Calendar.getInstance().getTimeInMillis()));
		
		if(dao.addUser(user) !=-1){
			response.sendRedirect("_1_index.jsp"); //강제로 페이지 넘겨주기
		}else{
			response.sendRedirect("_4_join.jsp");
		}
	%>
		
</body>
</html>