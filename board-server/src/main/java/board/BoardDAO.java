package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardDAO {
	public static int status= -1;
	public static int cnt= 0;
	public static final int REMOVE = 2;
	public static final int UPDATE = 3;
	
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {return instance;}

	private ArrayList<BoardDTO> lists = null;

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://localhost:3306/board?serverTimeZone=UTC";
			String id = "root";
			String pw = "dlthgnl";

			conn = DriverManager.getConnection(url, id, pw);

			if (conn == null) {
				System.out.println("no연동");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("연동XXXXX");
		}

		return conn;
	}

	public ArrayList<BoardDTO> getLists() {
		try {
			conn = getConnection();
			String str = "select * from board";
			pstmt = conn.prepareStatement(str);
			rs = pstmt.executeQuery();

			lists = new ArrayList<>();
			while (rs.next()) {
				int num = rs.getInt(1);
				String id = rs.getString(2);
				String pw = rs.getString(3);
				String title = rs.getString(4);
				String contents = rs.getString(5);
				int likes = rs.getInt(6);
				Timestamp regDate = rs.getTimestamp(7);
				lists.add(new BoardDTO(num, id, pw, title, contents, likes, regDate));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lists;
	}

	public int addList(BoardDTO board) {
		try {
			BoardDTO newBoard = new BoardDTO(board.getId(), board.getPw(), board.getTitle(), board.getContent(),
					board.getRegDate());
			conn = getConnection();

			// =================== reindexing 필요 //
			String str = "insert into board values(default,?,?,?,?,0,?)";
			pstmt = conn.prepareStatement(str);
			pstmt.setString(1, board.getId());
			pstmt.setString(2, board.getPw());
			pstmt.setString(3, board.getTitle());
			pstmt.setString(4, board.getContent());
			pstmt.setTimestamp(5, board.getRegDate());
			System.out.println(board.getTitle());
			pstmt.executeUpdate();

			lists.add(newBoard);
			System.out.println("게시완료!");

			return lists.size();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시 실패");
		}
		
		return -1;
		
	}
	
	public int deleteBoard(int num) {
		lists = getLists();
		System.out.println(status+","+num);
		int delIdx = -1;
		for(int i=0;i<lists.size();i++) {
			if(lists.get(i).getNo() == num) {
				delIdx = i;
			}
		}
		if(delIdx !=-1) {
			try {
				conn=getConnection();
				String delStr="delete from board where no=?";
				pstmt = conn.prepareStatement(delStr);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				lists.remove(delIdx);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("삭제실패");
			}			
		}
		
		return delIdx;
	}
	
	public int updateBoard(String pw, String title, String content, int num) {
		lists = getLists();
		int upIdx = -1;
		for(int i=0;i<lists.size();i++) {
			if(lists.get(i).getNo() == num) {
				upIdx = i;
			}
		}
		if(upIdx!=-1) {
			try {
				conn=getConnection();
				String upStr="update board set title=?, contents=?, pw=? where no=?";
				pstmt = conn.prepareStatement(upStr);
				pstmt.setString(1, title);
				pstmt.setString(2, content);
				pstmt.setString(3, pw);
				pstmt.setInt(4, num);
				pstmt.executeUpdate();
				lists.set(upIdx, new BoardDTO(lists.get(upIdx).getId(), pw, title, content, new Timestamp(Calendar.getInstance().getTimeInMillis())));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("수정실패");
			}
		}
		return upIdx;
	}
	
	public void setLikeCount(int idx) {
		lists = getLists();
		int cnt = lists.get(idx).getLikes();
		int userNo = lists.get(idx).getNo();
		try {
			cnt+=1;
			conn = getConnection();
			String likeUp="update board set likes=? where no=?";
			pstmt = conn.prepareStatement(likeUp);
			pstmt.setInt(1, cnt);
			pstmt.setInt(2, userNo);
			pstmt.executeUpdate();
			lists.get(idx).setLikes(cnt);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("좋아요실패");
		}
		
	}

}
