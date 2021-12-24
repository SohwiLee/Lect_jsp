package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String link = request.getParameter("link");
		System.out.println("LINK::"+link);
		
		// 검증 후 model에 접근 > 어디로 갈지(url), 다음 페이지로 넘겨준다. (request dispatcher)
		
		String url="";
		if (link.equals("login")) {
			url="view/login.jsp";
		} else if (link.equals("join")) {
			url="view/join.jsp";
		}
		// 디스패쳐를 통한 포워드를 하면 url의 변화가 없다.
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
