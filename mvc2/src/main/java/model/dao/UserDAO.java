package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.UserDTO;
import util.DBManager;

public class UserDAO {
	private UserDAO() {}	
	private static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {return instance;}
	
	ArrayList<UserDTO> lists = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ArrayList<UserDTO> getUsers() {
		
		try {
			conn = DBManager.getConnection();
			String str = "select * from users";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			lists = new ArrayList<UserDTO>();
			
			while(rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				Timestamp regDate = rs.getTimestamp(3);
				
				lists.add(new UserDTO(id,pw,regDate));
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("fail to load");
		}
		
		return lists;
	}
	
	public int addUsers(UserDTO user) {
		lists = getUsers();
		
		try {
			
			UserDTO newUser = new UserDTO(user.getId(),user.getPw(),user.getRegDate());
			
			conn = DBManager.getConnection();
			String str="insert into users values(?,?,?)";
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setTimestamp(3,user.getRegDate());
			pstmt.executeUpdate();
			
			
			lists.add(newUser);
			return lists.size();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("fail to add");
		}
		
		return -1;
	}
	
	
	public boolean checkLogin(String id, String pw) {
		lists = getUsers();
		for(UserDTO user : lists) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}		
		return false;
	}
}
