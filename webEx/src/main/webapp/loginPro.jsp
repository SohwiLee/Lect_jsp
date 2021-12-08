<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login Processing Page</title>
</head>
<body>
loginPro 페이지입니다.
<%-- login Processing Page --%>
	<%
	// URI 쿼리 구간에(?이후) 파라미터1=값1&파라미터2=값2... 요청과 함께 전달된 값이 받아짐
	// get방식 : http://localhost:8081/webEx/loginPro.jsp?id=1&pw=1
	// post방식 : http://localhost:8081/webEx/loginPro.jsp
	// 브라우저단에서 필터링 >> 한글같은 경우 깨진다 >> 인코딩 필요!
	request.setCharacterEncoding("UTF-8");
	
	// jsp의 내장객채 중, request
	String id = request.getParameter("id"); // id파라미터 명을 가지고있는 데이터 처리!
	String pw = request.getParameter("pw");
	
	// 폼예제
	// gugudan.jsp
	// 2~9단까지 랜덤으로 5개문제 출제 (table)
	// 사용자가 문제에 대한 답을 입력하도록(input > request)
	// gugudatPro.jsp 
	// 넘어온 파라미터를 바탕으로 성적표 출력(정오표)
	%>
	<h1>id : <%= id %></h1>
	<h1>pw : <%= pw %></h1>
</body>
</html>