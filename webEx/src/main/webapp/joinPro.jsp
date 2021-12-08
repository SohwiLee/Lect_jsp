<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
	<link rel="icon" type="image/png" sizes="96x96" href="https://favicon-generator.org/favicon-generator/htdocs/favicons/2014-12-19/a387e83fdefca59b0f928f867c0120ee.ico">
<style>
*{margin:0;padding:0; font-family: 'Noto Sans KR', sans-serif;word-break: keep-all;}
        body{background:#f5f6f7;}
        .wrap{width:450px; margin:80px auto;} 
        h1{color:#08a600;}
        h1,p{text-align: center;margin-bottom:10px;}      
        .table{margin-top:60px;}
        table{width:100%; padding:20px; border:1px solid lightgray;}
        td{padding:10px 20px;}
        tr td:first-child{font-weight:500;}
        tr td:last-child{font-weight:300;}
        .btns{display: flex; justify-content: space-around; margin-top:40px;}
        .btns a{text-decoration: none;background-color: #08a600; padding:20px; color:white; font-weight:300;}
</style>
<title>환영합니다!</title>
</head>
<body>
	<%-- 뒤로가기시 세션만료 추가 --%>
	<%-- ArrayList again --%>
	<% 
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String userName = request.getParameter("name");
		String gender = request.getParameter("gender");
		
		String birtyY=request.getParameter("yy");
		String birtyM=request.getParameter("mm");
		String birtyD=request.getParameter("dd");		
		
		String nationalNum = request.getParameter("national");
		String myTel = request.getParameter("myTel");
		String email = request.getParameter("email");
		 
		ArrayList<String> ids = new ArrayList<>();
		 ArrayList<String> pws = new ArrayList<>();
		ids.add(id);
		pws.add(pw);
		
		System.out.println(ids.size());
		for(int i=0;i<ids.size();i++){
			System.out.println(ids);
		}
		%>
	<div class="wrap">
		<h1><%=id %>님 환영합니다!</h1>
		<p>아래와 같은 정보로 가입하셨습니다.</p>
		<div class="table">
			<table>
				<tr>
					<td>아이디</td>
					<td><%=id %></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><%=userName %></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><%=birtyY %>.<%=birtyM %>.<%=birtyD %></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><%=gender %></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>+<%=nationalNum %>) <%=myTel %></td>
				</tr>
				<tr>
					<td>인증메일</td>
					<td><%=email %></td>
				</tr>
			</table>
			<div class="btns">
	            <a href="http://www.naver.com">메인 페이지로 돌아가기</a>
	            <a href="https://nid.naver.com/nidlogin.login">로그인 페이지로</a>
        	</div>
		</div>
	</div>

</body>
</html>