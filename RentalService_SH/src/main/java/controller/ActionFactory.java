package controller;

import controller.action.Action;
import controller.action.IndexAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.ReservateAction;

// Factory Method : ��������������
public class ActionFactory {
	
	// �̱��� ó�� : ��������������
	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {return instance;}
	
	// command pattern : ����������
	public Action getAction(String command) {
		Action action = null;
		System.out.println("C::"+command);
		if(command.equals("IndexRecommend")) {action = new IndexAction();}
		if(command.equals("login")) {action = new LoginAction();}
		if(command.equals("logout")) {action = new LogoutAction();}
		if(command.equals("reservate")) {action = new ReservateAction();}
		
		return action;
	}

}
