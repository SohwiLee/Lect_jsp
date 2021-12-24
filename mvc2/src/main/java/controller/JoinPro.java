package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.UserDAO;
import model.dto.UserDTO;

/**
 * Servlet implementation class JoinPro
 */
@WebServlet("/join")
public class JoinPro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinPro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		UserDAO dao = UserDAO.getInstance();
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("J-ID "+id);
		System.out.println("J-pw "+pw);
		
		String url="";
		if(dao.addUsers(new UserDTO(id,pw,new Timestamp(Calendar.getInstance().getTimeInMillis())))!=-1) {
			url="view/login.jsp";
		}else {
			url="view/join.jsp";
		}
		
		request.getRequestDispatcher(url).forward(request, response);		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

}
