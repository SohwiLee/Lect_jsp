<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board List</title>
</head>
<body>
<% BoardDAO dao = BoardDAO.getInstance(); %>
	<%--
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardDTO> datas = new ArrayList<>();
		for(int i=0;i<dao.getLists().size();i++){
			BoardDTO boardLists = datas.get(i);
			System.out.println(boardLists.getTitle());
		}
	--%>
    <button onclick="location.href='_1_index.jsp'">logOut</button>
    <button onclick="location.href='_9_checkPass.jsp'">탈퇴</button>
    <h1>Board List</h1>
     <div class="warp">
        <table border="1px solid black" style="width:100%">
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>좋아요</td>
                <td>작성일</td>
            </tr>
   	        <% for(int i=0;i<dao.getLists().size();i++){ %>
            <tr>
                <td><%= dao.getLists().get(i).getNo() %></td>
             <!--  <td><a href="_13_boardView.jsp"><%-- = dao.getLists().get(i).getTitle() --%></a></td> -->   
                <td>
                	<a href="_13_boardView.jsp?idx=<%=i%>"><label><%= dao.getLists().get(i).getTitle() %></label></a>
                	<input type="hidden" name="idx" value=<%=i%>>
                </td>
                <td><%= dao.getLists().get(i).getId() %></td>
                <td><%= dao.getLists().get(i).getLikes() %></td>
                <td><%= dao.getLists().get(i).getRegDate() %></td>
            </tr>
            <% } %>
        </table>
    <button onclick="location.href='_11_boardWrite.jsp'">글쓰기</button>
    </div>
    
   
</body>
</html>