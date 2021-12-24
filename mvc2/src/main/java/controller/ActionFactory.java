package controller;

import controller.action.Action;
import controller.action.IndexAction;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;

// Factory Method(���������� ����)
public class ActionFactory {
	// �̱��� ó��(���������� ����)
	
	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance(){return instance;}
	
	// command pattern(����������)
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("index")) {action = new IndexAction();}
		if(command.equals("login")) { action = new LoginAction();}
		if(command.equals("join")) {action = new JoinAction();}
		if(command.equals("logout")) {action = new LogoutAction();}
		/*
		 * else if(command.equals("join")) { action = new JoinAction();} else
		 * if(command.equals("joinForm")) { action = new JoinFormAciton();}
		 */
		return action;
			
	}
}
