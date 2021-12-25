package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.EventDTO;
import util.DBManager;

public class EventDAO {

	private EventDAO() {}
	private static EventDAO instance = new EventDAO();
	public static EventDAO getInstance() {return instance;}
	
	private ArrayList<EventDTO> eventLists = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	public ArrayList<EventDTO> getLists(){
		try {
			conn = DBManager.getConnection();
			String str = "select * from eventboard";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			eventLists = new ArrayList<>();
			
			while(rs.next()) {
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				Timestamp regDate = rs.getTimestamp(4);
				int like = rs.getInt(5);
				int viewCount = rs.getInt(6);
				eventLists.add(new EventDTO(num,title,content,regDate,viewCount,like));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return eventLists;
	}
	
	public int addList(EventDTO board) {
		try {
			EventDTO newBoard = new EventDTO(board.getNo(), board.getTitle(), board.getContent(), board.getRegDate(), board.getViewCount(), 0);
			conn = DBManager.getConnection();
			
			String str="insert into eventboard values(default,?,?,?,0,0)";
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setTimestamp(3, board.getRegDate());
			pstmt.executeUpdate();
			
			eventLists.add(newBoard);
			return eventLists.size();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("event update Failed");
		}
		return -1;
	}
	
	
}
