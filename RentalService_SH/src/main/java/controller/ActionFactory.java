package controller;

import controller.action.Action;
import controller.action.IndexAction;
import controller.action.JoinAction;
import controller.action.LoginAction;
import controller.action.LogoutAction;
import controller.action.RemoveUserAction;
import controller.action.ReservateAction;
import controller.action.ReservateRemoveAction;
import controller.action.myPageEditAction;

// Factory Method : 생성디자인패턴
public class ActionFactory {
	
	// 싱글톤 처리 : 생성디자인패턴
	private ActionFactory() {}
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {return instance;}
	
	// command pattern : 행위디자인
	public Action getAction(String command) {
		Action action = null;
		System.out.println("C::"+command);
		if(command.equals("IndexRecommend")) {action = new IndexAction();}
		if(command.equals("login")) {action = new LoginAction();}
		if(command.equals("로그아웃") || command.equals("logout")) {action = new LogoutAction();}
		if(command.equals("reservate")) {action = new ReservateAction();}
		if(command.equals("reserveCancel")) {action = new ReservateRemoveAction();}
		if(command.equals("editMyInfo")) {action = new myPageEditAction();}
		if(command.equals("delUser")) {action = new RemoveUserAction();}
		if(command.equals("회원가입") || command.equals("join")) {action = new JoinAction();}
		
		return action;
	}

}
