package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;

/**
 * Servlet implementation class LoginPro
 */
@WebServlet("/login")
public class LoginPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginPro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
