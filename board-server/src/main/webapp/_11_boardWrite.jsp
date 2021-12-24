<%@page import="board.BoardDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<body>
<%
BoardDAO dao = BoardDAO.getInstance(); System.out.print("idx:::"+dao.status);
%>
	<form action="_12_boardWritePro.jsp" method="post">
		<table border="1px solid black" style="width: 100%">
			<tr>
				<td>작성자</td>
				<td><%= session.getAttribute("log")%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" placeholder="title"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"></textarea></td>
			</tr>
			<tr>
				<td>게시글 비밀번호 설정</td>
				<td><input type="password" name="password" placeholder="password"></td>
			</tr>
		</table>
	<input type="button" value="뒤로가기" onclick="location.href='_8_boardList.jsp'">
	<input type="submit" value="게시">
	</form>
</body>
</html>