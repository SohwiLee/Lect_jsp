<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Join</title>
</head>
<body>
<h2>JOIN</h2>
<form action="service" method="post">
<input type="hidden" name="command" value="join">	
	<label for="id">ID</label><br>
	<input type="text" name="id" placeholder="id"><br>
	<label for="pw">PW</label><br>
	<input type="password" name="pw" placeholder="pw">
	<input type="submit" value="Join">
</form>
</body>
</html>