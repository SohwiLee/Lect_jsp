<%@page import="board.BoardDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>checkPassPro</title>
</head>
<body>
	<%
	//권한이 필요한 수정,탈퇴 처리 담당
		int dir = -1;
		boolean checkP = false;
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		UserDAO dao = UserDAO.getInstance();
		BoardDAO bdao = BoardDAO.getInstance();		
		
		// true,false로 유저삭제인지 글수정인지 확인하기...
		for(int i=0; i<dao.getUsers().size();i++) {
			if(id.equals(dao.getUsers().get(i).getId()) && pw.equals(dao.getUsers().get(i).getPw())) {
				dir=0;
				checkP=true;
			}
		}	
		
		if (checkP) { // 유저
			if (dir == UserDAO.REMOVE) {
				if (dao.deleteUser(id, pw) == -1) {
					response.sendRedirect("_9_checkPass.jsp");
				} else {
					//탈퇴성공
					session.removeAttribute("log");
					response.sendRedirect("_1_index.jsp");
				}
			}
		} else { // 글
			int check = -1;
			for(int i=0; i<bdao.getLists().size();i++) {
				if(id.equals(bdao.getLists().get(i).getId()) && pw.equals(bdao.getLists().get(i).getPw())) {
					check=i;
				}
			}	
			if(check!=-1){
				bdao.status=check;
				if (bdao.status != -1) {
					response.sendRedirect("_14_boardUpdate.jsp");
				} else {
					response.sendRedirect("_11_boardWrite.jsp");
				}
			} else {
				response.sendRedirect("_9_checkPass.jsp");
			}
		}
	%>
</body>
</html>