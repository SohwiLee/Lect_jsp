package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;

//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.Timestamp;
//import java.util.ArrayList;
//
public class UserDAO {
	// DAO : Data Access Object
	// 데이터 접근처리
	
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	// 1. Singletone Pattern : 중앙관리자가 한 번만 사용되기 위해
	private UserDAO() {} //다른new 원천차단 // 객체 한 번만 불러오기
	private static UserDAO instance = new UserDAO(); // 유일new생성
	public static UserDAO getInstance() {
		return instance;
	}
	
	// 2. DTO에 대한 객체 배열 (ArrayList)
	private ArrayList<UserDTO> users = null;
	
	// 3. 실제 데이터베이스에 연동할 객체들이 들어와야 함(SQL에 대한 처리) 
	private Connection conn = null;
	// ㄴ 1) Connection : DB연동
	private PreparedStatement pstmt=null;
	// ㄴ 2) PreparedStatement : DB에 쿼리를 날릴 준비 
	private ResultSet rs = null;
	// ㄴ 3) ResultSet : 추출된 쿼리에 대한 결과값을 가져와 줌
	
	
	public Connection getConnection() {
		// 드라이버 연동(jdbc mysql connector(.jar)를 ->WEB-INF/lib폴더로 넣어주기
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 호출

			// jdbc:mysql://localhost:3306/데이터베이스스키마명?serverTimezone=UTC
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "dlthgnl";
			
			conn = DriverManager.getConnection(url, id, pw);
			if (conn != null) {
				System.out.println("DB연동성공");
			} else {
				System.out.println("DB연동실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB연동실패@@catch");
		}
		
		return conn;
	}
	
	
	// 데이터 조회(객체 배열을 초기화- 가져온 데이터에 대해서)
	public ArrayList<UserDTO> getUsers(){
		try {
			conn = getConnection(); // DB연동후
			// sql문준비, 쿼리를 스트링 타입으로 작성!
 			String str = "select * from users";
 			// 쿼리를 prepareStatement() 메소드를 활용하여 태움
 			pstmt = conn.prepareStatement(str); // 객체 초기화 후 담기
 			// 쿼리를 날림과 동시에 rs로 결과값을 Object타입으로 받음 
 			rs = pstmt.executeQuery();
 			
 			users = new ArrayList<UserDTO>();
 			// rs는 bufferedreader readline과 마찬가지로 결과값을 한줄씩 가져옴(객체로 가져온다)
			while(rs.next()) {//행(row)단위
				String id = rs.getString(1); // column 첫번째, id값
				String pw = rs.getString(2); // column 두번째, pw값
				Timestamp regDate = rs.getTimestamp(3); // column 세번째, regDate값
				// array에 담기
				users.add(new UserDTO(id,pw,regDate));
				// 브라우저에 보여주기 위해 생성
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	// addUser()
	public int addUser(UserDTO user) {
		// 중복예외처리 메소드 추가
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), user.getRegDate());
//				System.out.println();
//				System.out.println(user.getRegDate());
				conn = getConnection();
				
				String str="insert into users values(?,?,?)";// ?자리는 맵핑값을 setter로 처리할 포맷
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPw());
				pstmt.setTimestamp(3, user.getRegDate()); // 쿼리완성
				
				pstmt.executeUpdate(); // 완성된 쿼리를 연동된 DB에 날려 업데이트 // DB			
				users.add(newUser); // 실행중인 상태에서 dao의 객체배열도 업데이트 // DAO(업데이트 위치가 다름)
				
				System.out.println("업데이트 성공!");
				return users.size();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("업데이트 실패");
			}
			
		}
		return -1;		
	}
	
	private boolean checkUser(String id) {
		users = getUsers(); //데이터불러오기
		for(UserDTO user : users) {
			if(id.equals(user.getId())) {
				return false;
			}
		}
		return true;
	}
	
	// 로그인처리
	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		for(UserDTO user: users) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}
		
		return false;
		
	}
	
	// 탈퇴처리
	public int deleteUser(String id, String pw) {
		users = getUsers(); //데이터불러오기
		int delIdx = -1;
		for(int i=0; i<users.size();i++) {
			if(id.equals(users.get(i).getId()) && pw.equals(users.get(i).getPw())) {
				delIdx = i;
			}
		}
		
		if(delIdx!=-1) {
			
			try {
				conn = getConnection();
				
				String sql = "DELETE FROM users WHERE id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();// db
				
				users.remove(delIdx); // dao
				
//				return delIdx;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		return delIdx;
//		return -1;
	}
	
}
