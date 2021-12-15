<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
 <!-- 수정 또는 삭제 -->
 <% BoardDAO dao = BoardDAO.getInstance(); 
 	System.out.print("idx:::"+dao.status);
 	
 %>
	<form action="_15_boardUpdatePro.jsp" method="post">
		<table border="1px solid black" style="width: 100%">
			<tr>
				<td>작성자</td>
				<td><%= session.getAttribute("log")%></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" placeholder="title" value="<%= dao.getLists().get(dao.status).getTitle() %>"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content"><%= dao.getLists().get(dao.status).getContent() %></textarea></td>
			</tr>
			<tr>
				<td>게시글 비밀번호 설정</td>
				<td><input type="password" name="password" placeholder="password"></td>
			</tr>
		</table>
	<input type="button" value="뒤로가기" onclick="location.href='_8_boardList.jsp'">
	<input type="submit" value="수정">
	<input type="button" value="삭제" onclick="removeChk()">
	</form>
	<script>
		function removeChk(){
			if(confirm("이 글을 삭제하시겠습니까?")){
				location.href="_16_boardDeletePro.jsp";
			}
		}
	</script>
</body>
</html>