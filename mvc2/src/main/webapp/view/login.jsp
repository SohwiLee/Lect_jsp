<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
</head>
<body>
	<h2>login</h2>
	<!-- url : login > loginPro.java(servlet) -->
	<form action="login" method="post">
	   <label for="id">ID</label><br>
	   <input type="text" name="id" id="id" placeholder="ID"><br>
	   <label for="pw">PW</label><br>
	   <input type="password" name="pw" id="pw" placeholder="PW"><br>
	   <input type="submit" value="login">
	</form>
</body>
</html>