<%-- jsp 주석태그 --%>
<!-- 지시자태그(브라우저에게 문서 정보를 전달) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	hello world
	<%
	// jdk 11 / tomcat 9 ver //
	
	// JSP : Java Server Page
	// ㄴ html문서 안에 java문장(코드)을 작성하는 것 
	
	// 1. 지시자 태그 : <%@ % >
	// 2. 주석태그 : <%-- --% >
	// 3. 스크립틀릿 : <% % >
	// 4. 표현식 : <%=% >
	
 	// 스크립틀릿 태그 안에 자바 문장을 작성할 수 있다.
 	int num = 10;
 	System.out.println(num);
	%>
<%-- 
	<%
	num=2;
	while(num<=10){%>
	<h1><%=num %></h1>
	<%num++;
	}
	%>
--%>
	<%--구구단 2~9단 출력--%>
	<%for(int i=2;i<10;i++){%>
		<h1> <%=i %>단</h1>
			<%for(int j=1;j<10;j++){%>
			<p><%=i %> * <%=j %> = <%=i*j %></p>
		<%}%>
		<br>
	<%}%>


</body>
</html>