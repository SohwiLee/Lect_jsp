package controller.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

public class RemoveUserAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDAO dao = UserDAO.getInstance();
		String id = String.valueOf(request.getSession().getAttribute("log"));

		String url="";
		if (dao.delUser(id) != -1) {
//			PrintWriter outpr = response.getWriter();
//			outpr.println("<script language='javascript'>");
//			outpr.println("alert('Å»Åð°¡ ¿Ï·áµÇ¾ú½À´Ï´Ù.'); location.href='index.jsp';");
//			outpr.println("</script>");
//			outpr.flush();
			url="index.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

}
