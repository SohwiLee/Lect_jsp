package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

public class LoginAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserDAO dao = UserDAO.getInstance();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("L-ID "+id);
		System.out.println("L-pw "+pw);
		
		String url="";
		
		if(dao.checkLogin(id,pw)) {
			url="view/main.jsp";	
			request.getSession().setAttribute("log", id);
			/* session.setAttribute("log",id); */
			
			System.out.println("Login success");
		}else {
			url="view/login.jsp";
			System.out.println("Login fail");
		}
		
		request.getRequestDispatcher(url).forward(request, response);
	}

}
