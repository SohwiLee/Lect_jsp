package model.dto;

import java.sql.Timestamp;

public class UserDTO {
	
	private String id, pw;
	private Timestamp regDate;
	
	public UserDTO(String id, String pw, Timestamp regDate) {
		this.id=id;this.pw=pw; this.regDate=regDate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
}
