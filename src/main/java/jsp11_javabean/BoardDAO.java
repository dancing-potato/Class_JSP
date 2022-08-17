package jsp11_javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
	public int insert(BoardDTO board) {
		
		int insertCount = 0; //리턴할 데이터를 저장하는 변수 선언
		try {
			// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
			String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
			String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
			String user = "root"; // 계정명
			String password = "1234"; // 패스워드

			// 1단계. 드라이버 클래스 로드
			Class.forName(driver);

			// 2단계. DB 연결
			// => 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
			Connection con = DriverManager.getConnection(url, user, password);

			// -------------------------------------------------------------------------------------------
			// 1) 새 글 번호 계산
			// => board 테이블의 모든 레코드의 idx 컬럼값 중 가장 큰 값 조회(데이터베이스 max() 함수 활용)
			int idx = 1; // 새 글 번호를 저장할 변수 선언(기본값 1)

			// 3단계. SQL 구문 작성 및 전달
			// => MySQL 의 MAX(컬럼명) 함수를 사용하면 특정 컬럼에서 가장 큰 값 조회 가능
			String sql = "SELECT MAX(idx) FROM board";
			PreparedStatement pstmt = con.prepareStatement(sql);

			// 4단계. SQL 구문 실행 및 결과 처리
			ResultSet rs = pstmt.executeQuery();

			// 다음 레코드가 존재할 경우 첫번째 컬럼 값(INT 타입) + 1 값을 idx 변수에 저장
			if(rs.next()) {
				idx = rs.getInt(1) + 1;
			}
			// -------------------------------------------------------------------------------------------
			// 2) 글 등록(INSERT) 작업 수행
			// 3단계. SQL 구문 작성 및 전달
			// => 작성일(6번 파라미터 : now() 함수 호출), 조회수(7번 파라미터 : 기본값 0)
			sql = "INSERT INTO board VALUES (?,?,?,?,?,now(),0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx); // 새 글 번호
			pstmt.setString(2,board.getName()); // 작성자
			pstmt.setString(3, board.getPasswd()); // 패스워드
			pstmt.setString(4, board.getSubject()); // 제목
			pstmt.setString(5, board.getContent()); // 내용

			// 4단계. SQL 구문 실행 및 결과 처리
			// => INSERT 구문 실행 시 리턴되는 값(int 타입)을 insertCount 변수에 저장 후
//		    insertCount 가 0보다 크면 "list.jsp" 페이지로 포워딩하고
//		    아니면, 자바스크립트를 통해 "글쓰기 실패!" 출력 후 이전페이지로 돌아가기
			insertCount = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertCount;
	}
}