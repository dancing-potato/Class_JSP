package jsp11_javabean;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//study_jsp3.board 테이블의 데이터 처리 작업을 담당하는 BoardDAO클래스 저의
public class BoardDAO {
	
	// DB 연결 작업을 수행할 공통 메서드 getConnection() 메서드 정의
	// => 파라미터 : 없음    리턴타입 : java.sql.Connection 객체(con)
	public Connection getConnection() {
		// DB 연결 정보를 저장할 Connection 타입 변수 선언
		Connection con = null;
		
		// DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
		String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
		String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
		String user = "root"; // 계정명
		String password = "1234"; // 패스워드

		try {
			// 1단계. 드라이버 클래스 로드
			Class.forName(driver);

			// 2단계. DB 연결
			// => 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
			con = DriverManager.getConnection(url, user, password);
			// => SQLException 발생 가능성 있는 코드
		} catch (ClassNotFoundException e) {
			// 1단계(드라이버 로드) 작업 실패(예외 발생) 시 실행되는 코드 블럭(catch 블럭)
			System.out.println("드라이버 로드 실패! - " + e.getMessage());
			e.printStackTrace();	
		}  catch (SQLException e) {
			// 2단계(DB 연결) 작업 실패(예외 발생) 시 실행되는 코드 블럭(catch 블럭)
			System.out.println("DB 연결 실패! - " + e.getMessage());
			e.printStackTrace();
		}
		
		
		// DB 연결 정보가 저장된 Connection 객체 리턴
		return con;
	}
	
	// DB 자원을 반환하기 위한 close() 메서드 정의
	// => 파라미터는 Connection, PreparedStatement, ResultSet 을 각각 전달받아야 하므로
	//    메서드 오버로딩 활용
	public void close(Connection con) {
		try {
			if(con != null) { con.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	public void close(PreparedStatement pstmt) {
		try {
			if(pstmt != null) { pstmt.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close(ResultSet rs) {
		try {
			if(rs != null) { rs.close(); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		
	
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
		
		// finally 블럭에서 자원 반환을 위해서는 try 블럭 밖에서 변수 선언 필요
		Connection con = null;
		// 복수개의 구문을 각각 실행해야할 경우 PreparedStatement 타입 변수 복수개 선언
		// => Resource leak(자원 누수) 방지를 위해 별도의 변수를 사용 후 각각 close
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null;
		
		try {
//			 board 테이블에 폼 파라미터 사용하여 글쓰기 작업 수행(INSERT)
//			 => 단, 글번호(idx)는 가장 큰 번호 + 1 값으로 새로 설정
//			    작성일(date)은 데이터베이스의 now() 함수 사용
//			    조회수(readcount)는 기본값인 0 으로 설정
			
			// DB 연결 작업을 수행하는 공통메서드 getConnection() 호출하여 Connection 객체 리턴
			// => 기존 0단계,1단계, 2단계 코드가 중복되었으나 별도의 메서드로 분리(모듈화)하여 
			// 중복코드를 제거할 수 있다!
			// 0~2단계 공통작업
			con = getConnection();
			
			
			// 1) 새 글 번호 계산
			// => board 테이블의 모든 레코드의 idx 컬럼값 중 가장 큰 값 조회(데이터베이스 max() 함수 활용)
			int idx = 1; // 새 글 번호를 저장할 변수 선언(기본값 1)

			// 3단계. SQL 구문 작성 및 전달
			// => MySQL 의 MAX(컬럼명) 함수를 사용하면 특정 컬럼에서 가장 큰 값 조회 가능
			String sql = "SELECT MAX(idx) FROM board";
			pstmt = con.prepareStatement(sql);

			// 4단계. SQL 구문 실행 및 결과 처리
			rs = pstmt.executeQuery();

			// 다음 레코드가 존재할 경우 첫번째 컬럼 값(INT 타입) + 1 값을 idx 변수에 저장
			if(rs.next()) {
				idx = rs.getInt(1) + 1;
			}
			// -------------------------------------------------------------------------------------------
			// 2) 글 등록(INSERT) 작업 수행
			// 3단계. SQL 구문 작성 및 전달
			// => 작성일(6번 파라미터 : now() 함수 호출), 조회수(7번 파라미터 : 기본값 0)
			sql = "INSERT INTO board VALUES (?,?,?,?,?,now(),0)";
			pstmt2 = con.prepareStatement(sql);
			pstmt2.setInt(1, idx); // 새 글 번호
			// 작성자,패스워드,제목,내용은 BoardDTO객체에 저장되어 있으므로
			// BoardDTO 객체의 Getter메서드를 호출해 각 데이터를 꺼내서 setXXX()메서드에 전달
			pstmt.setString(2, board.getName()); // 작성자
			pstmt.setString(3, board.getPasswd()); // 패스워드
			pstmt.setString(4, board.getSubject()); // 제목
			pstmt.setString(5, board.getContent()); // 내용

			// 4단계. SQL 구문 실행 및 결과 처리
			// => INSERT 구문 실행 시 리턴되는 값(int 타입)을 insertCount 변수에 저장 후
			insertCount = pstmt2.executeUpdate();
		}  catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - insert() : " + e.getMessage());
			e.printStackTrace();
		} finally {
			// 예외 발생 여부와 관계없이 마지막에 항상 실행되는 블럭
			// 심지어 try~catch 블럭 내에서 return 문을 만나더라도 finally 블럭 실행 후 리턴
			// => 따라서, DB 애플리케이션에서 주로 자원반환 등의 용도로 사용되는 블럭
			//    관련 객체에서 지원하는 close() 메서드를 호출하여 자원 반환 가능
			// => 주의! 자원을 사용하기 위해 생성한 역순으로 반환해야함
			//    ex) Connection -> PreparedStatement -> ResultSet 순으로 생성되므로
			//        반환 시 ResultSet -> PreparedStatement -> Connection 순으로 반환(close())
//			try {
//				rs.close();
//				pstmt.close();
//				con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
			
			// 별도로 정의된 close() 메서드를 호출하여 자원을 반환할 객체를 파라미터로 전달
			close(rs);
			close(pstmt);
			close(pstmt2);
			close(con);
		}
		return insertCount;
	}
	
	//글 삭제 작업을 수행하는 delete() 메서드 정의
	// => 파라미터 : 삭제할 게시물 정보(BoardDTO 객체 - board)   리턴타입 : int(deleteCount)
	public int delete(BoardDTO board) {
		
		int deleteCount = 0;// 리턴값을 저장할 변수 선언
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 0~2단계 공통작업
			con = getConnection();
			

			// 3단계. SQL 구문 작성 및 전달
			// => 번호(idx)와 패스워드(passwd)가 모두 일치하는 게시물 삭제(DELETE) - 사용할 방법
			String sql = "DELETE FROM board WHERE idx=? AND passwd=?";
			pstmt = con.prepareStatement(sql);
			//글번호(idx)와 패스워드(passwd)는 BoardDTO객체로부터 꺼내기
			pstmt.setInt(1, board.getIdx());
			pstmt.setString(2, board.getPasswd());

			// 4단계. SQL 구문 실행 및 결과 처리
			deleteCount = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 구문 오류 발생! - delete()");
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(con);
		}
		
		return deleteCount;
	}// delete() 메서드 끝
	

	// 글목록 조회 작업을 수행하는 select() 메서드 정의
	//=>파라미터 : 없음   리턴타입 : java.util.ArrayList(boardList)
	public ArrayList select(){
			// 글목록 조회 결과를 리턴할 ArrayList 타입 변수 선언
			// 1개 레코드가 저장된 BoardDTO 객체 복수개를 하나의 묶음으로 관리할 ArrayList타입
			ArrayList boardList = null;
			
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				// 0~2단계 공통작업
				con = getConnection();
				
				
				// 3단계. sql구문 작성 및 전달
				//=>board 테이블의 모든 레코드 조회(idx컬럼 기준 내림차순 정렬)
				String sql = "SELECT * FROM board ORDER BY idx DESC";
				pstmt = con.prepareStatement(sql);
				
				// 4단계. sql구문 실행 및 결과 처리
				rs = pstmt.executeQuery();
				
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
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			return boardList;
			
	}
	
	
	// 글 상세정보를 조회하는 selectContent() 메서드 정의
	// => 파라미터 : 글번호(idx) 리턴타입 : BoardDTO(board) 
	public BoardDTO selectContent(int idx) {
		BoardDTO board = null;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// 0~2단계 공통작업
			con = getConnection();
			
			
			// 3단계. sql구문 작성 및 전달
			//=>board 테이블의 idx 컬럼값이 일치하는 레코드 조회
			String sql = "SELECT * FROM board WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			// 4단계. sql구문 실행 및 결과 처리
			rs = pstmt.executeQuery();
			
			
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
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		// 1개 게시물 정보가 저장된 BoardDTO 객체 리턴
		return board;
	}
	 
	public void updateReadcount(int idx) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			// 0~2단계 공통작업
			con = getConnection();
			
			// 3단계. sql구문 작성 및 전달
			// =>게시물 조회 전 조회수(readcount)증가 작업(+1) 수행
			String sql = "UPDATE board SET readcount=readcount+1 WHERE idx=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, idx);
			
			// 4단계. SQL구문 실행 및 결과 처리
			pstmt.executeUpdate();
			
		}  catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			close(pstmt);
			close(con);
		}
		
	}
	
	
}
