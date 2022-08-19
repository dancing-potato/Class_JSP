package jsp11_javabean;

import java.sql.Timestamp;

// study_jsp3.board 테이블 레코드 1개 정보를 저장하는 BoardDTO 클래스 정의
public class BoardDTO_Backup {
	// 1. board 테이블의 각 컬럼에 대응하는 멤버변수 선언
	private int num;
	private String name;
	private String pass;
	private String subject;
	private String content;
	private int readcount;
	private Timestamp date;

	// 2. 생성자 정의(생략 가능) - 생략 시 기본 생성자가 자동으로 정의됨

	// 3. 각 멤버변수에 접근하기 위한 Getter/Setter 메서드 정의
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
}














