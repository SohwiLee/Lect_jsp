package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url="view/reservation.jsp";			
		System.out.println("URL:"+url);
		// �����ĸ� ���� �����带 �ϸ� url�� ��ȭ�� ����.
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
