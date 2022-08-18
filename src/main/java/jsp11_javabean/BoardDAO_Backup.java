package jsp11_javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//study_jsp3.board 테이블의 데이터 처리 작업을 담당하는 BoardDAO클래스 저의
public class BoardDAO_Backup {
	//board 테이블 글쓰기 작업(INSERT)을 수행하는 insert() 메서드 정의
	//=> 파라미터 : 게시물 정보(작성자, 패스워드, 글제목, 글내용)
//	public void insert(String name, String passwd, String subject,String content) {
//		try {
////			 board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
////			 => 단, 글번호(idx)는 가장 큰 번호 + 1 값으로 새로 설정
////			    작성일(date)은 데이터베이스의 now() 함수 사용
////			    조회수(readcount)는 기본값인 0 으로 설정
//			// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
//			String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
//			String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
//			String user = "root"; // 계정명
//			String password = "1234"; // 패스워드
//
//			// 1단계. 드라이버 클래스 로드
//			Class.forName(driver);
//
//			// 2단계. DB 연결
//			// => 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
//			Connection con = DriverManager.getConnection(url, user, password);
//
//			// -------------------------------------------------------------------------------------------
//			// 1) 새 글 번호 계산
//			// => board 테이블의 모든 레코드의 idx 컬럼값 중 가장 큰 값 조회(데이터베이스 max() 함수 활용)
//			int idx = 1; // 새 글 번호를 저장할 변수 선언(기본값 1)
//
//			// 3단계. SQL 구문 작성 및 전달
//			// => MySQL 의 MAX(컬럼명) 함수를 사용하면 특정 컬럼에서 가장 큰 값 조회 가능
//			String sql = "SELECT MAX(idx) FROM board";
//			PreparedStatement pstmt = con.prepareStatement(sql);
//
//			// 4단계. SQL 구문 실행 및 결과 처리
//			ResultSet rs = pstmt.executeQuery();
//
//			// 다음 레코드가 존재할 경우 첫번째 컬럼 값(INT 타입) + 1 값을 idx 변수에 저장
//			if(rs.next()) {
//				idx = rs.getInt(1) + 1;
//			}
//			// -------------------------------------------------------------------------------------------
//			// 2) 글 등록(INSERT) 작업 수행
//			// 3단계. SQL 구문 작성 및 전달
//			// => 작성일(6번 파라미터 : now() 함수 호출), 조회수(7번 파라미터 : 기본값 0)
//			sql = "INSERT INTO board VALUES (?,?,?,?,?,now(),0)";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, idx); // 새 글 번호
//			pstmt.setString(2, name); // 작성자
//			pstmt.setString(3, passwd); // 패스워드
//			pstmt.setString(4, subject); // 제목
//			pstmt.setString(5, content); // 내용
//
//			// 4단계. SQL 구문 실행 및 결과 처리
//			// => INSERT 구문 실행 시 리턴되는 값(int 타입)을 insertCount 변수에 저장 후
////		    insertCount 가 0보다 크면 "list.jsp" 페이지로 포워딩하고
////		    아니면, 자바스크립트를 통해 "글쓰기 실패!" 출력 후 이전페이지로 돌아가기
//			int insertCount = pstmt.executeUpdate();
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//
//		
//	}
//	
	//board 테이블 글쓰기 작업(INSERT)을 수행하는 insert() 메서드 정의
	// => 파라미터 : 게시물 정보(BoardDTO 객체)
	public int insert(BoardDTO board) {
		
		int insertCount = 0; //리턴할 데이터를 저장하는 변수 선언
		try {
//			 board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
//			 => 단, 글번호(idx)는 가장 큰 번호 + 1 값으로 새로 설정
//			    작성일(date)은 데이터베이스의 now() 함수 사용
//			    조회수(readcount)는 기본값인 0 으로 설정
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
			// 작성자,패스워드,제목,내용은 BoardDTO객체에 저장되어 있으므로
			// BoardDTO 객체의 Getter메서드를 호출해 각 데이터를 꺼내서 setXXX()메서드에 전달
			pstmt.setString(2, board.getName()); // 작성자
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
	
	//글 삭제 작업을 수행하는 delete() 메서드 정의
	public int delete(BoardDTO board) {
		
		int deleteCount = 0;// 리턴값을 저장할 변수 선언
		
		try {
			// 0단계. DB 연결에 필요한 문자열 4개 저장
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/study_jsp3";
			String user = "root";
			String password = "1234";

			// 1단계. 드라이버 클래스 로드
			Class.forName(driver);

			// 2단계. DB 연결
			Connection con = DriverManager.getConnection(url, user, password);
			// out.println("DB 연결 완료!");

			// 3단계. SQL 구문 작성 및 전달
			// => 1) 번호(idx)와 패스워드(passwd)가 모두 일치하는 게시물 삭제(DELETE) - 사용할 방법
			// => 2) 번호(idx)가 일치하는 레코드를 검색(SELECT)하여 
//		       존재할 경우 패스워드(passwd)를 검사하여 일치하면 삭제(DELETE)
			String sql = "DELETE FROM board WHERE idx=? AND passwd=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			//글번호(idx)와 패스워드(passwd)는 BoardDTO객체로부터 꺼내기
			pstmt.setInt(1, board.getIdx());
			pstmt.setString(2, board.getPasswd());

			// 4단계. SQL 구문 실행 및 결과 처리
			deleteCount = pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return deleteCount;
	}
	

	// 글목록 조회 작업을 수행하는 select() 메서드 정의
	//=>파라미터 : 없음   리턴타입 : java.util.ArrayList(boardList)
	public ArrayList select(){
			// 글목록 조회 결과를 리턴할 ArrayList 타입 변수 선언
			// 1개 레코드가 저장된 BoardDTO 객체 복수개를 하나의 묶음으로 관리할 ArrayList타입
			ArrayList boardList = null;
			
			try {
				// 0단계. DB 연결에 필요한 문자열 4개 저장
				String driver = "com.mysql.cj.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/study_jsp3";
				String user = "root";
				String password = "1234";

				// 1단계. 드라이버 클래스 로드
				Class.forName(driver);

				// 2단계. DB 연결
				Connection con = DriverManager.getConnection(url, user, password);
				
				
				// 3단계. sql구문 작성 및 전달
				//=>board 테이블의 모든 레코드 조회(idx컬럼 기준 내림차순 정렬)
				String sql = "SELECT * FROM board ORDER BY idx DESC";
				PreparedStatement pstmt = con.prepareStatement(sql);
				
				// 4단계. sql구문 실행 및 결과 처리
				ResultSet rs = pstmt.executeQuery();
				
				// 복수개의 레코드(복수개의 BoardDTO 객체)를 저장하는 ArrayList 객체 생성
				// => 반복문 실행 전 먼저 객체 생성한 후 반복문 내에서 BoardDTO 객체 저장 필수!
				boardList = new ArrayList();
				
				
				// 조회 결과 테이블을 반복문을 통해 레코드 반복 접근
				while(rs.next()) {
					// 1개 게시물 정보를 저장하는 BoardDTO 객체(board)생성
					BoardDTO board = new BoardDTO();
					
					// ResultSet 객체의 1개 레코드 각 컬럼데이터를 BoardDTO 객체에 저장
					
					board.setIdx(rs.getInt("idx"));
					board.setName(rs.getString("name"));
					board.setPasswd(rs.getString("passwd"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setDate(rs.getDate("date"));
					board.setReadcount(rs.getInt("readcount"));
					
					// while문을 통해 레코드를 반복하게 되면 최종적으로 BoardDTO 객체에는
					// 마지막 레코드 정보만 저장되어 있게 된다!
					
					// 복수개의 레코드(BoardDTO 객체)를 저장하는 ArrayList 객체 생성
					// boardList = new ArrayList();
					// 주의! 반복문 내에서 ArrayList 객체를 생성하는 경우
					// 매 반복 시마다 기존 ArrayList 객체가 제거되고 새로 생성되므로
					// 기존 데이터는 유지되지 못한다!
					// 따라서, 최소한 ArrayList 객체는 반복문보다 윗쪽에 위치해야함!!!
					
					// 1개 레코드 정보가 저장된 BoardDTO 객체를 ArrayList 객체에 추가(add())
					// => 주의! add() 메서드 파라미터 타입은 Object타입이므로
					// 	  BoardDTO 객체가 저장되는 시점에 Object 타입으로 업캐스팅이 일어남
					
					boardList.add(board);
					
					
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return boardList;
			
	}
	
	
	// 글 상세정보를 조회하는 selectContent() 메서드 정의
	// => 파라미터 : 글번호(idx) 리턴타입 : BoardDTO(board) 
	public BoardDTO selectContent(int idx) {
		
		BoardDTO board = null;
		
		try {
			// 0단계. DB 연결에 필요한 문자열 4개 저장
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/study_jsp3";
			String user = "root";
			String password = "1234";

			// 1단계. 드라이버 클래스 로드
			Class.forName(driver);

			// 2단계. DB 연결
			Connection con = DriverManager.getConnection(url, user, password);
			
			
			// 3단계. sql구문 작성 및 전달
			//=>board 테이블의 idx 컬럼값이 일치하는 레코드 조회
			String sql = "SELECT * FROM board WHERE idx=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			// 4단계. sql구문 실행 및 결과 처리
			ResultSet rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				// 1개 레코드 정보를 저장할 BoardDTO 객체 생성
				board = new BoardDTO();
				
				// ResultSet 객체의 1개 레코드 각 컬럼데이터를 BoardDTO 객체에 저장
				
				board.setIdx(idx);
				board.setName(rs.getString("name"));
				board.setPasswd(rs.getString("passwd"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setDate(rs.getDate("date"));
				board.setReadcount(rs.getInt("readcount"));
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 1개 게시물 정보가 저장된 BoardDTO 객체 리턴
		return board;
	}
	 
	public void updateReadcount(int idx) {
		
		
		try {
			// 0단계. DB 연결에 필요한 문자열 4개 저장
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/study_jsp3";
			String user = "root";
			String password = "1234";

			// 1단계. 드라이버 클래스 로드
			Class.forName(driver);

			// 2단계. DB 연결
			Connection con = DriverManager.getConnection(url, user, password);
			
			// 3단계. sql구문 작성 및 전달
			// =>게시물 조회 전 조회수(readcount)증가 작업(+1) 수행
			String sql = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			// 4단계. SQL구문 실행 및 결과 처리
			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}
	
	
}
