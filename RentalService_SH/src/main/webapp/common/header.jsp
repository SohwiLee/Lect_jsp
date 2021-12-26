<%@page import="model.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%UserDAO daos = UserDAO.getInstance();%> 
	<header>
		<div>
			<h1 class="logo">
				<a href="/RentalService_SH/index.jsp">SH-Rental</a>
			</h1>
			<nav class="quickNav">
				<ul class="clearfix">
					<li><a href="/RentalService_SH/view/event.jsp">이벤트</a></li>
					<li><a href="/RentalService_SH/view/review.jsp">이용후기</a></li>
					<li><a href="/RentalService_SH/view/reservation.jsp">예약하기</a></li>
					<li><a href="/RentalService_SH/view/reserveChk.jsp">예약확인</a></li>
				</ul>
			</nav>
			<ul class="forUsers">
				<%if (session.getAttribute("log") == null) {%>
					<li><a href="/RentalService_SH/view/login.jsp">로그인</a></li>
					<li><a href="/RentalService_SH/view/join.jsp">회원가입</a></li>
				<%} else {%>
					<li><p><%= session.getAttribute("log")%></p></li>
	 				<li>
	 				<form action="service">
	 				<input type="submit" name="command" value="로그아웃">
	 				</form>
	 				</li>
				<%}%>
			</ul>
			<div class="toggle">
				<button class="allNav-open" onclick="openMenu()">전체메뉴</button>
				<nav class="allNav">
					<button class="allNav-close" onclick="closeMenu()">닫기</button>
					<ul>
						<li><a href="/RentalService_SH/view/reservation.jsp">예약 하기</a></li>
						<li><a href="/RentalService_SH/view/reserveChk.jsp">예약 확인</a></li>
						<li><a href="/RentalService_SH/view/review.jsp">이용 후기</a></li>
						<li><a href="/RentalService_SH/view/help.jsp">고객센터</a></li>
						<li><a href="/RentalService_SH/view/event.jsp">이벤트</a></li>
						<li><a href="/RentalService_SH/view/notice.jsp">공지사항</a></li>
						<%if(session.getAttribute("log") != null) {%>
						<li><a href="/RentalService_SH/myPage/myPage.jsp">마이페이지</a></li>
						<%}%>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
	<script>
	    function openMenu(){
	        document.querySelector(".allNav-open").addEventListener('click',e=>{
	            document.querySelector(".allNav-close").setAttribute('style','display:block');
	            document.querySelector(".allNav").setAttribute('style','display:block');
	        });
	    }
	    function closeMenu(){
	        document.querySelector(".allNav-close").addEventListener('click',e=>{
	            document.querySelector(".allNav-open").setAttribute('style','display:block');
	            document.querySelector(".allNav").setAttribute('style','display:none');
	        });
	    }
    </script>
</body>
</html>