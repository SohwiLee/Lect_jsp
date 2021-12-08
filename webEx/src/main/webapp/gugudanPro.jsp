<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        table,tr,td{border:1px solid black; text-align:center;}
        td{padding:0 5px;}
    </style>
    <title>Let's Check</title>
</head>
<body>
	<h1>채점</h1>
		<table>
        <thead>
            <tr>
                <td>번호</td>
                <td>정답</td>
                <td>사용자값</td>
                <td>정오표</td>
            </tr>
        </thead>
        <tbody>
	<% request.setCharacterEncoding("UTF-8");
	
	
	int score=0;
	
	for(int i=1;i<6;i++){
		// myanswer
		String myAnswer = request.getParameter("answer"+i);
		String numb1 = request.getParameter("numX"+i);
		String numb2 = request.getParameter("numY"+i);
		// answer to int
		int num1 = Integer.parseInt(numb1);
		int num2 = Integer.parseInt(numb2);
		int answer = num1*num2;
		// OX
		String correct = "";
		
		if(Integer.parseInt(myAnswer)==answer){
			score+=20;
			correct="O";
		}else{
			correct="X";			
		}
		%>
        <tr>
            <td><%=i%></td>
            <td><%= answer %></td>
            <td><%=myAnswer%></td>
            <td><%=correct%></td>
        </tr>
    
		<%
		
	}
	%>
	    </tbody>
    </table>
    <h1>당신의 점수는 <%=score %>점입니다.</h1>
</body>
</html>