<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
<% System.out.println("log : "+session.getAttribute("log")); %>
<h1> hello, <%=session.getAttribute("log") %>! </h1>
<form action="logout" method="post">
<input type="submit" value="logout">
</form>
</body>
</html>