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
        table,tr,td{border:1px solid black;}
    </style>
    <title>Document</title>
</head>
<body>
    <h1>구구단</h1>
    <form method="get" action="gugudanPro_T.jsp">
        <table border="1">
            <tr>
                <td>문제</td>
                <td>답입력</td>
            </tr>
            
            <%
            Random ran = new Random();
            for(int i=0;i<5;i++){
            	int x = ran.nextInt(8)+2;
            	int y = ran.nextInt(9)+1;
            	String name = String.format("a%d",i);
            	String dapName = String.format("d%d",i);
            %>
            	
            <tr>
                <td><%=x %>*<%=y %> = </td>
                <td>
	               <input type="text" name="<%=name %>" id="">
	               <input type="hidden" value="<%= x*y %>" name="<%= dapName %>">
                </td>
            </tr>
           	
           	<%
            }
            %>
        </table>
        <input type="submit" value="전송">
    </form>
  
</body>
</html>