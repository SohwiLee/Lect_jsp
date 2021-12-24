<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
<h1>index</h1>
<h2>login / join</h2>
<form action="IndexServlet" method="post">
	<input type="submit" name="link" value="login">
	<input type="submit" name="link" value="join">
</form>
<% System.out.println("log : "+session.getAttribute("log")); %>
</body>
</html>