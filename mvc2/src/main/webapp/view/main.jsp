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
<form action="service" method="post">
<input type="submit" value="logout">
<input type="hidden" value="logout" name="command">
</form>
</body>
</html>