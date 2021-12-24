package comment;

import java.sql.Timestamp;

public class CommentDTO {
	int listNo, commentNo; // 글목록 식별, 댓글식별
	String id, content; // 댓글작성자, 댓글내용
	Timestamp regDate; // 댓글등록일
	boolean reply; // 대댓글 유무
	
	public CommentDTO(int listNo, int commentNo, String id, String content, Timestamp regDate, boolean reply) {
		this.listNo=listNo;this.commentNo=commentNo;this.id=id;this.content=content; this.regDate=regDate; this.reply=reply;
	}

	public int getListNo() {
		return listNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	
	

}
