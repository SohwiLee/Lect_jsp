package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBManager {
	
	private DBManager() {}
	
	// ��� DAO�ȿ��� DB������ �ʿ��� ��
	// DBManager.getConnection();���� ����ǵ���!
	
	// ������ DB(Schema) �ȿ� �ִ� ������ ��
	// � ���̺��� ������� >> use ��Ű���� << sql�� �߰�
	
	public static Connection getConnection() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/car_rental?serverTimezone=UTC";
			String id = "root";
			String pw = "dlthgnl";

			conn = DriverManager.getConnection(url, id, pw);
			if (conn == null) {
				System.out.println("no����");
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB���� XX");
		}

		return conn;

	}

}
