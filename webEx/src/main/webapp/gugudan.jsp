<%@page import="java.util.Random"%>
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
    <title>Gugudan QnA</title>
</head>
<body>
<% Random ran = new Random(); %>
	<h1>구구단 문제</h1>
    <form method="get" action="gugudanPro.jsp">
    <table>
        <thead>
            <tr>
                <td>번호</td>
                <td>문제</td>
                <td>정답</td>
            </tr>
        </thead>
        <tbody>
        <%
        for(int i = 1; i<6; i++){
        	%>        	
            <tr class="question<%=i%>">
            <%  int numX = ran.nextInt(8)+2;
		        int numY = ran.nextInt(9)+1; %>
                <td><%= i %></td>
                <td>
                	<label for="numb1"><%= numX %></label>
                 	<input type="hidden" id="numb1" value="<%=numX%>" name="numX<%=i%>">
                 	X    
                   	<label for="numb2"><%= numY %></label>
                    <input type="hidden" id="numb2" value="<%=numY%>" name="numY<%=i%>">
                 
                </td>
                <td><input type="text" name="answer<%=i%>" required></td>
            </tr>
        	<%
        }
        %>
        </tbody>
    </table>
    <input type="submit" value="전송">
    </form>
</body>
</html>