<%@page import="user.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GREEN Index</title>
</head>
<body>
	<h1>Index</h1>
	<%
		UserDAO dao = UserDAO.getInstance();
	%>
	<%--dao.getConnection(); --%>
	<%
		ArrayList<UserDTO> datas = dao.getUsers();
		for(int i=0;i<datas.size();i++){
			UserDTO user = datas.get(i);
			System.out.println(user.toString());
		}
	%>
    <form>
    <!--      
	    <span>id : </span><input type="text" name="" id="id"> <br>
	    <span>pw : </span><input type="password" name="" id=""><br><br>
	 	<input type="button" value="login" id="login" onclick="location.href='_6_login.jsp'">
	    <input type="button" value="join"  id="join" onclick="location.href='_4_join.jsp'">
    -->
        <input type="button" value="login" id="login">
        <input type="button" value="join"  id="join">
    </form>
    
   
    <script>    
	    document.querySelector('input#login').addEventListener('click',e=>{
	    	// id값 유지
	    	location.href=`_6_login.jsp?id=${document.querySelector('input#id').value}`;
	    });
	    document.querySelector('input#join').addEventListener('click',e=>{
	    	// id값 유지
	    	location.href=`_4_join.jsp?id=${document.querySelector('input#id').value}`;
	    });
    </script>
</body>
</html>