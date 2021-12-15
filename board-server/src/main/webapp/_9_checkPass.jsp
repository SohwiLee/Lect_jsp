<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkPass</title>
</head>
<body>
<h1>update & delete 권한확인</h1>
    <form action="_10_checkPassPro.jsp" method="post">
        <span>id : </span><input type="text" name="id" value=<%=session.getAttribute("log")%>> <br>
        <span>pw : </span><input type="password" name="pw" id=""><br><br>
        <input type="submit" value="submit">
    </form>
</body>
</html>