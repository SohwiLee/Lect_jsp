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
	// ������ ����ó��
	
	public static final int REMOVE = 0;
	public static final int UPDATE = 1;
	
	// 1. Singletone Pattern : �߾Ӱ����ڰ� �� ���� ���Ǳ� ����
	private UserDAO() {} //�ٸ�new ��õ���� // ��ü �� ���� �ҷ�����
	private static UserDAO instance = new UserDAO(); // ����new����
	public static UserDAO getInstance() {
		return instance;
	}
	
	// 2. DTO�� ���� ��ü �迭 (ArrayList)
	private ArrayList<UserDTO> users = null;
	
	// 3. ���� �����ͺ��̽��� ������ ��ü���� ���;� ��(SQL�� ���� ó��) 
	private Connection conn = null;
	// �� 1) Connection : DB����
	private PreparedStatement pstmt=null;
	// �� 2) PreparedStatement : DB�� ������ ���� �غ� 
	private ResultSet rs = null;
	// �� 3) ResultSet : ����� ������ ���� ������� ������ ��
	
	
	public Connection getConnection() {
		// ����̹� ����(jdbc mysql connector(.jar)�� ->WEB-INF/lib������ �־��ֱ�
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // ȣ��

			// jdbc:mysql://localhost:3306/�����ͺ��̽���Ű����?serverTimezone=UTC
			String url = "jdbc:mysql://localhost:3306/board?serverTimezone=UTC";
			String id = "root";
			String pw = "dlthgnl";
			
			conn = DriverManager.getConnection(url, id, pw);
			if (conn != null) {
				System.out.println("DB��������");
			} else {
				System.out.println("DB��������");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB��������@@catch");
		}
		
		return conn;
	}
	
	
	// ������ ��ȸ(��ü �迭�� �ʱ�ȭ- ������ �����Ϳ� ���ؼ�)
	public ArrayList<UserDTO> getUsers(){
		try {
			conn = getConnection(); // DB������
			// sql���غ�, ������ ��Ʈ�� Ÿ������ �ۼ�!
 			String str = "select * from users";
 			// ������ prepareStatement() �޼ҵ带 Ȱ���Ͽ� �¿�
 			pstmt = conn.prepareStatement(str); // ��ü �ʱ�ȭ �� ���
 			// ������ ������ ���ÿ� rs�� ������� ObjectŸ������ ���� 
 			rs = pstmt.executeQuery();
 			
 			users = new ArrayList<UserDTO>();
 			// rs�� bufferedreader readline�� ���������� ������� ���پ� ������(��ü�� �����´�)
			while(rs.next()) {//��(row)����
				String id = rs.getString(1); // column ù��°, id��
				String pw = rs.getString(2); // column �ι�°, pw��
				Timestamp regDate = rs.getTimestamp(3); // column ����°, regDate��
				// array�� ���
				users.add(new UserDTO(id,pw,regDate));
				// �������� �����ֱ� ���� ����
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return users;
	}
	
	// addUser()
	public int addUser(UserDTO user) {
		// �ߺ�����ó�� �޼ҵ� �߰�
		if(checkUser(user.getId())) {
			try {
				UserDTO newUser = new UserDTO(user.getId(), user.getPw(), user.getRegDate());
//				System.out.println();
//				System.out.println(user.getRegDate());
				conn = getConnection();
				
				String str="insert into users values(?,?,?)";// ?�ڸ��� ���ΰ��� setter�� ó���� ����
				pstmt = conn.prepareStatement(str);
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getPw());
				pstmt.setTimestamp(3, user.getRegDate()); // �����ϼ�
				
				pstmt.executeUpdate(); // �ϼ��� ������ ������ DB�� ���� ������Ʈ // DB			
				users.add(newUser); // �������� ���¿��� dao�� ��ü�迭�� ������Ʈ // DAO(������Ʈ ��ġ�� �ٸ�)
				
				System.out.println("������Ʈ ����!");
				return users.size();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("������Ʈ ����");
			}
			
		}
		return -1;		
	}
	
	private boolean checkUser(String id) {
		users = getUsers(); //�����ͺҷ�����
		for(UserDTO user : users) {
			if(id.equals(user.getId())) {
				return false;
			}
		}
		return true;
	}
	
	// �α���ó��
	public boolean checkLogin(String id, String pw) {
		users = getUsers();
		for(UserDTO user: users) {
			if(user.getId().equals(id) && user.getPw().equals(pw)) {
				return true;
			}
		}
		
		return false;
		
	}
	
	// Ż��ó��
	public int deleteUser(String id, String pw) {
		users = getUsers(); //�����ͺҷ�����
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
