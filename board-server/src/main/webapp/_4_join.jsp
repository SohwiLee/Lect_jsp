<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
</head>
<body>
	<h1>Join</h1>
    <form action="_5_joinPro.jsp" method="post">
        <span>id : </span><input type="text" name="id" id=""> <br>
        <span>pw : </span><input type="password" name="pw" id=""><br><br>
        <input type="submit" value="가입하기">
    </form>
    
</body>
</html>