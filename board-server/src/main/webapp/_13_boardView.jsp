<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>boardView</title>
</head>
<body>
	<% BoardDAO dao = BoardDAO.getInstance();%>
    <div class="wrap">
        <form action="_9_checkPass.jsp">
	        <table border="1px solid black" style="width:100%">
	        <%
	        	String idx = request.getParameter("idx");
		        dao.status=Integer.parseInt(idx);
		       System.out.println("idx:"+idx);
	        %>
	            <tr>
	                <td>제목</td>
	                <td><%= dao.getLists().get(Integer.parseInt(idx)).getTitle()%></td>
	            </tr>
	            <tr>
	                <td>작성자</td>
	                <td><%= dao.getLists().get(Integer.parseInt(idx)).getId()%></td>
	            </tr>
	            <tr>
	                <td>내용</td>
	                <td><%= dao.getLists().get(Integer.parseInt(idx)).getContent() %></td>
	            </tr>
	        </table>
	        <input type="button" value="좋아요" name="like" onclick="location.href='_15_boardLikeUpdatePro.jsp'">
	        <input type="button" value="목록으로" onclick="location.href='_8_boardList.jsp'">
	        <% 
	        	if(dao.getLists().get(Integer.parseInt(idx)).getId().equals(session.getAttribute("log"))){
	        %>	        		
	        <button onclick="location.href='_9_checkPass.jsp'">수정/삭제하기</button>
	        <% 
	        	}
	        %>
        </form>
    </div>

</body>
</html>