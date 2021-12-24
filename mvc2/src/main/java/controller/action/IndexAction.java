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
		
		// ���� �� model�� ���� > ���� ����(url), ���� �������� �Ѱ��ش�. (request dispatcher)
		
		String url="";
		if (link.equals("login")) {
			url="view/login.jsp";
		} else if (link.equals("join")) {
			url="view/join.jsp";
		}
		// �����ĸ� ���� �����带 �ϸ� url�� ��ȭ�� ����.
		request.getRequestDispatcher(url).forward(request, response);
	}
	
}
