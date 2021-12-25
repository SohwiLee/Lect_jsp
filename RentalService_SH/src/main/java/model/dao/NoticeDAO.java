package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import model.dto.NoticeDTO;
import util.DBManager;

public class NoticeDAO {
	private NoticeDAO() {}
	private static NoticeDAO instance = new NoticeDAO();
	public static NoticeDAO getInstance() {
		return instance;
	}
	
	private ArrayList<NoticeDTO> noticeLists = null;
	
	private Connection conn = null;
	private PreparedStatement pstmt=null;
	private ResultSet rs = null;
	
	public ArrayList<NoticeDTO> getLists(){
		try {
			conn = DBManager.getConnection();
			String str = "select * from noticeboard";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();
			
			noticeLists = new ArrayList<>();
			
			while(rs.next()) {
				int num = rs.getInt(1);
				String title = rs.getString(2);
				String content = rs.getString(3);
				Timestamp regDate = rs.getTimestamp(4);
				int viewCount = rs.getInt(5);
				int like = rs.getInt(6);
				noticeLists.add(new NoticeDTO(num,title,content,regDate,viewCount,like));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return noticeLists;
	}
	
	public int addList(NoticeDTO board) {
		noticeLists = getLists();
		try {
			NoticeDTO newBoard = new NoticeDTO(board.getNo(), board.getTitle(), board.getContent(), board.getRegDate(), board.getViewCount(),0);
			conn = DBManager.getConnection();
			
			String str="insert into noticeboard values(default,?,?,?,0)";
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setTimestamp(3, board.getRegDate());
			pstmt.executeUpdate();
			
			noticeLists.add(newBoard);
			return noticeLists.size();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("notice update Failed");
		}
		return -1;
	}
	
}
