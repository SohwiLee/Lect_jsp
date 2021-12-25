<%@page import="model.dao.CarDAO"%>
<%@page import="model.dao.ReservateDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/reservate.css">
<title>reservation check</title>
</head>
<body>
<div class="wrap reserveChk">
<% 
if(session.getAttribute("log")==null){
	   PrintWriter outpr = response.getWriter();
	    outpr.println("<script language='javascript'>");
	    outpr.println("alert('로그인이 필요한 서비스입니다.'); location.href='login.jsp';");
	    outpr.println("</script>");
	    outpr.flush();
}
ReservateDAO rdao = ReservateDAO.getInstance();
CarDAO cdao = CarDAO.getInstance();
String user = String.valueOf(session.getAttribute("log"));
%>
	<%@ include file="/common/header.jsp"%>
	<main>
		<h3>예약확인</h3>
		<section>
			<div>
				<table>
					<thead>
						<tr>
							<td>No.</td>
							<td>차종</td>
							<td>대여기간</td>							
							<td>결제총액</td>
							<td>-</td>
						</tr>
					</thead>
					<tbody>
					<%for(int i=0;i<rdao.getLists().size();i++){
	                  	if(rdao.getLists().get(i).getUserName().equals(user)){%>
					<tr>
                       <td><%=i+1 %></td>
                       <td>
                       <%for(int j=0;j<cdao.getLists().size();j++){
                    	   if(cdao.getLists().get(j).getNo() == rdao.getLists().get(i).getCarCode()){
                       %>
                    		<%= cdao.getLists().get(j).getName()%>
                       <%}}%>
                       </td>
                       <td><p><%= rdao.getLists().get(i).getReserveStart() %></p>
                        <p>~ <%= rdao.getLists().get(i).getReserveEnd() %></p></td>
                       <td><%=rdao.getLists().get(i).getTotalPrice()%>원</td>
                       <td>
                      <form action="reservateRemovePro.jsp">
                      <!-- <input type="submit" value="예약취소"> -->
                      <button onclick="cancel()">취소</button>
                      <input type="hidden" name="cancelNum" value="<%=i%>" >                      
                      </form>
                       </td>
                   	</tr>
					<%}}%>			 		
                    </tbody>
				</table>
			</div>

		</section>

	</main>
	<%@ include file="/common/footer.jsp"%>
	</div>
	
	<script>
	function cancel(){
		if(confirm("예약을 취소하시겠습니까?")){
			location.herf="reservateRemovePro.jsp";
		}
	}
	</script>
</body>
</html>