<%@page import="model.dao.CommentDAO"%>
<%@page import="model.dao.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/RentalService_SH/resources/common.css">
<link rel="stylesheet" href="/RentalService_SH/resources/event.css">
<title>event view</title>
</head>
<body>
<% 
	EventDAO dao = EventDAO.getInstance();
	CommentDAO comDao = CommentDAO.getInstance();			
	String idx = request.getParameter("idx");
%>
	<div class="wrap eventView">
		<%@ include file="/common/header.jsp"%>
		<main>
            <section>
                <div>
                    <h2>이벤트</h2>          
                    <table>
                        <tbody>
                            <tr>
                                <td>No.</td>
                                <td><%= dao.getLists().get(Integer.parseInt(idx)).getNo()%></td>
                            </tr>
                             <tr>
                                <td>작성일</td>
                                <td><%= dao.getLists().get(Integer.parseInt(idx)).getRegDate()%></td>
                            </tr>
                            <tr>
                                <td>제목</td>
                                <td><%= dao.getLists().get(Integer.parseInt(idx)).getTitle()%></td>
                            </tr>
                            <tr>
                                <td>내용</td>
                                <td class="content">
                                    <div>
                                        <p><%= dao.getLists().get(Integer.parseInt(idx)).getContent()%></p>
                                    </div>
                                </td>
                            </tr>
							<tr>
								<td>조회수</td>
								<td><%= dao.getLists().get(Integer.parseInt(idx)).getViewCount()%></td>
							</tr>
						</tbody>
                    </table>
                      <input type="button" class="back" value="뒤로가기" onclick="location.href='event.jsp'">
                </div>
            </section>
            <section>
	            <div>
    	        	<h3>댓글</h3>
    	        	<% for(int i=0;i<comDao.getLists().size();i++){ %>
    	        	<div class="commentBox">
	    	        	<div class="comment">
	    		        	<p> <span class="user"><%= comDao.getLists().get(i).getId()%></span> <span class="regDate"><%= comDao.getLists().get(i).getRegDate()%></span> </p>
		    	        	<div class="textArea">
			    	        	<P><%= comDao.getLists().get(i).getContent()%></P>
		    	        	</div>
	    	        	</div>
	    	        	<!-- <div class="commentReply">
		    	        	<p> <span class="user">id</span> <span class="regDate">2021~</span> </p>
		    	        	<div class="textArea">
			    	        	<P>댓글에 댓글입력</P>
			    	        	<input type="button" value="수정">
			    	        	<input type="button" value="삭제">
		    	        	</div>
	    	        	</div> -->
	            	</div>
    	        		
    	        	<%}%>
	            	
	    		    <%-- if(session.getAttribute("log") !=null){ --%>
    	        	<div class="commentBox">
	    	        	<form action="commentPro.jsp">
	    	        	<%-- <input type="hidden" name="no" value="<%= dao.getLists().get(Integer.parseInt(idx)).getNo()%>"> --%>
	    	        	<input type="hidden" name="no" value="<%= idx%>">
	    	        	<div class="comment">
	    		        	<p> <span class="user"><%= session.getAttribute("log") %></span></p>
		    	        	<div class="textArea">
			    	        	<textArea name="content" placeholder="댓글을 입력하세요"></textArea>
			    	        	<input type="submit" value="작성">
		    	        	</div>
	    	        	</div>
		    	        </form>
	    	        	<div class="commentReply">
	    	        	</div>
	            	 </div>
	    		     <%--}--%>
           </div>
           </section>
        </main>

		<%@ include file="/common/footer.jsp"%>

	</div>
</body>
</html>
