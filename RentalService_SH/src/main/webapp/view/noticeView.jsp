<%@page import="model.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/RentalService_SH/resources/common.css">
<link rel="stylesheet" href="/RentalService_SH/resources/boards.css">
<title>notice view</title>
</head>
<body>
<% 
	NoticeDAO dao = NoticeDAO.getInstance();
	String idx = request.getParameter("idx");
%>
	<div class="wrap eventView">
		<%@ include file="/common/header.jsp"%>
		<main>
            <section>
                <div>
                    <h2>공지</h2>          
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
                      <input type="button" value="뒤로가기" onclick="location.href='notice.jsp'">
                      <% if(session.getAttribute("log").equals("admin")){ %>
                      <input type="button" class="edit" value="수정하기" onclick="location.href='noticeEdit.jsp'">
                      <% } %>
                </div>
            </section>
        </main>

		<%@ include file="/common/footer.jsp"%>

	</div>
</body>
</html>
